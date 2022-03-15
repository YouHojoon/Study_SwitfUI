//
//  TestApi.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/15.
//

import Foundation
import Alamofire
import Combine
final class TestApi: BaseApi{
    static let shared = TestApi()
    func requestTimeoutTest() -> AnyPublisher<(), AFError>{
        return session.request(TestRouter.requestTimeOut).publishDecodable(type: UserInfoResponse.self).value()
            .map{
                $0.user
            }.eraseToAnyPublisher()
    }
}
