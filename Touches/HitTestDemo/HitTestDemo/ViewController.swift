//
//  ViewController.swift
//  HitTestDemo
//
//  Created by 徐浩博 on 2022/9/2.
//

import UIKit

class ViewController: UIViewController {
    
    let customView = CustomView()
    let resetButton: UIButton = {
        let btn = UIButton()
        btn.titleLabel?.text = "reset"
        btn.titleLabel?.textColor = .systemBlue
        btn.backgroundColor = .gray
        return btn
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(customView)
        customView.parentView = self.view
        self.view.addSubview(resetButton)
        resetButton.addTarget(self, action: #selector(didTapReset), for: .touchUpInside)
    }
    
    @objc func didTapReset() {
        customView.center = self.view.center
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        customView.frame = CGRect(x: self.view.frame.width / 2 - 50, y: self.view.frame.height / 2 - 50, width: 100, height: 100)
        resetButton.frame = CGRect(x: self.view.frame.width / 2 - 50, y: 80, width: 100, height: 44)
    }
}

