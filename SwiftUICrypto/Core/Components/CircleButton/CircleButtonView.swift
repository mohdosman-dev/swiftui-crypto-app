//
//  CircleButton.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 06/03/2023.
//

import SwiftUI

struct CircleButtonView: View {
    let iconName: String
    var body: some View {
        Image(systemName: iconName)
            .font(.headline)
            .foregroundColor(Color.theme.accentColor)
            .frame(width: 50, height: 50)
            .background(
                Circle()
                    .foregroundColor(Color.theme.backgroundColor)
            )
            .shadow(
                color: Color.theme.accentColor,
                radius: 10, x: 0, y: 0
            )
            .padding()
    }
}

struct CircleButton_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            CircleButtonView(iconName: "info")
                .colorScheme(.light)
                .previewLayout(.sizeThatFits)
            
            CircleButtonView(iconName: "heart.fill")
                .colorScheme(.dark)
                .previewLayout(.sizeThatFits)
        }
    }
}
