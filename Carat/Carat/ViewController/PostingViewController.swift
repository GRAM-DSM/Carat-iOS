//
//  PostingViewController.swift
//  Carat
//
//  Created by 이가영 on 2020/08/23.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class PostingViewController: UIViewController {

    @IBOutlet weak var postMainTextView: UITextView!
    @IBOutlet weak var currentProfileImage: UIImageView!
    @IBOutlet weak var caringOKButton: UIButton!
    @IBOutlet weak var caringCancleButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        navigationController?.navigationBar.barTintColor = .white
        caringOKButton.tintColor = .gray
        
        postMainTextView.font = UIFont(name: "116angmuburi", size: 18)
        postMainTextView.delegate = self
        setUpPlaceholder()
        
        circleOfImage(currentProfileImage)
    }
    
    @IBAction func caringOKButton(_ sender: UIButton){
        //데이터 전달 + post
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func caringCancleButton(_ sender: UIBarButtonItem){
        navigationController?.popViewController(animated: true)
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
