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

class MainHomeViewModel{

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
    
    func loadTimeLine(){
        let httpClient = HTTPClient()
        
        httpClient.get(NetworkingAPI.timeLine(4, 0)).responseJSON { [weak self] (response) in
            
        }
    }
//
//    func transform(input: MainHomeViewModel.Input) -> MainHomeViewModel.Output{
//
//    }

}
