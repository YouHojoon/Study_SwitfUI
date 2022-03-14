//
//  UserDefaultsManager.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
class UserDefaultsManager{
    enum Key: String, CaseIterable{
        case refreshToken
        case accessToken
    }
    
    static let shared = UserDefaultsManager()
    private init() {}
    
    func clearAll(){
        Key.allCases.forEach{
            UserDefaults.standard.removeObject(forKey: $0.rawValue)
        }
    }
    
    func setTokens(accessToken: String, refreshToken:String){
        UserDefaults.standard.set(accessToken, forKey: Key.accessToken.rawValue)
        UserDefaults.standard.set(refreshToken, forKey: Key.refreshToken.rawValue)
        UserDefaults.standard.synchronize()
    }
    
    func getToken(key: Key) -> String?{
        return UserDefaults.standard.string(forKey: key.rawValue)
    }
}
