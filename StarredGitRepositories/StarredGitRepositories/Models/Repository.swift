//
//  Repository.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

// MARK:- Codable Protocol
struct Repository: Codable {
    
    let id: Int
    let name: String
    let numberOfStars: Int
    let language: String
    let owner: Owner
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case name = "name"
        case numberOfStars = "stargazers_count"
        case language = "language"
        case owner = "owner"
    }
    
    init(id: Int, name: String, numberOfStars: Int, language: String, owner: Owner) {
        self.id = id
        self.name = name
        self.numberOfStars = numberOfStars
        self.language = language
        self.owner = owner
    }
}

// MARK:- Identifiable Protocol
extension Repository: Identifiable {}
