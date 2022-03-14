//
//  BaseApi.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire
class BaseApi{
    let baseUrl = "https://dev-jeongdaeri-oauth.tk/api"
    let session : Session
    let interceptors = Interceptor(interceptors:[
        BaseInterceptor()
    ])
    let monitors = [ApiLogger()] as [EventMonitor]
    
    init(){
        session = Session(interceptor: interceptors, eventMonitors: monitors)
    }
}
