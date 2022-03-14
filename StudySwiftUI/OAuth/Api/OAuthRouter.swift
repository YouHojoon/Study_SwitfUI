//
//  UserRouter.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire

enum OAuthRouter: URLRequestConvertible{
    case register(name:String, email:String, password:String)
    case login(email:String, password: String)
    case tokenRefresh
    
    var endPoint: String{
        switch self{
        case .register:
            return "user/register"
        case .login:
            return "user/login"
        case .tokenRefresh:
            return "user/token-refresh"
        }
    }
    
    var parameters: Parameters{
        switch self{
        case let .login(email,password):
            return [
                "email":email,
                "password":password
            ]
        case let .register(name,email,password):
            return [
                "name":name,
                "email":email,
                "password":password
            ]
        case .tokenRefresh:
            return [
                "refresh_token" : UserDefaultsManager.shared.getToken(key: .refreshToken) ?? ""
            ]
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: OAuthApi.shared.baseUrl)!.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = .post
        request.httpBody = try JSONEncoding.default.encode(request, with: parameters).httpBody
        return request
    }
}
