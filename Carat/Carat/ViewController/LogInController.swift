//
//  LogInController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class LogInController: UIViewController {
    
    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!
    
    let httpclient = HTTPClient()
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        self.textfieldBorderlineStyle(emailTextfield)
        self.textfieldBorderlineStyle(passwordTextfield)
        
        
    }
    
    func textfieldBorderlineStyle(_ nameOfTextField: UITextField) {
        
        let border = CALayer()
        let width = CGFloat(1.0)
        
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: nameOfTextField.frame.size.height - width, width: nameOfTextField.frame.size.width, height: nameOfTextField.frame.size.height)
        
        border.borderWidth = width
        nameOfTextField.layer.addSublayer(border)
        nameOfTextField.layer.masksToBounds = true
    }
    
    @IBAction func moveNext(_ sender: Any) {
        guard  let move = self.storyboard?.instantiateViewController(withIdentifier: "MainHomeViewController") else { return }
        self.present(move, animated: true)
    }
    
    func login(email : String, password: String) {
        httpclient.post(NetworkingAPI.Login(email, password)).responseJSON(completionHandler: {
            [weak self] (response) in
            switch response.response?.statusCode {
            case 200:
                guard let value = response.data else { return }
                guard let model = try? JSONDecoder().decode(LogInModel.self, from: value) else { return }
            case 400:
                print("Bad Request")
            case 403:
                print("Forbidden")
            case 404:
                print("Not Found")
            default:
                print("알 수 없는 오류")
                
            }
        })
    }
}



