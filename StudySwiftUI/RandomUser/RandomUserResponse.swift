//
//  RandomUserResponse.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/01/03.
//

import Foundation

struct RandomUser: Codable, Identifiable{
    var id = UUID()
    var name: Name
    var photo: Photo
    
    private enum CodingKeys: String, CodingKey{
        case name = "name"
        case photo = "picture"
    }
    
    public static func getDummy() -> Self{
        return RandomUser(name: Name.getDummy(), photo: Photo.getDummy())
    }
}

struct Name: Codable, CustomStringConvertible{
    var title: String
    var first: String
    var last: String
    public static func getDummy() -> Self{
        return Name(title: "dummy", first: "dummy", last: "dummy")
    }
    var description: String {
        return "[\(title)] \(first) \(last)"
    }
}

struct Photo: Codable{
    var large: String
    var medium: String
    var thumbnail: String
    public static func getDummy() -> Self{
        return Photo(large: "https://randomuser.me/api/portraits/men/31.jpg", medium: "https://randomuser.me/api/portraits/men/31.jpg", thumbnail: "https://randomuser.me/api/portraits/men/31.jpg")
    }
}

struct Info: Codable{
    var seed: String
    var results: Int
    var page: Int
}

struct RandomUserResponse: Codable, CustomStringConvertible{
    var results: [RandomUser]
    var info: Info
    var discription: String {
        return "results.count: \(results.count) info: \(info.seed)"
    }
}
