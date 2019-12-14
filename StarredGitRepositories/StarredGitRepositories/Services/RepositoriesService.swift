//
//  RepositoriesService.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

class RepositoriesService: NetworkService {
    
    static let shared = RepositoriesService()
    let session: URLSession = URLSession(configuration: .default)
    
    func fetchRepositories(_ request: URLRequest, completion: @escaping (Result<Data, Error>) -> Void) {
        
        // guard let url = request.url else { return }
        let url = URL(string: "https://api.github.com/search/repositories?q=language:swift&sort=stars")!
        let task = session.dataTask(with: url, completionHandler: { data, response, error in
            print(response)
            if error != nil {
                print(error)
                return
            }
            
            do {
                let json = try JSONDecoder().decode(RepositoryList.self, from: data! )
                    //try JSONSerialization.jsonObject(with: data!, options: [])
                print(json)
            } catch {
                print("Error during JSON serialization: \(error.localizedDescription)")
            }
            
        })
        task.resume()
    }
}
