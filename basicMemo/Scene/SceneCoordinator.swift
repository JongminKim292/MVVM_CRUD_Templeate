//
//  SceneCoordinator.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/12/23.
//

import Foundation
import RxSwift
import RxCocoa

/*
 Handling Scene
 
 properties
 bag : dispose bag for resource cleaning
 
 For handling Scene
 window : UIWindow instance
 currentVC: current view controller
 
 */

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag()
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> RxSwift.Completable {
        // emit scene transition success or not
        let subject = PublishSubject<Never>()
        
        let target = scene.vcCall()
        
        switch style {
        case .root:
            currentVC = target
            window.rootViewController = target
            
            subject.onCompleted()
            
        case .push:
            guard let nav = currentVC.navigationController else {
                subject.onError(TransitionError.missingNavigationController)
                break
            }
            
            nav.pushViewController(target, animated: animated)
            currentVC = target
            
            subject.onCompleted()
            
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            
            currentVC = target
        }
        
        return subject.asCompletable()
    }
    
    
    // MARK: this is the example that use .create Completable. I recommand that use PublishSubject and asCompletable() method like transition() above
    @discardableResult
    func close(animated: Bool) -> RxSwift.Completable {
        return Completable.create { [unowned self] completable in
            
            if let presentingVC = self.currentVC.presentingViewController {
                self.currentVC.dismiss(animated: animated)
                self.currentVC = presentingVC
                completable(.completed)
            }
            
            else if let nav = self.currentVC.navigationController {
                guard nav.popViewController(animated: animated) != nil else {
                    completable(.error(TransitionError.cannotPop))
                    return Disposables.create()
                }
                
                self.currentVC = nav.viewControllers.last!
                completable(.completed)
            }
            
            else {
                completable(.error(TransitionError.unknown))
            }
            
            return Disposables.create()
        
        }
    }
}

