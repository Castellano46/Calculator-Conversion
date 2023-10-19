//
//  CircularButtonStyle.swift
//  ExtermeCalculator
//
//  Created by Pedro on 19/10/23.
//

import SwiftUI

struct CircularButtonStyle: ButtonStyle {
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .frame(width: 60, height: 60)
            .background(configuration.isPressed ? Color.gray : Color.blue)
            .foregroundColor(.white)
            .font(.title)
            .cornerRadius(30)
    }
}
