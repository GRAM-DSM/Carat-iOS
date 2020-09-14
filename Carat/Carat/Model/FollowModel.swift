//
//  FollowModel.swift
//  Carat
//
//  Created by 이가영 on 2020/09/05.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation

struct FollowModel: Codable {
    var profile_image: String = ""
    var name: String = ""
    var email: String = ""
    var following: Bool = false
    
    init(profile_image: String, name: String, email: String, following: Bool) {
        self.profile_image = profile_image
        self.name = name
        self.email = email
        self.following = following
    }
}

struct FollowerModel {
    var follower: [FollowModel]
}

struct FollowingModel{
    var following: [FollowModel]
}
