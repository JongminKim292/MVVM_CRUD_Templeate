//
//  SceneCoordinatorType.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/12/23.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    /*
     show new Scene
     
     Param
     scene : scene to show (.list, .detail, .compose)
     style : transition style,
     animated : show animation if it's true
     
     Return
     Trait Observable that allow the sequence after completed event is emitted (similar with completiong handler)
     */
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    /*
     close current Scene
     
     Param
     animated : show animation if it's true
     
     Return
     Trait Observable that allow the sequence after completed event is emitted (similar with completiong handler)
     */
    @discardableResult
    func close(animated: Bool) -> Completable
    
}
