//
//  NetworkService.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

protocol NetworkService {
    func fetchRepositories(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void)
}
