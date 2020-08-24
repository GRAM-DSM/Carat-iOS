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
//
//
//
//}
