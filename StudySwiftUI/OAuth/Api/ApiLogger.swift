//
//  OAuthApiLogger.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire
final class ApiLogger: EventMonitor{
    let queue = DispatchQueue(label: "oauth logger")
    
    func requestDidResume(_ request: Request) {
        print("ApiLogger - Resuming: \(request)")
    }
    
    func request<Value>(_ request: DataRequest, didParseResponse response: DataResponse<Value, AFError>) {
        if let error = response.error{
            switch error {
            case .sessionTaskFailed(let error):
                if error._code == NSURLErrorTimedOut{
                    print("API 타임아웃")
                    NotificationCenter.default.post(name: .requestTimeOut,object: nil)
                }
            default:
                print("default")
            }
        }
        
        debugPrint("ApiLogger - Finished: \(response)")
    }
}
