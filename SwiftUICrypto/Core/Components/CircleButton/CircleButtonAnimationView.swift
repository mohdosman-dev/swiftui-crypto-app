//
//  CircleButtonAnimation.swift
//  SwiftUICrypto
//
//  Created by Mohammed Osman on 07/03/2023.
//

import SwiftUI

struct CircleButtonAnimationView: View {
    @Binding var animated: Bool
    var body: some View {
        Circle()
            .stroke(lineWidth: 5)
            .scale(animated ? 1.0 : 0.0)
            .opacity(animated ? 0.0 : 1.0)
            .animation(
                animated ?  Animation.easeInOut(duration: 1) : .none ,
                value: animated
            )
    }
}

struct CircleButtonAnimation_Previews: PreviewProvider {
    static var previews: some View {
        CircleButtonAnimationView(
            animated: .constant(true))
    }
}
