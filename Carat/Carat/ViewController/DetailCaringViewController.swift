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
    
    @IBOutlet weak var uploadImageView1: UIImageView!
    @IBOutlet weak var uploadImageView2: UIImageView!
    @IBOutlet weak var uploadImageView3: UIImageView!
    @IBOutlet weak var uploadImageView4: UIImageView!
    
    @IBOutlet weak var viewOfBottom: UIView!
    @IBOutlet weak var dateFormatterLabel: UILabel!
    @IBOutlet weak var timeFormatterLabel: UILabel!
    @IBOutlet weak var recaringButton: UIButton!
    @IBOutlet weak var likeButton: UIButton!
    @IBOutlet weak var recaringSumButton: UILabel!
    @IBOutlet weak var likeSumButton: UILabel!
    @IBOutlet weak var scrollDetailView: UIScrollView!
    @IBOutlet weak var detailStackView: UIStackView!

    var detailModel: MainHomeModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
            
        scrollDetailView.delegate = self
        setUpDetailView()
        setUpViewBorder()
        
        circleOfImage(profileImageView!)
    }
    
    private func setUpDetailView(){
        profileImageView.image = UIImage(named: (detailModel.profileImage)!)
        profileNameLabel?.text = detailModel?.profileName
        profileIDLabel?.text = detailModel?.profileID
        
        for i in 0..<3 {
            if detailModel.uploadImageView[i] == nil{
                switch i {
                case 1:
                    self.uploadImageView1.isHidden = true
                case 2:
                    self.uploadImageView2.isHidden = true
                case 3:
                    self.uploadImageView3.isHidden = true
                case 4:
                    self.uploadImageView4.isHidden = true
                default:
                    print("셀 이미지")
                }
            }
        }
        
        mainTextView?.text = detailModel?.mainText
        timeFormatterLabel?.text = detailModel?.post_time
        
        recaringButton.isSelected = detailModel.recaring
        likeButton.isSelected = detailModel.carat
        
        recaringSumButton.text = String(detailModel.recaringSum)
        likeSumButton.text = String(detailModel.likeSum)
    }

    private func setUpViewBorder(){
        viewOfBottom.layer.borderWidth = 1
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

extension DetailCaringViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("스크롤 중")
    }
}
