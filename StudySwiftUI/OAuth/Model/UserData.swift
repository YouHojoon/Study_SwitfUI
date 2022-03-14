//
//  UserData.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
struct UserData: Codable,Identifiable{
    let id: Int
    let name: String
    let email: String
    let avatar: String
}
