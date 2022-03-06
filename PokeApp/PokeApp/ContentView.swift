//
//  ContentView.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 09/01/22.
//

import SwiftUI

struct TypeModel: Identifiable {
    var id: Int

    let name: String
    let url: String
}
struct ContentView: View {
    let types: [TypeModel] = [
        .init(id: 0, name: "Grass", url: "grass"),
        .init(id: 1, name: "Fairy", url: "fairy"),
        .init(id: 2, name: "Water", url: "water")
    ]

    var body: some View {
        NavigationView {
            List(types) { type in
                HStack(spacing: 10.0) {
                    Text(type.name)
                }
            }.navigationTitle(Text("PokéApp"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
