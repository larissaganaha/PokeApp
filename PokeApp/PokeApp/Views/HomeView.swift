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
