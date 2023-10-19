//
//  CalculatorView.swift
//  ExtermeCalculator
//
//  Created by Pedro on 19/10/23.
//

import SwiftUI

struct CalculatorView: View {
    @ObservedObject var viewModel: CalculatorViewModel
    @Environment(\.presentationMode) var presentationMode
    
    @State private var currentInput: String = ""
    @State private var storedValue: Double = 0.0
    @State private var isResultCalculated: Bool = false
    
    var body: some View {
        VStack {
            Text("Calculadora")
                .font(.largeTitle)
                .padding(.top, 20)
            
            VStack {
                if isResultCalculated {
                    Text(currentInput)
                        .font(.title)
                        .padding()
                    Text("= \(storedValue)")
                        .font(.title)
                } else {
                    Text(currentInput)
                        .font(.title)
                        .padding()
                }
            }
            
            HStack {
                Button("1") {
                    appendInput("1")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("2") {
                    appendInput("2")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("3") {
                    appendInput("3")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("÷") {
                    applyOperator("/")
                }
                .buttonStyle(CircularButtonStyle())
            }
            
            HStack {
                Button("4") {
                    appendInput("4")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("5") {
                    appendInput("5")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("6") {
                    appendInput("6")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("x") {
                    applyOperator("*")
                }
                .buttonStyle(CircularButtonStyle())
            }
            
            HStack {
                Button("7") {
                    appendInput("7")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("8") {
                    appendInput("8")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("9") {
                    appendInput("9")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("-") {
                    applyOperator("-")
                }
                .buttonStyle(CircularButtonStyle())
            }
            
            HStack {
                Button("0") {
                    appendInput("0")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button(".") {
                    appendInput(".")
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("=") {
                    calculateResult()
                }
                .buttonStyle(CircularButtonStyle())
                
                Button("+") {
                    applyOperator("+")
                }
                .buttonStyle(CircularButtonStyle())
            }
            
            Button("C") {
                clear()
            }
            .buttonStyle(CircularButtonStyle())
            
            Button("Cerrar") {
                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(CircularButtonStyle())
        }
        .padding()
    }
    
    private func appendInput(_ input: String) {
        if isResultCalculated {
            currentInput = ""
            isResultCalculated = false
        }
        if !currentInput.isEmpty && currentInput.last?.isNumber == true {
            currentInput += " "
        }
        currentInput += input
    }
    
    private func applyOperator(_ newOperator: String) {
        if isResultCalculated {
            isResultCalculated = false
        }
        if !currentInput.isEmpty {
            if currentInput.last?.isNumber == true {
                currentInput += " "
            }
            currentInput += newOperator
        }
    }
    
    private func calculateResult() {
        let expression = NSExpression(format: currentInput)
        if let result = expression.expressionValue(with: nil, context: nil) as? Double {
            storedValue = result
            currentInput = "\(currentInput) = \(storedValue)"
            isResultCalculated = true
        } else {
            currentInput = "Error"
            isResultCalculated = true
        }
    }
    
    private func clear() {
        currentInput = ""
        storedValue = 0
        isResultCalculated = false
    }
}


