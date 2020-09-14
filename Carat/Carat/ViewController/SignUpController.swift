//
//  SignUpController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class SignUpController: UIViewController {
  
  @IBOutlet weak var textLabel: UILabel!
  @IBOutlet weak var nameLable: UILabel!
  @IBOutlet weak var nameTextfield: UITextField!
  @IBOutlet weak var emailLabel: UILabel!
  @IBOutlet weak var emailTextfield: UITextField!
  @IBOutlet weak var passwordLable: UILabel!
  @IBOutlet weak var passwordTextfield: UITextField!
  @IBOutlet weak var signUpButton: UIButton!
  @IBOutlet weak var logInButton: UIButton!

    
    let httpClient = HTTPClient()
    
  override func viewDidLoad() {

    super.viewDidLoad()
    
    signUpButton.layer.borderColor = UIColor.systemPink.cgColor
    signUpButton.layer.borderWidth = 2
    
    signUpButton.layer.cornerRadius = 10
    
    self.textfieldBorderlineStyle(nameTextfield)
    self.textfieldBorderlineStyle(emailTextfield)
    self.textfieldBorderlineStyle(passwordTextfield)
    
  }

  func textfieldBorderlineStyle(_ nameOfTextField: UITextField){

      let border = CALayer()
    let width = CGFloat(1.0)

    border.borderColor = UIColor.darkGray.cgColor
    border.frame = CGRect(x: 0, y: nameOfTextField.frame.size.height - width, width: nameOfTextField.frame.size.width, height: nameOfTextField.frame.size.height)
    border.borderWidth = width
    nameOfTextField.layer.addSublayer(border)
    nameOfTextField.layer.masksToBounds = true

  }
    
    func signUp(name: String, email: String, password: String) {
        httpClient.post(NetworkingAPI.signUp(name, email, password)).responseJSON(completionHandler: { [weak self] (response) in
            guard let strongSelf = self else { return }
            switch response.response?.statusCode {
            case 200:
                guard let value = response.data else { return }
                guard let model = try? JSONDecoder().decode(SignUpModel.self, from: value) else { return }
                Token.token = model.token
            case 400:
                print("Bad Request")
            case 409:
                print("Conflict")
            }
        })
    }
}

