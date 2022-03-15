//
//  UserRouter.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire

enum TestRouter: URLRequestConvertible{
   case requestTimeOut
    
    var endPoint: String{
        switch self{
        case .requestTimeOut:
            return "request-timeout"
        }
    }
    
    func asURLRequest() throws -> URLRequest {
        let url = URL(string: "https://request-timeout.free.beeceptor.com")!.appendingPathComponent(endPoint)
        var request = URLRequest(url: url)
        request.method = .get
        
        return request
    }
}
