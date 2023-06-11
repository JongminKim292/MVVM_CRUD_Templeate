//
//  UpdateViewController.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit

class MemoComposeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
}

extension MemoComposeViewController {
    func generateNavigationItem() {
        self.navigationItem.title = "New Memo"
    }
}
