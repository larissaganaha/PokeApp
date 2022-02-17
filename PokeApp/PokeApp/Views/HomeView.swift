//
//  HomeView.swift
//  PokeApp
//
//  Created by Larissa Ganaha on 15/02/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack {
            LinearGradient(
                colors: [.black, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
                .ignoresSafeArea()
            VStack(spacing: 20) {
                Text("PokéApp")
                    .font(.system(size: 40, weight: .bold, design: .monospaced))
                    .foregroundColor(.white)
                    .padding()

                Spacer()

                HStack {
                    TypesView(type: "Normal", iconName: "circle.dashed")
                    TypesView(type: "Fight", iconName: "circle.dashed")
                    TypesView(type: "Flying", iconName: "circle.dashed")
                }
                HStack {
                    TypesView(type: "Poison", iconName: "circle.dashed")
                    TypesView(type: "Ground", iconName: "circle.dashed")
                    TypesView(type: "Rock", iconName: "circle.dashed")
                }
                HStack {
                    TypesView(type: "Bug", iconName: "circle.dashed")
                    TypesView(type: "Ghost", iconName: "circle.dashed")
                    TypesView(type: "Steel", iconName: "circle.dashed")
                }
                HStack {
                    TypesView(type: "Fire", iconName: "circle.dashed")
                    TypesView(type: "Water", iconName: "circle.dashed")
                    TypesView(type: "Grass", iconName: "circle.dashed")
                }
                HStack {
                    TypesView(type: "Electric", iconName: "circle.dashed")
                    TypesView(type: "Psychic", iconName: "circle.dashed")
                    TypesView(type: "Ice", iconName: "circle.dashed")
                }
                HStack {
                    TypesView(type: "Dragon", iconName: "circle.dashed")
                    TypesView(type: "Dark", iconName: "circle.dashed")
                    TypesView(type: "Fairy", iconName: "circle.dashed")
                }

                Spacer()
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

extension Color {
    static let gradientBottom = Color("BottomGradientColor")
}

struct TypesView: View {
    var type: String
    var iconName: String

    var body: some View {
        VStack(spacing: -5) {
            Image(systemName: iconName)
                .renderingMode(.original)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 50, height: 50)
                .colorInvert()
            Text(type)
                .font(.system(size: 20, weight: .regular, design: .monospaced))
                .foregroundColor(.white)
                .frame(maxWidth: .infinity)
                .padding()

        }
    }
}
