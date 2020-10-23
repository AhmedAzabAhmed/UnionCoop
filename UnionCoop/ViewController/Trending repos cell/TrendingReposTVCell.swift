//
//  TrendingReposTVCell.swift
//  UnionCoop
//
//  Created by azab on 10/22/20.
//  Copyright © 2020 azab. All rights reserved.
//

import UIKit

class TrendingReposTVCell: UITableViewCell {
    
    @IBOutlet weak var avatar: UIImageView!
    @IBOutlet weak var languageImg: UIImageView!
    @IBOutlet weak var starImg: UIImageView!
    @IBOutlet weak var forkImg: UIImageView!
    
    
    @IBOutlet weak var authorLbl: UILabel!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var languageLbl: UILabel!
    @IBOutlet weak var starLbl: UILabel!
    @IBOutlet weak var forkLbl: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        avatar.layer.cornerRadius = 33
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
