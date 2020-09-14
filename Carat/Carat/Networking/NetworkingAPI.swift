//
//  NetworkingAPI.swift
//  Carat
//
//  Created by 이가영 on 2020/08/07.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import Alamofire

enum NetworkingAPI {
    case Login(_ email: String, _ password: String)
    case renewalToken
    case signUp(_ name: String, _ email: String, _ password: String)
    case deleteUser
    case timeLine(_ size: Int, _ base_time: String)
    case timeLineOfProfile(_ email: String, _ size: Int, _ base_time: String) // ?
    
    case createCaring(_ tweet: String, image: String?)
    case detailCaring(_ id: String)
    case deleteCaring(_ id: String)
    case reviseCaring(_ id: String)
    
    case createLike(_ id: String)
    case cancleLike(_ id: String)
    case listOfLike(_ id: String)
    
    case createRecaring(_ id: String)
    case cancleRecaring(_ id: String)
    
    case readProfile(_ email: String)
    case reviseProfile
    
    case listOfFollowing(_ email: String)
    case listOfFollow(_ email: String)
    case createFolowing(_ email: String)
    case cancleFollowing(_ email: String)
    
    //MARK: path
    var path: String {
        switch self {
        case .Login, .renewalToken:
            return "/user/auth"
        case .signUp, .deleteUser:
            return "/user"
        case .timeLine, .timeLineOfProfile:
            return "/timeline"
        case .createCaring:
            return "/caring"
        case .detailCaring(let id), .deleteCaring(let id), .reviseCaring(let id):
            return "/caring/" + id
        case .createLike(let id), .cancleLike(let id):
            return "/carat/\(id)"
        case .listOfLike(let id):
            return "/carat/\(id)/list"
        case .createRecaring, .cancleRecaring:
            return "/recaring"
        case .readProfile(let email):
            return "/profile/\(email)"
        case .reviseProfile:
            return "/profile"
        case .listOfFollowing(let email), .createFolowing(let email), .cancleFollowing(let email):
            return "/profile/\(email)/following"
        case .listOfFollow(let email):
            return "/profile/\(email)/followers"
        }
    }
    
    //MARK: headers
    var headers: [String: String]? {
        switch self {
        case .signIn:
            return nil
            
        case .renewalToken:
            let renewalToken: String = "tokenValue"
            let userDefault = UserDefaults.standard
            userDefault.set(renewalToken, forKey: "refreshToken")
            userDefault.synchronize(  )
            guard let token = userDefault.string(forKey: "refreshToken") else { return nil }
            return ["Authorization" : "Bearer" + token]
            
        default:
            let defaultToken: String = "accessToken"
            let userDefault = UserDefaults.standard
            userDefault.set(defaultToken, forKey: "accessToken")
            userDefault.synchronize()
            guard let token = userDefault.string(forKey: "accessToken") else { return nil }
            return ["Authorization" : "Bearer" + token]
        }
    }
    
    //MARK: parameters
    var parameters: [String: Any]{
        switch self {
        case .signUp(let name, let email, let password):
            return ["name": name, "email": email, "password": password]
        case .Login(let email, let password):
            return ["email": email, "password": password]
        case .timeLine(let size, let last_caring_id):
            return ["size": size, "last_caring_id": last_caring_id]
        case .timeLineOfProfile(let email, let size, let last_caring_id):
            return ["email": email, "size": size, "last_caring_id": last_caring_id]
        case .createCaring(let caring):
            return ["caring": caring]
        case .createRecaring(let id), .cancleRecaring(let id):
            return ["id": id]
        default:
            return [:]
        }
    }
}

//토큰은 잘모르겠다 지수가 공부해줘서 나한테 알려줘~
struct Token {
    static var token: String?{
        get{
            return UserDefaults.standard.string(forKey: "Token")
        }
        set{
            UserDefaults.standard.set(newValue, forKey: "Token")
        }
    }
}

