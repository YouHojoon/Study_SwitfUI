//
//  WebViewModel.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/10.
//

import Foundation
import Combine


class WebViewModel: ObservableObject{
    enum Navigation{
        case BACK
        case FORWARD
        case REFRESH
    }
    enum UrlType{
        case NAVER
        case GOOGLE
        case DEV_JEONG_DAE_RI
        
        var url:URL?{
            switch self{
            case .NAVER:
                return URL(string: "https://www.naver.com")
            case .GOOGLE:
                return URL(string: "https://www.google.com")
            case .DEV_JEONG_DAE_RI:
                return URL(string: "https://tuentuenna.github.io/simple_js_alert/")
            }
        }
    }
    
    var changedUrlSubject = PassthroughSubject<WebViewModel.UrlType,Never>()
    var webNavigationSubject = PassthroughSubject<Navigation, Never>()
    var webSiteTitleSubject = PassthroughSubject<String, Never>()
    var nativeToJsEvent = PassthroughSubject<String, Never>()
    var jsAlertEvent = PassthroughSubject<JsAlert, Never>()
    var shouldShowIndicator = PassthroughSubject<Bool, Never>()
}



