//
//  ViewController.swift
//  MVVMDemo
//
//  Created by 徐浩博 on 2022/2/25.
//

import UIKit

struct User {
    let name: String
    let nation: String
}

struct CellViewModel {
    let name: String
    let nation: String
}

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(CustomCell.nib(), forCellReuseIdentifier: CustomCell.cellID)
        return tableView
    }()
    
    let data = [
        User(name: "haoboxuxu", nation: "China"),
        User(name: "Batman", nation: "Gotham"),
        User(name: "Hopper X", nation: "Space"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.cellID, for: indexPath) as! CustomCell
        let model = data[indexPath.row]
        let viewModel = CellViewModel(name: model.name, nation: model.nation)
        cell.configWith(viewModel)
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

