//
//  Memo.swift
//  basicMemo
//
//  Created by Jongmin Kim on 6/10/23.
//

import Foundation

/*
 Basic Memo Structure
 
 - Param
    - content : content of memo
    - insertDate : date of insert
    - id : timeinterval value of insertDate
 */
struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var id: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.id = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    /*
     init for update memo
     */
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}

