//
//  RepositoryRootView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 15/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct RepositoryRootView: View {
    var body: some View {
        TabView {
            ForEach(ProgrammingLanguage.allCases, id: \.self) { p in
                RepositoryListView(programmingLanguage: p).tag(p)
                    .tabItem {
                        Image(p.description)
                        Text(p.name)
                }
            }
        }
        .edgesIgnoringSafeArea(.top)
    }
}
