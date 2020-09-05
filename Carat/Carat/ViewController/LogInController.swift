//
//  LogInController.swift
//  Carat
//
//  Created by 문지수 on 2020/08/18.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit



class LogInController: UIViewController {

    @IBOutlet weak var textLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordLable: UILabel!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var logInButton: UIButton!
    @IBOutlet weak var forgetPasswordLabel: UILabel!
    @IBOutlet weak var signUpButton: UIButton!

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
    
    

    }
