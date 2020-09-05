//
//  PostViewModel.swift
//  Carat
//
//  Created by 이가영 on 2020/08/24.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

class PostViewMode {
    struct Input {
        var test: String
    }
    
    struct Output {
        var test: String
    }
    
    let model: PostCaringModel = PostCaringModel()
    private let postImage: String = ""
    
    func postCaring(_ arrayImage: [String?], _ body: String){
        for _ in arrayImage{
            print(arrayImage)
        }
        
//        httpClient.post(NetworkingAPI.createCaring(postString, image: ))
    }
    
}
