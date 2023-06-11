//
//  MemoDetailViewController.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit

class MemoDetailViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItemGenerate()
    }

}

extension MemoDetailViewController {
    func navigationItemGenerate() {
        self.navigationItem.title = "Memo Detail"
    }
}
