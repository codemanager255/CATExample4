//
//  UserPresenter.swift
//  CATExample4
//
//  Created by MAC on 16/11/21.
//

import Foundation

class UserPresenter {
    
    private var users:[User] = []
    private let netwrokManager = NetworkManager()

    var numberOfUsers:Int {
        return users.count
    }
    
    func getUserInfo(index:Int)-> (name:String, email:String) {
        let user = users[index]
        return (user.name, user.email)
    }

    func getUsers(completionHandler:@escaping (Bool)-> Void) {
        netwrokManager.get(urlString:"https://jsonplaceholder.typicode.com/users", type: User.self) { result in
            switch result {
            case .success(let users):
                self.users = users ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
            DispatchQueue.main.async {
                completionHandler(true)
            }
        }
    }
    
    func getPosts() {
        netwrokManager.get(urlString: "", type:Posts.self) { result in
            
        }
    }
}
