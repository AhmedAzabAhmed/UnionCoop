//
//  TrendingRepos.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation

protocol ITrendingReposView : IBase {
    
    func renderTrendingRepos(repos:[TrendingReposEntityElement])
}
protocol ITrendingReposPresenter {
    func fetchRepos()
    func onSuccess(repos:[TrendingReposEntityElement])
    func onFail(message: String)
}
protocol ITrendingReposModel {
    func fetchedRepos()
}
