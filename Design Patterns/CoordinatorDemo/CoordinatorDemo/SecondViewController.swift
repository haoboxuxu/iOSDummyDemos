//
//  SecondViewController.swift
//  CoordinatorDemo
//
//  Created by 徐浩博 on 2022/6/26.
//

import UIKit

class SecondViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "SecondVC"
        self.view.backgroundColor = .systemBlue
    }

}
