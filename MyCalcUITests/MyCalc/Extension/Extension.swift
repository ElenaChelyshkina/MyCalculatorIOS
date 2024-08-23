//
//  Extension.swift
//  MyCalc
//
//  Created by Elena Chelyshkina on 23/08/2024.
//

import SwiftUI

extension Buttons {
    func buttonToOperation() -> Operation {
        switch self {
        case.plus:
            return .addition
        case.minus:
            return .subtract
        case.multiple:
            return .multiply
        case.divide:
            return .divide
        default:
            return .none
        }
    }
}
