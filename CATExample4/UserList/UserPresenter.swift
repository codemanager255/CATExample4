//
//  UserPresenter.swift
//  CATExample4
//
//  Created by MAC on 16/11/21.
//

import Foundation
import Combine

class UserPresenter {
    
   @Published private(set) var users:[User] = []
    
    private let netwrokManager = NetworkManager()

    var numberOfUsers:Int {
        return users.count
    }
    
    private var bindings = Set<AnyCancellable>()

    func getUserInfo(index:Int)-> (name:String, email:String) {
        let user = users[index]
        return (user.name, user.email)
    }

    func getUsers() {
//        netwrokManager.get(urlString:"https://jsonplaceholder.typicode.com/users", type: User.self) { result in
//            switch result {
//            case .success(let users):
//                self.users = users ?? []
//            case .failure(let error):
//                print(error.localizedDescription)
//            }
//        }
        

        netwrokManager.get1(urlString:"https://jsonplaceholder.typicode.com/users", type:User.self).sink { error in
            print(error)
        } receiveValue: { users in
            self.users = users
        }.store(in: &bindings)

    }
    
    func getPosts() {
        netwrokManager.get(urlString: "", type:Posts.self) { result in
            
        }
    }
}
