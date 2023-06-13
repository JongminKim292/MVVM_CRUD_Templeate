//
//  MemoListViewModel.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import Foundation
import RxSwift
import RxCocoa

class MemoListViewModel: CommonViewModel {
    var memoList: Observable<[Memo]> {
        return storage.memoList()
    }
}

