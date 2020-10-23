//
//  TrendingReposEntity.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation

// MARK: - TrendingReposEntityElement
struct TrendingReposEntityElement: Codable {
    let author, name: String
    let avatar: String
    let url: String
    let trendingReposEntityDescription, language, languageColor: String
    let stars, forks, currentPeriodStars: Int
    let builtBy: [BuiltBy]

    enum CodingKeys: String, CodingKey {
        case author, name, avatar, url
        case trendingReposEntityDescription = "description"
        case language, languageColor, stars, forks, currentPeriodStars, builtBy
    }
}

// MARK: - BuiltBy
struct BuiltBy: Codable {
    let href, avatar: String
    let username: String
}

typealias TrendingReposEntity = [TrendingReposEntityElement]
