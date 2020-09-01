//
//  SignUpModel.swift
//  Carat
//
//  Created by 문지수 on 2020/08/25.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

struct newUser: Codable {
    let name: String
}

enum SignUpError: Error {
    case defaultError
    case error(code: Int)
    
    var message: String {
        switch self {
        case .defaultError:
            return "ERROR"
        case .error(let code):
            return "\(code) Error"
        }
    }
}

struct SignUpModel {
    func requestSignUp(name: String, email: String, password: String) -> Observable<Result<newUser, SignUpError>> {
        return Observable.create{ (observer) -> Disposable in
            if name != "" || email != "" || password != "" {
                observer.onNext(.success((newUser(name: email))))
            } else {
                observer.onNext(.failure(.defaultError))
            }
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
}
