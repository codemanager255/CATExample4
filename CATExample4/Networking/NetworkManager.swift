//
//  NetworkManager.swift
//  CATExample4
//
//  Created by MAC on 11/11/21.
//

import Foundation
import Combine

enum ServiceError: Error {
    case url(URLError)
    case urlRequest
    case decode
}

class NetworkManager {
    
    func get1<A:Decodable>(urlString:String, type:A.Type)-> AnyPublisher<[A], ServiceError> {
        
        return Future<[A], ServiceError> { promise in
            // URLSessonDataTask
            let urlSession = URLSession.shared
            guard let url = URL(string:urlString) else {
                promise(.failure(ServiceError.urlRequest))
                return
            }
            let dataTask = urlSession.dataTask(with: url) { data, urlResponse, error in
            
                guard let _data = data else {
                    return
                }
                let decoder = JSONDecoder()
                do {
                    let users =  try decoder.decode([A].self, from: _data)
                    promise(.success(users))
                }catch {
                    promise(.failure(ServiceError.decode))
                }
            }
            dataTask.resume()
        }.receive(on: DispatchQueue.main)
        .eraseToAnyPublisher()
    }
    
    
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
