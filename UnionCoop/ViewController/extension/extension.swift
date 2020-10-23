//
//  extension.swift
//  UnionCoop
//
//  Created by azab on 10/21/20.
//  Copyright © 2020 azab. All rights reserved.
//

import Foundation
import UIKit
import SDWebImage


extension ViewController : ITrendingReposView, UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.repos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reposCell", for: indexPath) as! TrendingReposTVCell
        
        cell.avatar.sd_setImage(with: URL(string: "\(repos[indexPath.row].avatar)"), placeholderImage: UIImage(named: "placeholder.png"))

        cell.authorLbl.text = repos[indexPath.row].author
        cell.nameLbl.text = repos[indexPath.row].name
        cell.descriptionLbl.text = repos[indexPath.row].trendingReposEntityDescription
        cell.languageLbl.text = repos[indexPath.row].language
        cell.starLbl.text = "\(repos[indexPath.row].stars)"
        cell.forkLbl.text = "\(repos[indexPath.row].forks)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        trendingReposTableView.deselectRow(at: indexPath, animated: true)
        if selectedIndex == indexPath.row {
            if isCollapse == false {
                isCollapse = true
            } else {
                isCollapse = false
            }
        } else{
           isCollapse = true
        }
        selectedIndex = indexPath.row
        trendingReposTableView.reloadRows(at: [indexPath], with: .automatic)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if selectedIndex == indexPath.row && isCollapse == true {
            return 250.0
        } else {
            return 80
        }
    }
    
    func renderTrendingRepos(repos:[TrendingReposEntityElement]) {
        
        if errorView != nil{
             errorView.removeFromSuperview()
        }
       
        self.repos = repos
        trendingReposTableView.reloadData()
        stopTimer()
        hideIndicator()
    }
    
    func showIndicator() {
        self.customIndicatorImageView.isHidden = false
    }
    
    func hideIndicator() {
        self.customIndicatorImageView.isHidden = true
    }
    
    func errorMessage(msg: String) {
        
        stopTimer()
        hideIndicator()
        self.view.insertSubview(errorView, at: 1)
    }
    
    func startTimer() {
        if timer == nil {
            timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
        }
    }
    
    @objc func animateView() {
        UIView.animate(withDuration: 0.8, delay: 0.0, options: .curveLinear, animations: {
            self.customIndicatorImageView.transform = self.customIndicatorImageView.transform.rotated(by: CGFloat(Double.pi))
        }, completion: { (finished) in
            if self.timer != nil {
                self.timer = Timer.scheduledTimer(timeInterval:0.0, target: self, selector: #selector(self.animateView), userInfo: nil, repeats: false)
            }
        })
    }
    
    func stopTimer() {
        timer?.invalidate()
        timer = nil
    }
    
}
