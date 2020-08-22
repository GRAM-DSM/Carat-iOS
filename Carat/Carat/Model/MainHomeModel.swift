//
//  CaratModel.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct MainHomeModel: Codable{ //글 썻을 때 ~
    var profileImage: String?
    var profileName: String //별명
    var profileID: String //@아이디
    var mainText: String //본문
    var uploadImageView: [String?]
    var timeFromCaring: String //올린지 얼마됐는지
    
    var recaringSum: Int
    var likeSum: Int
    
    var recaring: Bool //리캐럿
    var carat: Bool //좋아요
}

