//
//  HTTPClient.swift
//  Carat
//
//  Created by 이가영 on 2020/08/20.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import Alamofire

protocol HTTPClientProvider {
    func get(_ api: NetworkingAPI) -> DataRequest
    
    func post(_ api: NetworkingAPI) -> DataRequest
    
    func put(_ api: NetworkingAPI) -> DataRequest
}

class HTTPClient: HTTPClientProvider {
    
    let baseURI: String = "http://api.carat.com"
    
    func get(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .get, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: HTTPHeaders(api.headers!), interceptor: nil)
    }
    
    func post(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .post, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: HTTPHeaders(api.headers!), interceptor: nil)
    }
    
    func put(_ api: NetworkingAPI) -> DataRequest {
        return AF.request(baseURI + api.path, method: .put, parameters: api.parameters, encoding: JSONEncoding.prettyPrinted, headers: HTTPHeaders(api.headers!), interceptor: nil)
    }
}

enum Result: Int {

    case ok = 200
    case created = 201
    case noContent = 204
    case badRequest = 400
    case unauthorized = 401
    case forbidden = 403
    case notFound = 404
    case conflict = 409
        
    func message() -> String {
        switch self {
        case .ok, .created:
            return "성공"
        case .badRequest:
            return "유효하지 않은 요청"
        case .unauthorized:
            return "유효하지 않은 토큰"
        case .conflict:
            return "이미 사용 중"
        case .noContent:
            return "성공적으로 삭제"
        case .forbidden:
            return "이메일 혹은 비밀번호가 잘못됨"
        case .notFound:
            return "존재하지 않음"
        }
    }
    
}

