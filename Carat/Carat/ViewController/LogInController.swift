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
    
    let viewModel = LogInViewModel()
    let disposeBag = DisposeBag()
    
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
    
//    func bindViewModel() {
//       self.emailTextfield.rx.text.orEmpty
//            .bind(to: viewModel.emailChanged)
//            .disposed(by: disposeBag)
//        
//        self.passwordTextfield.rx.text.orEmpty
//            .bind(to: viewModel.passwordChaged)
//            .disposed(by: disposeBag)
//        self.logInButton.rx.tap
//            .bind(to: viewModel.buttonClick)
//            .disposed(by: disposeBag)
//        
//        viewModel.result.emit(onNext: { (result) in
//            switch result {
//            case .success(let user):
//                print(user)
//                self.moveToMain()
//            case .failure(let err):
//                print(err)
//               self.showError()
//            }
//            }).disposed(by: disposeBag)
//    }
//    
//    func moveToMain() {
//        print("MOVE")
//    }
//    func showError() {
//        print("ERROR")
//    }

}
