//
//  User.swift
//  CATExample4
//
//  Created by MAC on 10/11/21.
//

import Foundation

struct User:Decodable {
    let id:Int
    let name:String
    let username:String
    let email:String
    let address:Address
}

struct Address:Decodable {
    let street:String
    let suite:String
    let city:String
    let zipcode:String
    let geo:Geo
}

struct Geo:Decodable {
    let lat:String
    let lng:String
}
