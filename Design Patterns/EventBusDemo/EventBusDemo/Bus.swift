//
//  Bus.swift
//  EventBusDemo
//
//  Created by 徐浩博 on 2022/5/30.
//

import Foundation

final class Bus {
    static let shared = Bus()
    
    private init() {}
    
    enum EventType {
        case userFetchEvent
    }
    
    struct Subscription {
        let type: EventType
        let queue: DispatchQueue
        let completion: ((BaseEvent<[User]>) -> Void)
    }
    
    private var subscriptions: [Subscription] = []
    
    func  subscribe(_ type: EventType, completion: @escaping ((BaseEvent<[User]>) -> Void)) {
        let newSubscription = Subscription(type: type, queue: .global(), completion: completion)
        subscriptions.append(newSubscription)
    }
    
    func subscribeOnMain(_ type: EventType, completion: @escaping ((BaseEvent<[User]>) -> Void)) {
        let newSubscription = Subscription(type: type, queue: .main, completion: completion)
        subscriptions.append(newSubscription)
    }
    
    func publish(_ type: EventType, _ event: UserFetchEvent) {
        let subscribers = subscriptions.filter { $0.type == type }
        subscribers.forEach { subscriber in
            subscriber.queue.async {
                subscriber.completion(event)
            }
        }
    }
}
