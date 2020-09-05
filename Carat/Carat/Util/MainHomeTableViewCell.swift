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
    @IBOutlet weak var knowHowRecaringStackView: UIStackView!
    @IBOutlet weak var currentNameLabel: UILabel!
    @IBOutlet weak var profileImageLabel: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileIDLabel: UILabel!
    @IBOutlet weak var timeFromPostingLabel: UILabel!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet var uploadImageView: [UIImageView]!
    @IBOutlet weak var recaringButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var recaringSumLabel: UILabel!
    @IBOutlet weak var likeSumLabel: UILabel!
    @IBOutlet weak var allStackView: UIStackView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainTextView.sizeToFit()
        circleOfImage(profileImageLabel)
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
