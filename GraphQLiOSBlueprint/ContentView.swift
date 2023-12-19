//
//  ContentView.swift
//  GraphQLiOSBlueprint
//
//  Created by Alkın Çakıralar on 19.12.2023.
//

import Apollo
import GraphqlAPI
import SwiftUI

class ApolloManager {
    static let shared = ApolloManager()
    let client: ApolloClient

    private init() {
        client = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
    }
}

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            ApolloManager.shared.client.fetch(query: CharactersQuery()) { result in
                do {
                    let data = try result.get().data
                    print(data?.characters?.results?.first??.status ?? "") //
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
