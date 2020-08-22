//
//  DetailCaringViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/08/17.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class DetailCaringViewController: UIViewController {

    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileIDLabel: UILabel!
    @IBOutlet weak var mainTextView: UITextView!
    @IBOutlet weak var uploadImageView: UIImageView!
    @IBOutlet weak var dateFormatterLabel: UILabel!
    @IBOutlet weak var timeFormatterLabel: UILabel!
    @IBOutlet weak var recaringButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var recaringSumButton: UILabel!
    @IBOutlet weak var likeSumButton: UILabel!
    
    var detailModel: MainHomeModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        profileImageView.image = UIImage(named: (detailModel.profileImage)!)
        profileNameLabel?.text = detailModel?.profileName
        profileIDLabel?.text = detailModel?.profileID
        mainTextView?.text = detailModel?.mainText
        timeFormatterLabel?.text = detailModel?.timeFromCaring
        
        recaringButton.isSelected = detailModel.recaring
        likeButton.isSelected = detailModel.carat
        
        recaringSumButton.text = String(detailModel.recaringSum)
        likeSumButton.text = String(detailModel.likeSum)
        circleOfImage(profileImageView!)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    
}

public func circleOfImage(_ imageView: UIImageView) -> Void {
    imageView.layer.cornerRadius = imageView.bounds.width / 2
}
