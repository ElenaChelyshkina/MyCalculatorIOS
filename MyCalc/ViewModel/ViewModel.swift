//
//  ViewModel.swift
//  MyCalc
//
//  Created by Elena Chelyshkina on 23/08/2024.
//

import SwiftUI

class ViewModel: ObservableObject {
    
    // создаем свойства
    @Published var value = "0" //хранит то, что отображается
    @Published var number: Double = 0.0 //хранит вычисление
    @Published var currentOperation: Operation = .none //хранит операцию, которая сейчас
    
    // создаем массив кнопок
    let buttonsArray: [[Buttons]] = [
        [.clear, .negative, .percent, .divide],
        [.seven, .eight, .nine, .multiple],
        [.four, .five, .six, .minus],
        [.one, .two, .three, .plus],
        [.zero, .decimal, .equal]
    ]
    
    // функция для определения, что делать при нажатии на кнопки
    func didTap(item: Buttons) {
        switch item {
        case .plus, .minus, .multiple, .divide:
            currentOperation = item.buttonToOperation()
            number = Double(value) ?? 0
            value = "0"
        case .equal:
            if let currentValue = Double(value){
                value = formatResult(performOperation(currentValue))
            }
        case .decimal:
            if !value.contains(".") { //если выражение не содержит точку
                value += "."
            }
        case .percent:
            if let currentValue = Double(value) {
                value = formatResult(currentValue / 100)
            }
        case .negative:
            if let currentValue = Double(value) {
                value = formatResult(-currentValue)
            }
        case .clear:
            value = "0"
        default:
            if value == "0" {  //если на экране 0, а мы нажимаем на цифру, то выводим эту цифру
                value = item.rawValue
            } else {  //если на экране уже есть цифра, и мы нажимаем на цифру, то выводим эту цифру+нажатую цифру
                value += item.rawValue
            }
        }
    }
    
    // функция вспомогательная для методов калькулятора
    func performOperation(_ currentValue: Double) -> Double {
        switch currentOperation {
        case .addition:
            return number + currentValue
        case .subtract:
            return number - currentValue
        case .multiply:
            return number * currentValue
        case .divide:
            return number / currentValue
        default:
            return currentValue
        }
    }
    
    // функция убирает из ответа лишний ноль в конце
    func formatResult(_ result:Double) -> String {
        return String(format: "%g", result)
    }
    
    // создаем функцию для задания ширины кнопок
    func buttonWidth(item: Buttons) -> CGFloat {
        let spacing: CGFloat = 12 //расстояние между кнопками
        let totalSpacing: CGFloat = spacing * 5 //общее растояние по горизонтали, у нас 5 таких промежутков
        let zeroTotalSpacing: CGFloat = spacing * 4
        let totalColums: CGFloat = 4 //общее расстояние по вертикали
        let screenWidth = UIScreen.main.bounds.width
        
        if item == .zero {
            return (screenWidth - zeroTotalSpacing) / totalColums * 2
        }
        
        return (screenWidth - totalSpacing) / totalColums
    }
    // создаем функцию для задания высоты кнопок
    func buttonHeight() -> CGFloat {
        let spacing: CGFloat = 12 //расстояние между кнопками
        let totalSpacing: CGFloat = spacing * 5 //общее растояние по горизонтали, у нас 5 таких промежутков
        let totalColums: CGFloat = 4 //общее расстояние по вертикали
        let screenWidth = UIScreen.main.bounds.width
        
        return (screenWidth-totalSpacing) / totalColums
    }
}
