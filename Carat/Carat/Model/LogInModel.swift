//
//  LogInModel.swift
//  Carat
//
//  Created by 문지수 on 2020/08/19.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

class LogInModel {
    var email: String?
    var password: String?
    
    init(email: String? = nil, password: String? = nil) {
        self.email = email
        self.password = password
    }
    
    func validate() {
        if email == nil || password == nil {
            
        }
    }
    func logIn() {
       let api = ApiHandler()
        api.login(email!, password: password!, success: { (data) -> Void in
                  // Go to the next view controller
              }) { (error) -> Void in
                  // Show the user an alert with the error
              }
        
    }
}

