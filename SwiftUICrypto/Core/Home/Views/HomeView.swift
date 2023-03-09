//
//  HomeView.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 06/03/2023.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showProtfolio: Bool = false
    
    var body: some View {
        ZStack {
            
            // Background layer
            Color.theme
                .backgroundColor
                .ignoresSafeArea()
            
            // Content layer
            VStack {
                
                homeHeader
                List {
                    CoinRowView(showHoldingColumn: false)
                }
                .listStyle(PlainListStyle())
                Spacer(minLength: 0)
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            HomeView()
                .toolbar(.hidden)
        }
    }
}

// MARK: - Split functions to Extension.
extension HomeView {
    // MARK:  Header View
    private var homeHeader: some View {
        HStack {
            CircleButtonView(iconName: showProtfolio ? "plus" : "info")
                .animation(.none, value: showProtfolio)
                .background(
                    CircleButtonAnimationView(animated: $showProtfolio)
                )
            
            Spacer()
            Text(showProtfolio ? "Protfolio": "Live Prices")
                .font(.headline)
                .fontWeight(.heavy)
                .foregroundColor(Color.theme.accentColor)
                .animation(.none, value: showProtfolio)
            Spacer()
            CircleButtonView(iconName: "chevron.right")
                .rotationEffect(
                    Angle(degrees: showProtfolio ? 180 : 0)
                )
                .onTapGesture {
                    withAnimation(.spring()) {
                        showProtfolio.toggle()
                    }
                }
        }
    }
}
