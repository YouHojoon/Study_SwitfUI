//
//  OAuthApi.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire
import Combine

final class OAuthApi: BaseApi{
    static let shared = OAuthApi()
    
    func register(name:String, email: String, password:String) -> AnyPublisher<UserData,AFError>{
        return session.request(OAuthRouter.register(name: name, email: email, password: password)).publishDecodable(type:OAuthResponse.self).value()
            .map{
                UserDefaultsManager.shared.setTokens(accessToken: $0.token.accessToken, refreshToken: $0.token.refreshToken)
                return $0.user
            }.eraseToAnyPublisher()
    }
    
    func login(email: String, password:String) -> AnyPublisher<UserData,AFError>{
        return session.request(OAuthRouter.login(email: email, password: password)).publishDecodable(type:OAuthResponse.self).value()
            .map{
                UserDefaultsManager.shared.setTokens(accessToken: $0.token.accessToken, refreshToken: $0.token.refreshToken)
                return $0.user
            }.eraseToAnyPublisher()
    }
}
