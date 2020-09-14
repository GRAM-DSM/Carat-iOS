//
//  MainHomeViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class MainHomeViewController: UITableViewController {
    private var resultModel: TimeLineResult = TimeLineResult()
    private var model: [MainHomeModel] = [MainHomeModel]()
    private let httpClient = HTTPClient()

    lazy var floatingButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .systemPink
        button.addTarget(nil, action: #selector(floatingBtn), for: .touchUpInside)
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .white
        self.tableView.reloadData()
        
        model.append(MainHomeModel(recaring_name: "who", owner: Owner(id: "걸걸", email: "arjnav", profile_image: "postingIcon"), post_time: "23.432;32", body: "이야 오늘경기 정말", body_images: ["like.jpeg", "recaring.jpeg", "selectedLike.jpeg", nil], carat_count: 3, recaring_count: 4, me_recaring: false, me_carat: false))
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 160

        self.firstLoadCaring()
        
        registerCell()
        
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
        tableView.reloadData()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if let view = UIApplication.shared.windows.filter({$0.isKeyWindow}).first, floatingButton.isDescendant(of: view) {
            floatingButton.removeFromSuperview()
        }
    }
    
    //MARK: private function
    private func registerCell(){
        let nib = UINib(nibName: "MainHomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainHomeCell")
    }
    
    
    // 호출 될 때마다 +1 되어서 마지막 호출을 구분하기 위한 전역 변수
    var addDataCallCount: Int = 0
    
    private func addData() {
        let count: Int = resultModel.result.count
        self.getLoadFreshCaring()
        addDataCallCount += 1
        DispatchQueue.main.async {
            self.tableView.reloadData()
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
    
    @objc func floatingBtn(){
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "PostingViewController") as! PostingViewController
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    @objc func refresh(){
        print("refresh")
        self.refreshControl?.endRefreshing()
    }
    
    @objc func selectRecarings(sender: UIButton){
        print(sender.tag)
        if resultModel.result[sender.tag].me_recaring == true {
            cancleRecaring(sender.tag)
            sender.isSelected = false
        }else{
            createRecaring(sender.tag)
            sender.isSelected = true
        }
    }
    
    @objc func selectCarat(sender: UIButton){
        print(sender.tag)
        if resultModel.result[sender.tag].me_carat == true {
            cancleCarat(sender.tag)
            sender.isSelected = false
        }else{
            createCarat(sender.tag)
            sender.isSelected = true
        }
    }
    
    //MARK: UITableViewDelegate, UITableViewDataSource
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainHomeCell", for: indexPath) as! MainHomeTableViewCell

        cell.profileNameLabel.text = resultModel.result[indexPath.row].owner.email
        cell.profileImageLabel.image = UIImage(named: resultModel.result[indexPath.row].owner.profile_image)
        cell.profileIDLabel.text = resultModel.result[indexPath.row].owner.id
        cell.mainTextView.text = resultModel.result[indexPath.row].body
        cell.currentNameLabel.text = resultModel.result[indexPath.row].recaring_name
        
        for i in 0..<4 {
            if resultModel.result[indexPath.row].body_images[i] != nil{
                let imageURL = resultModel.result[indexPath.row].body_images[i]
                let url: URL! = URL(string: imageURL!)
                let imageData = try! Data(contentsOf: url)
                let imageView = UIImage(data: imageData)
                
                DispatchQueue.main.async(execute: {
                    NSLog("비동기 방식으로 실행되는 부분입니다")
                    cell.uploadImageView[i].image = imageView
                })
            }else{
                cell.uploadImageView[i].isHidden = true
            }
        }
        
        cell.recaringButton.tag = indexPath.row
        cell.recaringButton.addTarget(self, action: #selector(selectRecarings(sender:)), for: .touchUpInside)
        cell.likeButton.tag = indexPath.row
        cell.likeButton.addTarget(self, action: #selector(selectCarat(sender:)), for: .touchUpInside)
        cell.recaringSumLabel.text = String(resultModel.result[indexPath.row].recaring_count)
        cell.likeSumLabel.text = String(resultModel.result[indexPath.row].carat_count)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailCaringViewController") as! DetailCaringViewController
        pushVC.caringId = resultModel.result[indexPath.row].caring_id
        self.navigationController?.pushViewController(pushVC, animated: true)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.resultModel.result.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if indexPath.row > resultModel.result.count - 2{
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                if tableView.visibleCells.contains(cell){
                    self.addData()
                }
            }
        }
    }
    override func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    //MARK: Service
    func getLoadFreshCaring() {
        httpClient.get(NetworkingAPI.timeLine(4, resultModel.result.last?.post_time ?? "")).responseJSON(completionHandler: { [weak self] (response) in
            guard let strongSelf = self else {return}
            switch response.response?.statusCode{
            case 200:
                guard let value = response.data else {return}
                guard let model = try? JSONDecoder().decode([MainHomeModel].self, from: value) else {return}
                for i in 0...model.count - 1{
                    if model[i].recaring_id != "" {
                        strongSelf.resultModel.result.append(model[i])
                    }
                }
                DispatchQueue.main.async {
                    self?.tableView.reloadData()
                }
            default:
                print("아직")
            }
        })
    }
    
    func firstLoadCaring(){
        httpClient.get(NetworkingAPI.timeLine(4,"")).responseJSON(completionHandler: { [weak self] (response) in
            guard let strongSelf = self else {return}
            switch response.response?.statusCode {
            case 200:
                print("loadCaring succesful")
                guard let value = response.data else {return}
                guard let model = try? JSONDecoder().decode([MainHomeModel].self, from: value) else { return }
                //??
                strongSelf.resultModel.result.append(contentsOf: model)
            case 400:
                print("bad request")
            case 401:
                print("your request has been forbidden")
            default:
                print("default")
            }
        })
    }
    
    func createRecaring(_ indexPath: Int) {
        httpClient.post(NetworkingAPI.createRecaring(resultModel.result[indexPath].caring_id)).responseJSON { (response) in
            switch response.response?.statusCode {
            case 201:
                print("No content")
            case 400:
                print("a bad Request")
            case 401:
                 print("your request has been forbidden")
            case 404:
                 print("Tweets to read do not exist")
            default:
                print("i don't know")
            }
        }
    }
    
    func cancleRecaring(_ indexPath: Int){
        httpClient.delete(NetworkingAPI.cancleRecaring(resultModel.result[indexPath].caring_id)).responseJSON { (response) in
            switch response.response?.statusCode{
            case 204:
                print("No content")
            case 400:
                print("a bad Request")
            case 401:
                 print("your request has been forbidden")
            case 404:
                 print("Tweets to read do not exist")
            default:
                print("알수없느오류")
            }
        }
    }

    func createCarat(_ indexPath: Int){
        httpClient.post(NetworkingAPI.createLike(resultModel.result[indexPath].caring_id)).responseJSON { (response) in
            switch response.response?.statusCode {
            case 200:
                print("로직 생각 중")
            case 403:
                print("your request has been forbidden")
            case 404:
                print("tweets to add carat do not exist")
            default:
                print("default")
            }
        }
    }

    func cancleCarat(_ indexPath: Int){
        httpClient.delete(NetworkingAPI.cancleLike(resultModel.result[indexPath].caring_id)).responseJSON { (response) in
            switch response.response?.statusCode{
            case 200:
                print("")
            case 403:
                print("your request has been forbidden")
            case 404:
                print("tweets to add carat do not exist")
            default:
                print("알수없느오류")
            }
        }
    }
}
