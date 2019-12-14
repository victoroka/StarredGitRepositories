//
//  RepositoryList.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

struct RepositoryList: Codable {
    
    let repositories: [Repository]?
    
    enum CodingKeys: String, CodingKey {
        case repositories = "items"
    }
    
    init(repositories: [Repository]) {
        self.repositories = repositories
    }
}
