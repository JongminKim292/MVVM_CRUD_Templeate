//
//  MemoryStorage.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import Foundation
import RxSwift

/*
 - Properties
    - list : list of memos in memory storage, it will be released by 'store'
    - store : the subject that will emit new next event when 'list' array component has been changed
 */

class MemoryStorage: MemoStorageType {
    private var list = [
        Memo(content: "Dummy1", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Dummy2", insertDate: Date().addingTimeInterval(-20))
    ]
    
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    /*
     Create new memo in MemoryStorage
     
     Params
     content : content of memo
     
     Return : observable that emit new memo
     */
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        
        store.onNext(list)
        return Observable.just(memo)
    }
    
    /*
     Ruturn : subject of memo list
     */
    @discardableResult
    func memoList() -> Observable<[Memo]> {
        return store
    }
    
    /*
     Update new memo in MemoryStorage
     
     Params
     memo : current memo data
     content : new content for memo
     
     Return : observable that emit updated memo
     */
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: {$0 == memo}) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(updated)
    }
    
    /*
     remove memo in list, subject will emit new next event
     
     Params
     memo : target memo to remove
     
     Return :
     */
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        
        store.onNext(list)
        
        return Observable.just(memo)
    }
    
}
