//
//  TrendingReposPresenter.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation

class TrendingReposPresenter: ITrendingReposPresenter {
    
    var trendingRepoviewRef : ITrendingReposView!
    init(trendingRepoviewRef : ITrendingReposView) {
        self.trendingRepoviewRef = trendingRepoviewRef
    }
    
    func fetchRepos() {
        let trendingReposModelRef: TrendingReposModel = TrendingReposModel(trendingRepoPresenterRef: self)
        trendingReposModelRef.fetchedRepos()
    }
    
    func onSuccess(repos:[TrendingReposEntityElement]) {
        trendingRepoviewRef.renderTrendingRepos(repos: repos)
    }
    
    func onFail(message: String) {
        trendingRepoviewRef.errorMessage(msg: "")
    }
}
