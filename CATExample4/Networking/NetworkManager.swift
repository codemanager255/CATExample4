//
//  NetworkManager.swift
//  CATExample4
//
//  Created by MAC on 11/11/21.
//

import Foundation

class NetworkManager {
    
    func get<A:Decodable>(urlString:String, type:A.Type, completionHandler:@escaping(Result<[A], Error>)-> Void) {
        
        // URLSessonDataTask
        let urlSession = URLSession.shared
        guard let url = URL(string:urlString) else {
            return
        }
        let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in
        
            guard let _data = data else {
                completionHandler(.failure(error as! Error))
                return
            }
            let decoder = JSONDecoder()
            do {
                let users =  try decoder.decode([A].self, from: _data)
                completionHandler(.success(users))
                //completionHandler(users, nil)
            }catch {
                completionHandler(.failure(error))
               // completionHandler(nil, error.localizedDescription)
            }
        }
        dataTask.resume()
    }
}
