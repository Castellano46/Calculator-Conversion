//
//  ContentView.swift
//  ExtermeCalculator
//
//  Created by Pedro on 19/10/23.
//

import SwiftUI

struct ContentView: View {
    @State private var isCalculatorPresented = false

    var body: some View {
        NavigationView {
            VStack {
                Button(action: {
                    isCalculatorPresented = true
                }) {
                    HStack {
                        Image(systemName: "plus.square.fill")
                        Text("Calculadora")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 20)
                .sheet(isPresented: $isCalculatorPresented) {
                    CalculatorView(viewModel: CalculatorViewModel())
                }

                NavigationLink(destination: ConversionView(viewModel: ConversionViewModel())) {
                    HStack {
                        Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                        Text("Conversiones")
                    }
                    .frame(minWidth: 0, maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
                    .foregroundColor(.white)
                    .padding(.horizontal, 20)
                }
                .buttonStyle(PlainButtonStyle())
                .padding(.vertical, 20)
            }
        }
    }
}
