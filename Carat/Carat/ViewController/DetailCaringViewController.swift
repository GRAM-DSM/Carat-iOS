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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        circleOfImage(profileImageView)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        mainTextView.sizeToFit()
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
