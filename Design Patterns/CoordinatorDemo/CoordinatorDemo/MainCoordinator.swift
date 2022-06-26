//
//  MainCoordinator.swift
//  CoordinatorDemo
//
//  Created by 徐浩博 on 2022/6/26.
//

import UIKit

class MainCoordinator: Coordinator {
    var children: [Coordinator]? = nil
    
    var navigationController: UINavigationController?
    
    func eventOccurred(with type: Event) {
        switch type {
        case .buttonTapped:
            var secondViewController: UIViewController & Coordinating = SecondViewController()
            secondViewController.coordinator = self
            navigationController?.pushViewController(secondViewController, animated: true)
        }
    }
    
    func start() {
        var vc: UIViewController & Coordinating = ViewController()
        vc.coordinator = self
        
        navigationController?.setViewControllers([vc], animated: false)
        
    }
}
