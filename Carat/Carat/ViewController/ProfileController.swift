//
//  ProfileController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ProfileController: UIViewController/*, UIScrollViewDelegate*/{
    var scrollView: UIScrollView!
    var imageView: UIImageView!
    
    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var introductionLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var followingLable: UILabel!
    @IBOutlet weak var followerLable: UILabel!
    @IBOutlet weak var followernum: UILabel!
    @IBOutlet weak var followingnum: UILabel!
    @IBOutlet weak var modifyButton: UIButton!
   // @IBOutlet weak var customTapbar: UIView!
    @IBOutlet weak var scrollViewContainerViewWidth: NSLayoutConstraint!
      

    override func viewDidLoad() {
        
        super.viewDidLoad()
        scrollViewContainerViewWidth.constant = UIScreen.main.bounds.size.width * 2
    }
    
    @IBAction func onAddChildController(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Other", bundle: nil)
        let addViewController = storyboard?.instantiateViewController(withIdentifier: "AddViewController")
        
       // self.addChild(addViewController)
       // self.view.addSubview(addViewController.view)
        
        addViewController?.didMove(toParent: self)
        
        
    }
  
}
extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("Current X,Y are X:\(scrollView.contentOffset.x), Y: \(scrollView.contentOffset.y)")
        let currentPage = Int(round(scrollView.contentOffset.x / scrollView.frame.size.width))
        print("current page : \(currentPage)")
    }
}
