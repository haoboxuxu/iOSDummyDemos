//
//  ViewController.swift
//  EventBusDemo
//
//  Created by 徐浩博 on 2022/5/30.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var userListVM = UserListViewModel()
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.frame = view.bounds
        
        tableView.delegate = self
        tableView.dataSource = self
        
        Bus.shared.subscribeOnMain(.userFetchEvent) { [weak self] event in
            guard let result = event.result else {
                return
            }
            switch result {
            case .success(let users):
                self?.userListVM.users = users
                self?.tableView.reloadData()
            case .failure(let error):
                print(error)
            }
        }
        
        userListVM.fetchListData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print(userListVM.users)
        return userListVM.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "🧑🏻‍💻\(userListVM.users[indexPath.row].name) 📧\(userListVM.users[indexPath.row].email)"
        return cell
    }
}

