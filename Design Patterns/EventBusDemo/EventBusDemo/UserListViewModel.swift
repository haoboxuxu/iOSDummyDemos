//
//  UserViewModel.swift
//  EventBusDemo
//
//  Created by 徐浩博 on 2022/5/30.
//

import Foundation

struct UserListViewModel {
    
    var users: [User] = []
    
    func fetchListData() {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/users") else {
            return
        }
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data else {
                return
            }
            let event: UserFetchEvent
            do {
                let users = try JSONDecoder().decode([User].self, from: data)
                event = UserFetchEvent.init(identifier: UUID().uuidString,
                                            result: .success(users))
            } catch {
                event = UserFetchEvent.init(identifier: UUID().uuidString,
                                            result: .failure(error))
            }
            
            Bus.shared.publish(.userFetchEvent, event)
            
        }.resume()
    }
}
