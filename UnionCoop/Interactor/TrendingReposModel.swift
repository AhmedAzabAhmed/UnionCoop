//
//  TrendingReposModel.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation
import Alamofire

class TrendingReposModel: BaseAPI<TrendingReposNetworking>, ITrendingReposModel {
    
    var trendingRepoPresenterRef : ITrendingReposPresenter!
    init(trendingRepoPresenterRef : ITrendingReposPresenter) {
        self.trendingRepoPresenterRef = trendingRepoPresenterRef
    }
    
    func fetchedRepos() {
        
        self.fetchData(target: .getRepos, responseClass: [TrendingReposEntityElement].self) { (result) in
            
            switch result {
            case .success(let response):
                self.trendingRepoPresenterRef.onSuccess(repos: response!)
                break
                
            case .failure(_):
                self.trendingRepoPresenterRef.onFail(message: "Error in Loading Data")
                break
            }
        }
        
//        let url = "https://private-anon-0e810e4166-githubtrendingapi.apiary-mock.com/repositories"
//
//        Alamofire.request(url, method: .get, parameters: ["language": "swift", "since":"daily", "spoken_language_code":"English"]).validate().responseData { response in
//            switch response.result {
//            case .success (_):
//
//                guard let data = response.data else { return }
//                do {
//                    let decoder = JSONDecoder()
//
//                    let result = try decoder.decode([TrendingReposEntityElement].self, from: data)
//
//                    self.trendingRepoPresenterRef.onSuccess(repos: result)
//                }
//                catch {
////                    print(error)
//                }
//
//                break
//            case .failure(_):
//
//                self.trendingRepoPresenterRef.onFail(message: "Error in Loading Data")
//                break
//            }
//        }
    }
}
