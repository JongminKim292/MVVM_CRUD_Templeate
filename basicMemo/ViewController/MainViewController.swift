//
//  MainViewController.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit

class MainViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemBackground
        navigationItemGenerate()
    }
}

extension MainViewController {
    func navigationItemGenerate() {
        self.navigationItem.title = "Memo"
    }
}
