//
//  ViewController.swift
//  PageControlDemo
//
//  Created by 徐浩博 on 2022/4/3.
//

import UIKit

let numOfPages = 5

class ViewController: UIViewController {
    
    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .red
        return scrollView
    }()
    
    private let pageControl: UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = numOfPages
        pageControl.backgroundColor = .systemCyan
        return pageControl
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(scrollView)
        view.addSubview(pageControl)
        scrollView.delegate = self
        pageControl.addTarget(self, action: #selector(pageControlDidChange(_:)), for: .valueChanged)
    }
    
    @objc func pageControlDidChange(_ sender: UIPageControl) {
        let current = sender.currentPage
        scrollView.setContentOffset(CGPoint(x: CGFloat(current) * view.frame.size.width, y: 0), animated: true)
    }

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        pageControl.frame = CGRect(x: 10,
                                   y: view.frame.size.height - 100,
                                   width: view.frame.size.width - 20,
                                   height: 70)
        scrollView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height - 100)
        
        if scrollView.subviews.count == 2 {
            configScrollView()
        }
    }
    
    private func configScrollView() {
        scrollView.contentSize = CGSize(width: CGFloat(numOfPages) * view.frame.size.width, height: scrollView.frame.size.height)
        scrollView.isPagingEnabled = true
        let colors: [UIColor] = [
            .systemBlue, .systemMint, .systemTeal, .systemBrown, .systemOrange
        ]
        for x in 0..<numOfPages {
            let page = UIView(frame: CGRect(x: CGFloat(x) * view.frame.size.width,
                                            y: 0,
                                            width: view.frame.size.width,
                                            height: scrollView.frame.size.height))
            page.backgroundColor = colors[x]
            scrollView.addSubview(page)
        }
    }
}


extension ViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.size.width + 0.5)
    }
}
