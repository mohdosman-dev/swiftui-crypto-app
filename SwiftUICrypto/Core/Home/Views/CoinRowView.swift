//
//  CoinRowView.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 07/03/2023.
//

import SwiftUI

struct CoinRowView: View {
    
    let showHoldingColumn: Bool
    
    var body: some View {
        HStack(spacing: 0) {
            HStack (spacing: 0) {
                // Rank
                Text("\(1)")
                    .font(.caption)
                    .foregroundColor(Color.theme.secondaryTextColor)
                    .frame(minWidth: 30)
                
                // Image
                Circle()
                    .frame(width: 30, height: 30)
                
                // Symbol
                Text("btc".uppercased())
                    .font(.headline)
                    .padding(.leading, 6)
                    .foregroundColor(Color.theme.accentColor)
            }
            Spacer(minLength: 0)
            // Holding
            if showHoldingColumn {
                VStack (alignment: .trailing) {
                    // Holding Value
                    Text(12211.asCurrency())
                        .bold()
                    // Holding Amount
                    Text(0.54939.asNumberString())
                }
            }
            VStack (alignment: .trailing) {
                // Market Price
                Text(3234.1234567.asCurrency())
                    .bold()
                    .foregroundColor(Color.theme.accentColor)
                // Change percent last 24h
                Text(0.4472.asPercentString())
                    .foregroundColor(
//                        -1 >= 0 ?
//                         Color.theme.greenColor:
                        Color.theme.redColor
                    )
            }
            .frame(width: UIScreen.main.bounds.width / 3.5, alignment: .trailing)
        }
        .font(.subheadline)
        
    }
}

struct CoinRowView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CoinRowView(showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
            CoinRowView(showHoldingColumn: true)
                .previewLayout(.sizeThatFits)
                .preferredColorScheme(.dark)
        }
    }
}
