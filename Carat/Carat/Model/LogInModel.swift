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


struct User: Codable {
    let name: String
}


struct LogInModel: Codable {
    func requestLogin(email: String, password: String) -> Observable<Result> {
        return Observable.create{ (observer) -> Disposable in
            if email != "" || password != "" {
                observer.onNext(.ok)
            } else {
                observer.onNext(.forbidden)
            }
            observer.onCompleted()
            
            return Disposables.create()
        }
    }
    
}
