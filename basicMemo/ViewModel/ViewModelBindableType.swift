//
//  ViewModelBindableType.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit

/*
 generic protocol that binds between view model and view
 
 viewModel : property that will be used in View controller
 bindViewModel() : method for binding
 */

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
}
