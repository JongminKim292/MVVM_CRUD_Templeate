//
//  UpdateViewController.swift
//
//  Created by Jongmin Kim on 6/10/23.
//

import UIKit
import RxSwift
import RxCocoa
import Action
import NSObject_Rx

class MemoComposeViewController: UIViewController, ViewModelBindableType {
    
    var noteField: UITextField!
    var cancelButton: UIBarButtonItem!
    var saveButton: UIBarButtonItem!
    
    var viewModel: MemoComposeViewModel!
    
    
    func bindViewModel() {
        viewModel.title
            .drive(navigationItem.rx.title)
            .disposed(by: rx.disposeBag)
        
        viewModel.initialText
            .drive(noteField.rx.text)
            .disposed(by: rx.disposeBag)
        
        cancelButton.rx.action = viewModel.cancelAction
        
        saveButton.rx.tap
            .throttle(.microseconds(500), scheduler: MainScheduler.instance)
            .withLatestFrom(noteField.rx.text.orEmpty)
            .bind(to: viewModel.saveAction.inputs)
            .disposed(by: rx.disposeBag)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        initialViewFraming()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        noteField.becomeFirstResponder()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if noteField.isFirstResponder {
            noteField.resignFirstResponder()
        }
    }
}

extension MemoComposeViewController {
    func generateNavigationItem() {
        self.navigationItem.title = "New Memo"
    }
    
    @objc func temp() {
        
    }
    
    func initialViewFraming() {
        
        self.cancelButton = UIBarButtonItem(barButtonSystemItem: .cancel, target: nil, action: nil)
        self.saveButton = UIBarButtonItem(barButtonSystemItem: .save, target: nil, action: nil)
        self.navigationItem.leftBarButtonItem = cancelButton
        self.navigationItem.rightBarButtonItem = saveButton
        
        
        self.noteField = UITextField()
        
        self.noteField.translatesAutoresizingMaskIntoConstraints = false
        self.noteField.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        self.noteField.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        self.noteField.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        self.noteField.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
}
