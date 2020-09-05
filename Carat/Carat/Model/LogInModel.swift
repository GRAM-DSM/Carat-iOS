//
//  LogInModel.swift
//  Carat
//
//  Created by 문지수 on 2020/08/19.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

//struct User: Codable{
//    let email: String
//    let password: String
//
//    init(email: String, password: String) {
//        self.email = email
//        self.password = password
//    }
//}
//
//struct LogInModel {
//   func login(info:LoginInfo) -> Observable<User>{
//        return Observable.create({ (observer) -> Disposable in
//            print("LOGIN!")
//            observer.onNext(User(name: info.id ?? ""))
//            return Disposables.create()
//            })
//    }
//}
//
//protocol LoginViewBindable {
//    var loginButtonTouch:PublishRelay<Void> { get }
//    var emailValueChange:PublishRelay<String?> { get }
//    var passwordValueChange:PublishRelay<String?> { get }
//    var loginUser:PublishSubject<User?> { get }
//}
//
//class LogInModel: LoginViewBindable {
//    var loginUser: PublishSubject<User?> = PublishSubject<User?>()
//    var loginButtonTouch: PublishRelay<Void> = PublishRelay<Void>()
//    var emailValueChange: PublishRelay<String?> = PublishRelay<String?>()
//    var passwordValueChange: PublishRelay<String?> = PublishRelay<String?>()
//    let disposeBag = DisposeBag()
//
//    var loginInfo:Observable<LoginInfo> {
//        return Observable.combineLatest(txtIdValueChanged, txtPwValueChanged) {
//            id, pw in
//
//            return LoginInfo.init(id: id, pw: pw)
//        }
//    }
//}

class LogInModel {
//    var email: String?
//    var password: String?
//
//    init(email: String? = nil, password: String? = nil) {
//        self.email = email
//        self.password = password
//    }
//
//    func validate() {
//        if email == nil || password == nil {
//
//        }
//    }
//    func logIn() {
//       let api = ApiHandler()
//        api.login(email!, password: password!, success: { (data) -> Void in
//                  // Go to the next view controller
//              }) { (error) -> Void in
//                  // Show the user an alert with the error
//              }
//
//    }
}

