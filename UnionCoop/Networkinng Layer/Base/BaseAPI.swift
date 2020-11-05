//
//  BaseAPI.swift
//  UnionCoop
//
//  Created by azab on 11/3/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation
import Alamofire

class BaseAPI<T: TargetType> {
    
    func fetchData<M: Codable>(target: T, responseClass: M.Type, completion:@escaping (Result<M?>) -> Void ) {
        
        let method = Alamofire.HTTPMethod(rawValue: target.method.rawValue)
        //        let headers = Alamofire.HTTPHeaders(from: target.headers ?? [:])
        //        let params = buildParams(task: target.task)
        
        Alamofire.request(target.baseURL + target.path, method: method!).validate().responseData { response in
            switch response.result {
            case .success (_):
                
                guard let data = response.data else { return }
                do {
                    
                    let decoder = JSONDecoder()
                    
                    let result = try decoder.decode(M.self, from: data)
                    
                    completion(.success(result))
                }
                catch {
                    print(error)
                }
                
                break
            case .failure(_):
                completion(.failure(NSError(domain: target.baseURL, code: 0, userInfo: [NSLocalizedDescriptionKey: "Error Message"])))
                // self.trendingRepoPresenterRef.onFail(message: "Error in Loading Data")
                break
            }
        }
    }
    
    func buildParams(task: Task) -> ([String:Any], ParameterEncoding) {
        switch task {
        case .requestPlain:
            return ([:], URLEncoding.default)
        case .requestParameters(parameters: let parameters, encoding: let encoding):
            return (parameters, encoding)
        }
    }
}
