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
    
    @IBOutlet weak var caringStackView: UIStackView!
    @IBOutlet weak var caringImage1: UIImageView!
    @IBOutlet weak var caringImage2: UIImageView!
    @IBOutlet weak var caringImage3: UIImageView!
    @IBOutlet weak var caringImage4: UIImageView!
    
    private let imagePicker = UIImagePickerController()
    private var imageArray: [UIImage?] = []
    private var captureImage = UIImage()
    private var flagImageSave: Bool = false

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
    
//    override func viewDidAppear(_ animated: Bool) {
//        print("viewdidAppear")
//        self.caringImageCollectionView.reloadData()
//    }
    
    @IBAction func caringPlusImage(_ sender: UIButton){
        
        let alertController = UIAlertController(title: "이미지 불러오기", message: nil, preferredStyle: .actionSheet)
        let albumAction = UIAlertAction(title: "앨범에서 가져오기", style: .default) { (action) in
            self.openLibrary()
        }
        
        let cancleAction = UIAlertAction(title: "취소", style: .cancel)
        
        alertController.addAction(albumAction)
        alertController.addAction(cancleAction)
        
        present(alertController, animated: true, completion: nil)
    }
    
    @IBAction func caringOKButton(_ sender: UIButton){
        //데이터 전달 + post
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func caringCancleButton(_ sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
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

    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension PostingViewController: UITextViewDelegate{
    
    //높이 동적으로..
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
            
            //1. 이미 들어간 이미지가 있는지 찾는다
            //2. 들어간 이미지가 있으면 빠져나옴
            //3. 들어간 이미지가 없으면 거기에 이미지 넣기
            //4, switch-case문으로 집어넣기
            
            for i in 0..<3 {
                if imageArray[i] == nil {
                    switch i {
                    case 0:
                        self.caringImage1.image = image
                    case 1:
                        self.caringImage2.image = image
                    case 2:
                        self.caringImage3.image = image
                    case 3:
                        self.caringImage4.image = image
                    default:
                        print("\(i)번째 이미지 지나감")
                    }
                    imageArray.append(image)
                }else {
                    print("pass")
                }
            }
            self.caringImage1.image = image
        }
        dismiss(animated: true, completion: nil)
    }
}
