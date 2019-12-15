//
//  RepositoriesList.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import Foundation

class RepositoriesList: ObservableObject {
    
    @Published var list: RepositoryList = RepositoryList(repositories: [])
    @Published var isLoading: Bool = false
    
    var repositoriesService = RepositoriesService.shared
    
    func reload() {
        self.list = RepositoryList(repositories: [])
        self.isLoading = true
        
        repositoriesService.fetchRepositories(Endpoint.build()) { [weak self] (result) in
            DispatchQueue.main.async {
                self?.isLoading = false
            }
            
            switch result {
            case .success(let repositories):
                DispatchQueue.main.async {
                    self?.list = repositories
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
