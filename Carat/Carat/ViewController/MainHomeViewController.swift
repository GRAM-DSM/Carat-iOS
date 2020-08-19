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

    var viewModel: MainHomeViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.tableView.reloadData()
        let nib = UINib(nibName: "MainHomeTableViewCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "mainHomeCell")
    }


    //MARK: UITableViewDelegate
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mainHomeCell", for: indexPath) as! MainHomeTableViewCell
        
        cell.profileNameLabel.text = "이가영"
        cell.profileIDLabel.text = "@abcdefg"
        cell.timeFromPostingLabel.text = "1시간"
        cell.mainTextView.text = "이야…. 오늘 경기 정말 실화냐? 처음에 축구였다가 농구로 바뀌고 갑자기 또 축구로 바뀌더니 비가와서 농구로 바뀌고, 그렇게 농구 확정이라고 했는데 비가 안와서 축구라니…. 정말 가슴이 웅장해진다…."
        cell.uploadImageView.image = .add
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let pushVC = (self.storyboard?.instantiateViewController(withIdentifier: "DetailCaringViewController"))!
        
        self.navigationController?.pushViewController(pushVC, animated: true)
    }
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 372
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
