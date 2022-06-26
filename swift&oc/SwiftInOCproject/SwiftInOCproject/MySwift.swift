//
//  MySwift.swift
//  SwiftInOCproject
//
//  Created by 徐浩博 on 2022/6/4.
//

import Foundation

@objc class MySwift: NSObject {
    @objc func test() {
        let item = Item()
        item.setName("name")
        print("swift printting \(item.name())")
    }
}
