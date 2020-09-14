//
//  PostingViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/08/23.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class PostingViewController: UIViewController{
    
    @IBOutlet weak var postMainTextView: UITextView!
    @IBOutlet weak var currentProfileImage: UIImageView!
    @IBOutlet weak var caringOKButton: UIButton!
    @IBOutlet weak var caringCancleButton: UIBarButtonItem!
    @IBOutlet weak var plusImageButton: UIButton!
    @IBOutlet var caringImage: [UIImageView]!
    
    private var httpClient = HTTPClient()
    private var Model = PostCaringModel()
    private let imagePicker = UIImagePickerController()
    private var imageArray = [UIImage?](repeating: nil, count: 4)
    private var captureImage = UIImage()
    private var flagImageSave: Bool = false
    private var confirmImage: Bool = true
    
    @IBAction func selectPlusImage(_ sender: UIButton){
        let alertController = UIAlertController(title: "이미지 불러오기", message: nil, preferredStyle: .actionSheet)
        let albumAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { (action) in
            self.openLibrary()
        }
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        alertController.addAction(albumAction)
        alertController.addAction(cancleAction)
        
        if !self.confirmImage {
            let alertController = UIAlertController(title: "경고", message: "더 이상 사진을 불러올 수 없습니다", preferredStyle: .alert)
            let alertAction = UIAlertAction(title: "확인", style: .default, handler: nil)
            
            alertController.addAction(alertAction)
            self.present(alertController, animated: true, completion: nil)
            
            self.plusImageButton?.isEnabled = false
        }
        self.present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func selectOKButton(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func selectCancleButton(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.navigationBar.barTintColor = .white
        caringOKButton.tintColor = .gray
        
        postMainTextView.font = UIFont(name: "116angmuburi", size: 18)
        postMainTextView.delegate = self
        setUpPlaceholder()
        
        imagePicker.delegate = self
        
        circleOfImage(currentProfileImage)
    }

    func openLibrary(){
        imagePicker.sourceType = .photoLibrary
        imagePicker.allowsEditing = false
        
        self.present(imagePicker, animated: true, completion: nil)
    }
    
    func setUpPlaceholder(){
        postMainTextView.text = "무슨 일이 일어나고 있나요?"
        postMainTextView.textColor = .lightGray
    }
    
    //UIViewController 중 터치 관련 메소드 중
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.postMainTextView.resignFirstResponder()
    }
    
    //MARK: Service
//
//    func createCaring(){
//        for image in imageArray {
//            Model.postImage = image
//        }
//        httpClient.post(NetworkingAPI.createCaring(Model.postingText, image: )))
//    }
    
}

extension PostingViewController: UITextViewDelegate{
    func textViewDidChange(_ textView: UITextView) {
        caringOKButton.tintColor = .systemPink
        
        let size = CGSize(width: 320, height: 180)
        let estimatedSize = textView.sizeThatFits(size)
        textView.constraints.forEach { (constraint) in
            if constraint.firstAttribute == .height{
                constraint.constant = estimatedSize.height
            }
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if postMainTextView.textColor == .lightGray {
            postMainTextView.text = ""
            postMainTextView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if postMainTextView.text.isEmpty {
            setUpPlaceholder()
        }
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    //글자 수 제한
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        let currentText = textView.text ?? ""
        guard let stringRange = Range(range, in: currentText) else { return false }
        
        let changedText = currentText.replacingCharacters(in: stringRange, with: text)
        return changedText.count <= 200
    }
}

extension PostingViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate{
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let image: UIImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage{

            for i in 0..<4 {
                if imageArray[i] == nil{
                    print("\(i)번째 이미지 넣으러감")
                    switch i {
                    case 0:
                        self.caringImage[i].image = image
                        dismiss(animated: true, completion: nil)
                        imageArray[i] = image
                        return
                    case 1:
                        self.caringImage[i].image = image
                        dismiss(animated: true, completion: nil)
                        imageArray[i] = image
                        return
                    case 2:
                        self.caringImage[i].image = image
                        dismiss(animated: true, completion: nil)
                        imageArray[i] = image
                        return
                    case 3:
                        self.caringImage[i].image = image
                        imageArray[i] = image
                        dismiss(animated: true, completion: nil)
                        self.confirmImage = true
                        return
                    default:
                        return
                    }
                }else {
                    print("pass")
                }
            }
        }
    }
}
