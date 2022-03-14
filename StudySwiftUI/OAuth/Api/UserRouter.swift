//
//  UserRouter.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire

enum UserRouter: URLRequestConvertible{
    case fetchCurrentUserInfo
    case fetchUsers
    
    var endPoint: String{
        switch self{
        case .fetchUsers:
            return "user/all"
        case .fetchCurrentUserInfo:
            return "user/info"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: OAuthApi.shared.baseUrl)!.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = .get
        return request
    }
}
