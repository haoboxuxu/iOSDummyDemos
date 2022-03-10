//
//  Presenter.swift
//  MVPDemo
//
//  Created by 徐浩博 on 2022/3/10.
//

import UIKit

protocol UserPresenterDelegate: AnyObject {
    func presentUsers(users: [User])
    func presentAlert(title: String, message: String)
}

typealias Presenter = UserPresenterDelegate & UIViewController

class UserPresenter {
    
    weak var delegate: UserPresenterDelegate?
    
    public func setViewDelegate(delegate: Presenter) {
        self.delegate = delegate
    }
    
    public func getUsers() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else { return }
        
        URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                print(users)
                
                self?.delegate?.presentUsers(users: users)
            } catch {
                print(error)
            }
        }.resume()
    }
}
