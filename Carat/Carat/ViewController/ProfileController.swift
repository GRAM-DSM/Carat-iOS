//
//  ProfileController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

protocol CustomMenuBarDelegate: class {
    func customMenuBar(scrollTo index: Int)
}


class ProfileController: UIViewController{
 
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
    @IBOutlet weak var collectionBar: UICollectionView!
    
    required init?(coder aDecoder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
       }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        self.collectionBar.delegate = self
        self.collectionBar.dataSource = self
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionBar.selectItem(at: selectedIndexPath as IndexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        modifyButton.layer.cornerRadius = 10
    }
    var customTabBarCollectionView: UICollectionView = {
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: collectionViewLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = UIColor.white
        return collectionView
    }()
    
    var indicatorView: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.black
        return view
    }()
    
    //MARK:  Properties
    var indicatorViewLeadingConstraint: NSLayoutConstraint!
    var indicatorViewWidthConstraint: NSLayoutConstraint!
    
    //MARK: Setup Views
    func setupCollectioView() {
        customTabBarCollectionView.delegate = self
        customTabBarCollectionView.dataSource = self
        customTabBarCollectionView.showsHorizontalScrollIndicator = false
        //customTabBarCollectionView.register(UINib(nibName: CustomCell.reusableIdentifier, bundle: nil), forCellWithReuseIdentifier: CustomCell.reusableIdentifier)
        customTabBarCollectionView.isScrollEnabled = false
        
        let indexPath = IndexPath(item: 0, section: 0)
        customTabBarCollectionView.selectItem(at: indexPath, animated: false, scrollPosition: [])
    }
    
    func setupCostomTabBar() {
        setupCollectioView()
        self.view.addSubview(customTabBarCollectionView)
       // customTabBarCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
       // customTabBarCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
       // customTabBarCollectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customTabBarCollectionView.heightAnchor.constraint(equalToConstant: 55).isActive = true
        
    }

}

extension ProfileController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopTabBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topTabBar", for: indexPath) as! TopTabBarCell
        
        let arrayText = ["캐링","캐럿"]
        cell.titleLabel.text = arrayText[indexPath.row]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
           return 0
    }
    
}

