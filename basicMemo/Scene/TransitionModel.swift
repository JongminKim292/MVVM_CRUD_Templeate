//
//  TransitionModel.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/12/23.
//

import Foundation

enum TransitionStyle {
    case root
    case push
    case modal
}

enum TransitionError: Error {
    case missingNavigationController
    case cannotPop
    case unknown
}

