//
//  FollowTableViewCell.swift
//  Carat
//
//  Created by 이가영 on 2020/09/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class FollowTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var followNameLabel: UILabel!
    @IBOutlet weak var folloewIDLabel: UILabel!
    @IBOutlet weak var followButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        circleOfImage(profileImageView!)
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
