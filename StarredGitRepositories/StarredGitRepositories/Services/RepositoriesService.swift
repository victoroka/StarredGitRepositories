//
//  RepositoriesService.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

class RepositoriesService {
    
    static let shared = RepositoriesService()
    let session: URLSession = URLSession(configuration: .default)
    
    func fetchRepositories(_ endpoint: Endpoint, completion: @escaping (Result<RepositoryList, NetworkError>) -> Void) {
        
        guard let url = endpoint.url else {
            completion(.failure(.badUrl))
            return
        }
        
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            
            if data == nil {
                completion(.failure(.emptyResponseDataError))
            }
            
            let statusCode = (response as? HTTPURLResponse)?.statusCode ?? 0
            if 200...299 ~= statusCode {
                do {
                    let decodedRepositoryList = try JSONDecoder().decode(RepositoryList.self, from: data!)
                    completion(.success(decodedRepositoryList))
                } catch {
                    completion(.failure(.mappingError))
                }
            }
            completion(.failure(self.getErrorDescription(for: statusCode)))
        })
        task.resume()
    }
    
    func getErrorDescription(for statusCode: Int) -> NetworkError {
        switch statusCode {
        case 401:
            return .unauthorized
        case 403:
            return .forbidden
        case 404:
            return .notFound
        default:
            return .unknownError
        }
    }
}
