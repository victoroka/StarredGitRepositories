//
//  RepositoryRowView.swift
//  StarredGitRepositories
//
//  Created by Victor Oka on 14/12/19.
//  Copyright © 2019 Victor Oka. All rights reserved.
//

import SwiftUI

struct RepositoryRowView: View {
    
    var repository: Repository
    
    var body: some View {
        VStack {
            HStack {
                Image("")
                VStack(alignment: .leading) {
                    Text("Language")
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(repository.name)
                        .font(.title)
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Text("by \(repository.owner.name)".uppercased())
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .layoutPriority(100)
                Spacer()
                VStack(alignment: .trailing) {
                    Text("36K")
                        .fontWeight(.bold)
                        .foregroundColor(.primary)
                    Image(systemName: "star.fill")
                    .resizable()
                    .frame(width: 20.0, height: 20.0)
                        .foregroundColor(.yellow)
                }
            }
            .padding()
        }
        .cornerRadius(10)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(Color(.sRGB, red: 150/255, green: 150/255, blue: 150.255, opacity: 1), lineWidth: 1)
            )
        .padding([.top, .horizontal])
    }
}
