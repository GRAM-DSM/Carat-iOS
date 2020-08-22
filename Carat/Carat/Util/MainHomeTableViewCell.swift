//
//  MainHomeTableViewCell.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainHomeTableViewCell: UITableViewCell {

    @IBOutlet weak var profileImageLabel: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileIDLabel: UILabel!
    @IBOutlet weak var timeFromPostingLabel: UILabel!
    @IBOutlet weak var mainTextView: UITextView!
    
    @IBOutlet weak var uploadImageView1: UIImageView!
    @IBOutlet weak var uploadImageView2: UIImageView!
    @IBOutlet weak var uploadImageView3: UIImageView!
    @IBOutlet weak var uploadImageView4: UIImageView!

    @IBOutlet weak var recaringButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var recaringSumLabel: UILabel!
    @IBOutlet weak var likeSumLabel: UILabel!
    
    var mainHomeCellModel: MainHomeModel!
    
    private var favorited: Bool = false
    private var recaring: Bool = false
    private var recaringSum: Int = 0
    private var likeSum: Int = 0
    
    private let viewModel = MainHomeViewModel()
    private let disposebag = DisposeBag()
    
    @IBAction func favoriteCarat(_ sendder: UIButton){
        
        if !favorited {
            viewModel.
            favorited = true
            likeButton.isSelected = favorited
            recaringSum += 1
        }else{
            favorited = false
            likeButton.isSelected = false
            likeSum -= 1
        }
    }
    
    @IBAction func reCaring(_ sender: UIButton){
        if !recaring {
            recaring = true
            recaringButton.isSelected = true
            recaringSum += 1
        }else{
            recaring = false
            recaringButton.isSelected = false
            recaringSum -= 1
        }
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
