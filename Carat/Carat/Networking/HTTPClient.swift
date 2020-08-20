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
