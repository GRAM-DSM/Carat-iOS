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
    @IBOutlet var uploadImageView: [UIImageView]!
    
    @IBOutlet weak var currentNameLabel :UILabel!
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
    var caringId = String()
    var httpClient: HTTPClient = HTTPClient()
    override func viewDidLoad() {
        super.viewDidLoad()

        self.currentNameLabel.text = caringId
        navigationController?.navigationBar.barTintColor = .white

        scrollDetailView.delegate = self
        setUpDetailView()
        setUpViewBorder()
        circleOfImage(profileImageView!)
        detailViewCaring()
    }
    
    private func setUpDetailView(){
        profileImageView?.image = UIImage(named: detailModel.owner.profile_image)
        profileNameLabel?.text = detailModel.owner.email
        profileIDLabel?.text = detailModel.owner.id
        
        for i in 0..<4 {
            if let model = detailModel.body_images[i] {
                uploadImageView[i].image = UIImage(named: model)
            }else{
                uploadImageView[i].isHidden = true
            }
        }
        
        currentNameLabel.text = detailModel.recaring_name
        mainTextView?.text = detailModel.body
        timeFormatterLabel?.text = detailModel.post_time
        
        recaringButton.isSelected = detailModel.me_recaring
        likeButton.isSelected = detailModel.me_carat
        
        recaringSumButton.text = String(detailModel.recaring_count)
        likeSumButton.text = String(detailModel.carat_count)
    }

    func setUpViewBorder(){
        viewOfBottom.layer.borderWidth = 0.5
        viewOfBottom.layer.borderColor = UIColor.gray.cgColor
    }

    
    func detailViewCaring(){
        httpClient.get(NetworkingAPI.detailCaring(caringId)).responseJSON { (response) in
            switch response.response?.statusCode{
            case 200:
                print("get detailCaring")
                guard let value = response.data else {return}
                guard let model = try? JSONDecoder().decode(MainHomeModel.self, from: value) else {return}
                let pushVC = self.storyboard?.instantiateViewController(withIdentifier: "DetailCaringViewController") as! DetailCaringViewController
                pushVC.detailModel = model
                self.navigationController?.pushViewController(pushVC, animated: true)
            case 400:
                print("a bad Request")
            case 404:
                 print("Tweets to read do not exist")
            default:
                print("i don't know")
            }
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

public func circleOfImage(_ imageView: UIImageView) -> Void {
    imageView.layer.cornerRadius = imageView.bounds.width / 2
}

extension DetailCaringViewController: UIScrollViewDelegate{
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        print("스크롤 중입니다")
    }
}
