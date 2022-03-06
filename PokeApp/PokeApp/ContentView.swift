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
    let imageName: String
}
struct ContentView: View {
    let types: [TypeModel] = [
        .init(id: 0, name: "Grass", url: "grass", imageName: "circle.dashed"),
        .init(id: 1, name: "Fairy", url: "fairy", imageName: "circle.dashed"),
        .init(id: 2, name: "Water", url: "water", imageName: "circle.dashed")
    ]

    var body: some View {
        NavigationView {
            List {
                ForEach(types) { type in
                    TypeRow(type: type)
                }
            }.navigationTitle(Text("PokéApp"))
        }
    }
}

struct TypeRow: View {
    let type: TypeModel

    var body: some View {
        HStack(spacing: 10.0) {
            Image(systemName: type.imageName)
                .renderingMode(.original)
                .resizable()
                .clipShape(Circle())
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
            Text(type.name).font(.headline)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
