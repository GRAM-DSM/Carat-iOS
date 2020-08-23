//
//  MainHomeViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class MainHomeViewController: UITableViewController {
    
    private let viewModel = MainHomeViewModel()
    public var Model = [MainHomeModel]()
    private let httpClient = HTTPClient()
    let disposeBag = DisposeBag()
    
    lazy var floatingButton: UIButton = {
         let button = UIButton(frame: .zero)
         button.translatesAutoresizingMaskIntoConstraints = false
         button.backgroundColor = .systemPink
         button.addTarget(self, action: #selector(fabTapped), for: .touchUpInside)
         return button
     }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .white

        Model.append(MainHomeModel(profileImage: nil, profileName: "뫙뫙", profileID: "#$@#ㅆ", mainText: "이야 오늘경기 정말", uploadImageView: ["like.jpeg", "recaring.jpeg", "selectedLike.jpeg"], post_time: "!3;532", recaringSum: 123, likeSum: 345, recaring: false, carat: false))
        Model.append(MainHomeModel(profileImage: nil, profileName: "뫙", profileID: "@ㄹㅇㄴ라", mainText: "이야…. 오늘 경기 정말 실화냐? 처음에 축구였다가 농구로 바뀌고 갑자기 또 축구로 바뀌더니 비가와서 농구로 바뀌고, 그렇게 농구 확정이라고 했는데 비가 안와서 축구라니…. 정말 가슴이 웅장해진다….", uploadImageView: ["like.jpeg", "recaring.jpeg", "selectedLike.jpeg"], post_time: "234",recaringSum: 123, likeSum: 345, recaring: true, carat: false))
        Model.append(MainHomeModel(profileImage: nil, profileName: "뫙", profileID: "@ㄹㅇㄴ라", mainText: "이야…. 오늘 경기 정말 실화냐? 처음에 축구였다가 농구로 바뀌고 갑자기 또 축구로 바뀌더니 비가와서 농구로 바뀌고, 그렇게 농구 확정이라고 했는데 비가 안와서 축구라니…. 정말 가슴이 웅장해진다….", uploadImageView: ["like.jpeg", "recaring.jpeg", "selectedLike.jpeg"], post_time: "234", recaringSum: 234, likeSum: 44, recaring: false, carat: false))
        
        self.viewModel.firstLoadCaring()
        self.tableView.reloadData()
        let nib = UINib(nibName: "MainHomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainHomeCell")
        
        self.tabBarItem.image = UIImage(named: "home_empty.jpeg")
        self.tabBarItem.selectedImage = UIImage(named: "home_fill.jpeg")
        refreshControl = UIRefreshControl()
        refreshControl?.attributedTitle = NSAttributedString(string: "당겨서 새로고침")
        refreshControl?.addTarget(self, action: #selector(MainHomeViewController.refresh), for: .valueChanged)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if let view = UIApplication.shared.windows.filter({$0.isKeyWindow}).first{
            view.addSubview(floatingButton)
            setUpButton()
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let view = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, floatingButton.isDescendant(of: view) {
            floatingButton.removeFromSuperview()
        }
    }
    
    func setUpButton(){
        NSLayoutConstraint.activate([
            floatingButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            floatingButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100),
            floatingButton.heightAnchor.constraint(equalToConstant: 80),
            floatingButton.widthAnchor.constraint(equalToConstant: 80)
        ])
        floatingButton.layer.cornerRadius = 40
        floatingButton.layer.masksToBounds = true
        floatingButton.layer.borderColor = UIColor.systemPink.cgColor
        floatingButton.layer.borderWidth = 4
        
    }
    
    @objc func fabTapped(){
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PostingViewController") as! PostingViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
        
        print("button tapped")
    }
    
    @objc func refresh(){
        print("refresh")
        self.viewModel.loadFreshCaring()
        self.refreshControl?.endRefreshing()
    }
    
    @IBAction func moreCaringView(_ sender: UIButton){
        self.tableView.reloadData()
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainHomeCell", for: indexPath) as! MainHomeTableViewCell
        
        if Model[indexPath.row].profileImage == nil{
            Model[indexPath.row].profileImage = "defaultProfile.jpeg"
        }
        
        cell.profileNameLabel.text = Model[indexPath.row].profileName
        cell.profileImageLabel.image = UIImage(named: Model[indexPath.row].profileImage!)
        cell.profileIDLabel.text = Model[indexPath.row].profileID
        cell.mainTextView.text = Model[indexPath.row].mainText
        
        //imageview1, 2, 3, 4마다..
        for i in 0..<3 {
            if Model[indexPath.row].uploadImageView[i] == nil{
                switch i {
                case 1:
                    cell.uploadImageView1.isHidden = true
                case 2:
                    cell.uploadImageView2.isHidden = true
                case 3:
                    cell.uploadImageView3.isHidden = true
                case 4:
                    cell.uploadImageView4.isHidden = true
                default:
                    print("셀 이미지")
                }
            }
        }
        
        cell.recaringButton.isSelected = Model[indexPath.row].recaring
        cell.likeButton.isSelected = Model[indexPath.row].carat
        cell.recaringSumLabel.text = String(Model[indexPath.row].recaringSum)
        cell.likeSumLabel.text = String(Model[indexPath.row].likeSum)
        cell.timeFromPostingLabel.text = Model[indexPath.row].post_time
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailCaringViewController") as! DetailCaringViewController
        
        pushVC.detailModel = Model[indexPath.row]
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.Model.count
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if Model[indexPath.row].uploadImageView.isEmpty {
            return 200
        } else {
            return 372
        }
        
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
