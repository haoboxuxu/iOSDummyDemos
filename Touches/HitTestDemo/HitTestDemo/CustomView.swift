//
//  CustomView.swift
//  HitTestDemo
//
//  Created by 徐浩博 on 2022/9/2.
//

import UIKit

class CustomView: UIView {

    override init(frame: CGRect) {
        super.init(frame: frame)
        config()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        config()
    }
    
    private var _parentView: UIView!
    
    var parentView: UIView {
        set {
            _parentView = newValue
        }
        get {
            return _parentView
        }
    }
    
    var lastTranslation = CGPoint(x: 0, y: 0)
    
    func config() {
        backgroundColor = .orange
        isUserInteractionEnabled = true
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(didDrag(gesture:)))
        addGestureRecognizer(gesture)
    }
    
    @objc func didDrag(gesture: UIPanGestureRecognizer) {
        let translation = gesture.translation(in: parentView)
        center = CGPoint(x: lastTranslation.x + translation.x, y: lastTranslation.y + translation.y)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        lastTranslation = self.center
    }
    
    override func hitTest(_ point: CGPoint, with event: UIEvent?) -> UIView? {
//        print(point)
//        return super.hitTest(point, with: event)
        let frame = self.bounds.insetBy(dx: -50, dy: -50)
        return frame.contains(point) ? self : nil
    }
    
    override func point(inside point: CGPoint, with event: UIEvent?) -> Bool {
        return super.point(inside: point, with: event)
    }
}
