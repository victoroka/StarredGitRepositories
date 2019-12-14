//
//  Owner.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

struct Owner: Codable {
    
    let name: String
    let picture: String
    
    enum CodingKeys: String, CodingKey {
        case name = "login"
        case picture = "avatar_url"
    }
    
    init(name: String, picture: String) {
        self.name = name
        self.picture = picture
    }
}
