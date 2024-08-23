//
//  Model.swift
//  MyCalc
//
//  Created by Elena Chelyshkina on 22/08/2024.
//

import SwiftUI

// перечисляем операции калькулятора
enum Operation {
    case addition, subtract, multiply, divide, none
    
}

// создаем кнопки для калькулятора
enum Buttons: String {
    case zero = "0"
    case one = "1"
    case two = "2"
    case three = "3"
    case four = "4"
    case five = "5"
    case six = "6"
    case seven = "7"
    case eight = "8"
    case nine = "9"
    case plus = "+"
    case minus = "-"
    case multiple = "x"
    case divide = "/"
    case equal = "="
    case decimal = "."
    case percent = "%"
    case negative = "+/-"
    case clear = "AC"
    
    // computer property
    var buttonColor: Color {
        switch self {//проходимся switch по всем кнопкам и говорим какой кнопке какой цвет
        case .clear, .negative, .percent:
            return Color.grayCalc
        case .divide, .multiple, .minus, .plus, .equal:
            return Color.orangeCalc
        default :
            return Color.darkGrayCalc
        }
    }
    var buttonFontColor: Color {
        switch self {//проходимся switch по всем кнопкам и говорим какой кнопке какой цвет
        case .clear, .negative, .percent:
            return Color.black
        default :
            return Color.white
        }
    }
}
