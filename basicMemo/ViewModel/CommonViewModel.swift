//
//  CommonViewModel.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/12/23.
//

import Foundation
import RxSwift
import RxCocoa

/*
 shared view model for list, detail, compose
 
 Properties
 title : navigation title (because every scene is embeded on navigation controller)
 
 sceneCoordinator : hold sceneCoordinator protocol
 storage : hold memory storage protocol
 
 why protocol? : change dependency easily
 */

class CommonViewModel: NSObject {
    let title: Driver<String>
    let sceneCoordinator: SceneCoordinatorType
    let storage: MemoStorageType
    
    init(title: String, sceneCoordinator: SceneCoordinatorType, storage: MemoStorageType) {
        self.title = Observable.just(title).asDriver(onErrorJustReturn: "Error")
        self.sceneCoordinator = sceneCoordinator
        self.storage = storage
    }
}
