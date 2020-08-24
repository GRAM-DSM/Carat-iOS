//
//  ProfileController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class ProfileController: UIViewController, UIScrollViewDelegate {

  var scrollView : UIScrollView!
  var imageView : UIImageView!
  
  override func viewDidLoad() {

    super.viewDidLoad()

    //create background Image
    imageView = UIImageView(image: UIImage(named: "background"))
    imageView.frame = CGRect(origin: imageView.frame.origin, size: CGSize(width: view.frame.width, height: imageView.frame.height))
    imageView.contentMode = .center

    //create scrollView
    scrollView = UIScrollView(frame: view.bounds)
    scrollView.delegate = self
    scrollView.bounces = true
    scrollView.contentSize = CGSize(width: view.bounds.width,
                    height: view.bounds.height * 2)
    view.addSubview(scrollView)
  }

  func scrollViewDidScroll(_ scrollView: UIScrollView) {

    let positionY = scrollView.contentOffset.y

    if positionY < 0 {
      let scale = 1 + ((-positionY) * 2 / imageView.frame.height)
      imageView.transform = CGAffineTransform.identity
      imageView.transform = CGAffineTransform(scaleX: scale, y: scale)
      
      var imageViewFrame = imageView.frame
      imageViewFrame.origin.y = positionY
      imageView.frame = imageViewFrame

      }

  }

}
