//
//  Coordinator.swift
//  CoordinatorDemo
//
//  Created by 徐浩博 on 2022/6/26.
//

import UIKit

enum Event {
    case buttonTapped
}

protocol Coordinator {
    var navigationController: UINavigationController? { get set }
    
    var children: [Coordinator]? { get set }
    
    func eventOccurred(with type: Event)
    func start()
}

protocol Coordinating {
    var coordinator: Coordinator? { get set }
}
