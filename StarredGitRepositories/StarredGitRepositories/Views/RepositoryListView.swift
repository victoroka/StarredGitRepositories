//
//  RepositoryListView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct RepositoryListView: View {
    
    @ObservedObject var repositoriesList = RepositoriesList()
    
    var programmingLanguage: ProgrammingLanguage = .swift
    
    var body: some View {
        NavigationView {
            List {
                
                GeometryReader { g -> Text in
                    let frame = g.frame(in: CoordinateSpace.global)
                    if frame.origin.y > 250 && !self.repositoriesList.isLoading {
                        self.repositoriesList.reload(for: self.programmingLanguage)
                        return Text("Loading...")
                    }
                    return Text("")
                }
                
                ForEach(self.repositoriesList.list.repositories ?? [], id: \.id) { repository in
                    RepositoryRowView(repository: repository)
                }
            }
            .navigationBarTitle("\(programmingLanguage.name) Repositories")
        }
        .onAppear {
            UITableView.appearance().separatorStyle = .none
            if let repos = self.repositoriesList.list.repositories {
                if repos.isEmpty {
                    self.repositoriesList.reload(for: self.programmingLanguage)
                }
            }
        }
    }
}
