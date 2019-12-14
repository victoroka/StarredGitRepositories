//
//  Repository.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

struct Repository: Codable {
    
    let name: String
    let numberOfStars: Int
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case name = "name"
        case numberOfStars = "stargazers_count"
        case owner = "owner"
    }
    
    init(name: String, numberOfStars: Int, owner: Owner) {
        self.name = name
        self.numberOfStars = numberOfStars
        self.owner = owner
    }
}
