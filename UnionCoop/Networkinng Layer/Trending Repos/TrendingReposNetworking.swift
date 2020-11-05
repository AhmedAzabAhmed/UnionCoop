//
//  TrendingReposNetworking.swift
//  UnionCoop
//
//  Created by azab on 11/3/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation
import Alamofire

enum TrendingReposNetworking {
    case getRepos
}

extension TrendingReposNetworking: TargetType {
    
    var baseURL: String {
        switch self {
        case .getRepos:
            return "https://private-anon-8b6e2959cd-githubtrendingapi.apiary-mock.com"
        }
    }
    
    var path: String {
        switch self {
        case .getRepos:
            return "/repositories"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case .getRepos:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .getRepos:
            return .requestParameters(parameters: ["language": "swift", "since":"daily", "spoken_language_code":"English"], encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        default:
            return [:]
        }
    }
}
