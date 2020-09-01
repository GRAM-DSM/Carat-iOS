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
}

