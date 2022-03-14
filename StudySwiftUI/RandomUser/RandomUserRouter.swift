//
//  RandomUserRouter.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/01/04.
//

import Foundation
import Alamofire


enum RandomUserRouter: URLRequestConvertible{
    case getUsers(page:Int = 1,results:Int = 20)
    var baseUrl: URL{
        return URL(string: "https://randomuser.me/api/")!
    }
    var endPoint: String{
        switch self {
        case .getUsers:
            return ""
        }
    }
    var method: HTTPMethod{
        switch self{
        case .getUsers:
            return .get
        }
    }
    
    var parameters: Parameters{
        switch self{
        case .getUsers(let page, let results):
            var params = Parameters()
            params["page"] = page
            params["results"] = results
            params["seed"] = "abc"
            return params
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = baseUrl.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = method
        switch self{
        case .getUsers:
            request = try URLEncoding.default.encode(request, with: parameters)
        }
        
        return request
    }
}
