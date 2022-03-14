//
//  BaseInterceptor.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire

class BaseInterceptor: RequestInterceptor {
    func adapt(_ urlRequest: URLRequest, for session: Session, completion: @escaping (Result<URLRequest, Error>) -> Void) {
        var urlRequest = urlRequest
        urlRequest.headers.add(name: "Content-Type", value: "application/json; charset=UTF-8")
        urlRequest.headers.add(name: "Accept", value: "application/json; charset=UTF-8")
        completion(.success(urlRequest))
    }
}
