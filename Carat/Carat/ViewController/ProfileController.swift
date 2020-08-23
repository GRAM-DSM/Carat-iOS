//
//  ProfileController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ProfileController: UIViewController {
    
    @IBOutlet weak var backgroundImage: UIImageView!
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLable: UILabel!
    @IBOutlet weak var idLable: UILabel!
    @IBOutlet weak var statusMessageLable: UILabel!
    @IBOutlet weak var modifyProfileButton: UIButton!
    @IBOutlet weak var subscriptionDateLabel: UILabel!
    @IBOutlet weak var followingLable: UILabel!
    @IBOutlet weak var followerLabel: UILabel!

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //프로필 수정 버튼 둥글게
        modifyProfileButton.layer.borderColor = UIColor.black.cgColor
        modifyProfileButton.layer.borderWidth = 1
        modifyProfileButton.layer.cornerRadius = 15
        
        //프로필 사진 둥글게
        profileImage.layer.borderWidth=1.0
        profileImage.layer.masksToBounds = false
        profileImage.layer.cornerRadius = profileImage.frame.size.height/2
        profileImage.clipsToBounds = true
      
    }
    
}
