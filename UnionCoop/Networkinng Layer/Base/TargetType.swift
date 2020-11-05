//
//  TargetType.swift
//  UnionCoop
//
//  Created by azab on 11/3/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation
import Alamofire

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
    case put = "PUT"
    case delete = "DELETE"
}

enum Task {
    
    // A request with no additional data (no params)
    case requestPlain
    
    // A request body set with encoded parameters
    case requestParameters(parameters: [String: Any], encoding: ParameterEncoding)
}

protocol TargetType {
    
    /// The target's base `URL`.
    var baseURL: String { get }
    
    /// The path to be appended to `baseURL` to form the full `URL`
    var path: String { get }
    
    /// The HTTP method used in the request
    var method: HTTPMethod { get }
    
    /// The type of HTTP task to be performed
    var task: Task { get }
    /// The headers to be used in the request.
    var headers: [String: String]? { get }
}
