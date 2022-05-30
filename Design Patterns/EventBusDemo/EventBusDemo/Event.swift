//
//  Event.swift
//  EventBusDemo
//
//  Created by 徐浩博 on 2022/5/30.
//

import Foundation

class BaseEvent<T> {
    let identifier: String
    let result: Result<T, Error>?
    
    init (identifier: String, result: Result<T, Error>?) {
        self.identifier = identifier
        self.result = result
    }
}

class UserFetchEvent: BaseEvent<[User]> {
    
}
