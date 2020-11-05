//
//  BaseResponse.swift
//  UnionCoop
//
//  Created by azab on 11/3/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation

class BaseResponse<T: Codable>: Codable {
    
    var data: T?
}
