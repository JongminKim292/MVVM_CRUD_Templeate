//
//  UpdateViewController.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit

class ComposeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension ComposeViewController {
    func generateNavigationItem() {
        self.navigationItem.title = "New Memo"
    }
}
