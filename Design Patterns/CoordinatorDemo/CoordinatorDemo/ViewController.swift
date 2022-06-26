//
//  ViewController.swift
//  CoordinatorDemo
//
//  Created by 徐浩博 on 2022/6/26.
//

import UIKit

class ViewController: UIViewController, Coordinating {
    var coordinator: Coordinator?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .systemRed
        title = "Home"
        
        let button: UIButton = {
            let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 100))
            button.backgroundColor = .systemTeal
            button.center = view.center
            button.setTitle("Nav to Sec.", for: .normal)
            button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
            return button
        }()
        
        self.view.addSubview(button)
    }
    
    @objc func didTapButton() {
        coordinator?.eventOccurred(with: .buttonTapped)
    }

}

