//
//  MainHomeTableViewCell.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class MainHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageLabel: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileIDLabel: UILabel!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var stackView: UIStackView!
    @IBOutlet weak var recaringButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var timeFromPostingLabel: UILabel!
    
    var favorited: Bool = false
    
    @IBAction func favoriteCarat(_ sendder: UIButton){
        
    }
    
    @IBAction func reCaring(_ sender: UIButton){
        setSelected(true, animated: true)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        circleOfImage(profileImageLabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
