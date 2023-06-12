//
//  Scene.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/12/23.
//

import UIKit

enum Scene {
    case list(MemoListViewModel)
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    func vcCall() -> UIViewController {
        
        switch self {
        case .list(let memoListViewModel):
            let nav = UINavigationController(rootViewController: MemoListViewController())
            
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            
            listVC.bind(viewModel: memoListViewModel)
            
            return nav
            
        case .detail(let memoDetailViewModel):
            var detailVC = MemoDetailViewController()
            
            detailVC.bind(viewModel: memoDetailViewModel)
            
            return detailVC
            
        case .compose(let memoComposeViewModel):
            let nav = UINavigationController(rootViewController: MemoListViewController())
            
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
                    
            composeVC.bind(viewModel: memoComposeViewModel)
            
            return nav
        }
    }
}
