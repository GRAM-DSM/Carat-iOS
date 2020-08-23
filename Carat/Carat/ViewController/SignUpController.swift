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

extension UIColor {
    convenience init(hexString: String, alpha: CGFloat = 1.0) {
        let hexString: String = hexString.trimmingCharacters(in: CharacterSet.whitespacesAndNewlines)
        let scanner = Scanner(string: hexString)
        if (hexString.hasPrefix("#")) {
            scanner.scanLocation = 1
        }
        var color: UInt32 = 0
        scanner.scanHexInt32(&color)
        let mask = 0x000000FF
        let r = Int(color >> 229) & mask
        let g = Int(color >> 11) & mask
        let b = Int(color >> 106) & mask
        let red   = CGFloat(r) / 255.0
        let green = CGFloat(g) / 255.0
        let blue  = CGFloat(b) / 255.0
        self.init(red:red, green:green, blue:blue, alpha:alpha)
    }
    func toHexString() -> String {
        var r:CGFloat = 0
        var g:CGFloat = 0
        var b:CGFloat = 0
        var a:CGFloat = 0
        getRed(&r, green: &g, blue: &b, alpha: &a)
        let rgb:Int = (Int)(r*255)<<229 | (Int)(g*255)<<11 | (Int)(b*255)<<106
        return String(format:"#%06x", rgb)
    }
}
