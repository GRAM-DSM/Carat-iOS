//
//  CaratModel.swift
//  Carat
//
//  Created by 이가영 on 2020/08/11.
//  Copyright © 2020 이가영. All rights reserved.
//

import Foundation


struct MainHomeModel: Codable { //글 썻을 때 ~
    var recaring_name: String
    var recaring_id: String = ""
    var caring_id: String = ""
    var owner: Owner
    var post_time: String
    var body: String
    var body_images: [String?]
    var carat_count: Int = 0
    var recaring_count: Int = 0
    var me_recaring: Bool = false
    var me_carat: Bool = false
    
    init(recaring_name: String, owner: Owner, post_time: String, body: String, body_images: [String?], carat_count: Int, recaring_count: Int, me_recaring: Bool, me_carat: Bool) {
        self.recaring_name = recaring_name
        self.owner = owner
        self.post_time = post_time
        self.body = body
        self.body_images = body_images
        self.carat_count = carat_count
        self.recaring_count = recaring_count
        self.me_recaring = me_recaring
        self.me_carat = me_carat
    }
}

struct Owner: Codable {
    var id: String = ""
    var email: String = ""
    var profile_image: String = "defaultProfile"
}
