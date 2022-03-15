//
//  ContentView.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 09/01/22.
//

import SwiftUI

struct TypeContentView: View {
    @StateObject var viewModel = TypeViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.types, id: \.id) { type in
                    TypeRow(type: type)
                }
            }.navigationTitle(Text("PokéApp"))
            .onAppear { viewModel.fetch() }
        }
    }
}

struct TypeRow: View {
    let type: PokemonType

    var body: some View {
        HStack(spacing: 10.0) {
            Image(systemName: "circle.dashed")
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
        TypeContentView()
    }
}
