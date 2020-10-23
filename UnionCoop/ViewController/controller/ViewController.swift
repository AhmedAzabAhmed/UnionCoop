//
//  ViewController.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var selectedIndex = -1
    var isCollapse = false
    
    @IBOutlet weak var errorViewHeightConstraint: NSLayoutConstraint!
    
    var repos:[TrendingReposEntityElement] = [TrendingReposEntityElement]()
    
    @IBOutlet weak var trendingReposTableView: UITableView!
    @IBOutlet weak var errorView: UIView!
    
    @IBOutlet weak var retryBtn: UIButton!
    
    
    
    @IBOutlet weak var customIndicatorImageView: UIImageView! {
        didSet {
            customIndicatorImageView.image = UIImage(named: "loader")
        }
    }
    
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.50, 168, 82
        
        
        retryBtn.layer.cornerRadius = 10
        retryBtn.layer.borderWidth = 1
        retryBtn.layer.borderColor = UIColor(red: 50 / 255.0,
                                             green: 168 / 255.0,
                                             blue: 82 / 255.0,
                                             alpha: 1.0).cgColor
        trendingReposTableView.register(UINib(nibName: "TrendingReposTVCell", bundle: nil), forCellReuseIdentifier: "reposCell")
        
        //        errorView.removeFromSuperview()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        let trendingReposPresenterRef : TrendingReposPresenter = TrendingReposPresenter(trendingRepoviewRef: self)
        trendingReposPresenterRef.fetchRepos()
        startTimer()
    }
    
    @IBAction func reloadData(_ sender: Any) {
        startTimer()
        showIndicator()
        let trendingReposPresenterRef : TrendingReposPresenter = TrendingReposPresenter(trendingRepoviewRef: self)
        trendingReposPresenterRef.fetchRepos()
    }
}

