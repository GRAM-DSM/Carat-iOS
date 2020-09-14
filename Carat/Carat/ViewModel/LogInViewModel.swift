//
//  LogInViewModel.swift
//  Carat
//
//  Created by 문지수 on 2020/08/25.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa



enum LoginResult {
    case ok
    case badRequest
    case forbidden
}

class LogInViewModel: ViewModelType {
    let disposeBag = DisposeBag()
    let httpClient = HTTPClient()
    
    
    struct Input {
        let email: Driver<String>
        let password: Driver<String>
        let clickButton: Signal<Void>
    }
    
    struct Output {
        let result: Driver<LoginResult>
        let token: Driver<String?>
    }
    

    
//    func Login() {
//        httpClient.post(NetworkingAPI.Login(email: email, password: password)).responseJSON { [weak self] (response) in
//            guard self != nil else { return }
//
//            switch response.response?.statusCode {
//                 case 200:
//                    print("loadCaring succesful")
//                    print(response)
//            guard let data = try? JSONDecoder().decode(LogInModel, from: ) else { return }
//                return data
//                case 400:
//                    print("bad request")
//                case 403:
//                    print("Email and password do not match")
//                default:
//                    print("default")
//            }
//        }
//    }
}
