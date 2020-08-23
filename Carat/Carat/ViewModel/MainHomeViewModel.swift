//
//  MainHomeViewModel.swift
//  Carat
//
//  Created by 이가영 on 2020/08/12.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation
import RxCocoa
import RxSwift

class MainHomeViewModel: ViewModelType{
    
    private let httpClient = HTTPClient()
    
    struct Input {
        let updateFeed: Signal<Void>
        let selectProfile: Signal<Void>
        let selectTableViewCell: Signal<Void>
        let selectRecaring: Signal<Void>
        let selectLike: Signal<Void>
    }
    
    struct Output {
        let goToDetailCaring: Signal<Void>
        let goToUserProfile: Signal<Void>
        let result: Signal<Void>
    }
    
    func loadFreshCaring(){
//        httpClient.get(NetworkingAPI.timeLine(4, 1)).responseJSON { [weak self] (response) in
//            guard self != nil else {return}
//
//            switch response.response?.statusCode{
//
//            }
//        }
    }
        
    func firstLoadCaring(){
//        httpClient.get(NetworkingAPI.timeLine(4, 0)).responseJSON { [weak self] (response) in
//            guard self != nil else {return}
//
//            switch response.response?.statusCode {
//            case 200:
//                print("loadCaring succesful")
//                print(response)
//                guard let data = try? JSONDecoder().decode(MainHomeModel, from: ) else { return }
//                return data
//            case 400:
//                print("bad request")
//            case 401:
//                print("your request has been forbidden")
//            default:
//                print("default")
//            }
//        }
    }
    func createRecaring(){
        
    }
    
    func cancleRecaring(){
        
    }
        
}
