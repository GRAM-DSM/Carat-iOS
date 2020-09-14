//
//  FollowViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/09/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class FollowViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionBar: UICollectionView!
    
    private var followerData: FollowerModel?
    private var followingData: FollowingModel?
    private var didSelected: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        registerCell()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.collectionBar.delegate = self
        self.collectionBar.dataSource = self
        
        let selectedIndexPath = NSIndexPath(item: 0, section: 0)
        collectionBar.selectItem(at: selectedIndexPath as IndexPath, animated: true, scrollPosition: .centeredHorizontally)
        
        setHorizontalBar()
        
        followingData?.following.append(FollowModel(profile_image: "defaultProfile.jpeg", name: "name", email: "@dfjnw", following: true))
    }
    
    private func registerCell(){
        let nib = UINib(nibName: "FollowTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "followCell")
    }
    
    public var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?
    
    func setHorizontalBar() {
        let horizontalBarView = UIView()
        horizontalBarView.backgroundColor = UIColor.black
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(horizontalBarView)
        
        horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: collectionBar.leftAnchor)
        horizontalBarLeftAnchorConstraint?.isActive = true
        horizontalBarView.bottomAnchor.constraint(equalTo: self.collectionBar.bottomAnchor).isActive = true
        horizontalBarView.widthAnchor.constraint(equalTo: self.collectionBar.widthAnchor, multiplier: 1/2).isActive = true
        horizontalBarView.heightAnchor.constraint(equalToConstant: 4).isActive = true
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

extension FollowViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.tableView.dequeueReusableCell(withIdentifier: "followCell", for: indexPath) as! FollowTableViewCell
        
        cell.profileImageView.image = .add
        cell.followNameLabel.text = "NAME HERE"
        cell.folloewIDLabel.text = "ID"
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 68
    }
}

extension FollowViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: TopTabBarCell = collectionView.dequeueReusableCell(withReuseIdentifier: "topTabBar", for: indexPath) as! TopTabBarCell
        
        if indexPath.row == 0{
            self.tableView.reloadData()
        }else if indexPath.row == 1{
            self.tableView.reloadData()
        }
        
        let arrayText = ["팔로윙", "팔로워"]
        cell.titleLabel.text = arrayText[indexPath.row]
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.bounds.width / 2, height: view.bounds.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let x = CGFloat(indexPath.item) * view.frame.width / 2
        horizontalBarLeftAnchorConstraint?.constant = x
    }
}
