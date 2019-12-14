//
//  ContentView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var repositoriesList = RepositoriesList()
    
    var body: some View {
        Button(action: {
            self.repositoriesList.reload()
        }) {
            Text("Request")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
