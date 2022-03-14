//
//  JsAlert.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/10.
//

import Foundation
struct JsAlert: Identifiable{
    enum `Type`: CustomStringConvertible{
        var description: String{
            switch self {
            case .JS_ALERT:
                return "JS_ALERT"
            case .JS_BRIDGE:
                return "JS_BRIDGE"
            }
        }
        
        case JS_ALERT, JS_BRIDGE
        
    }
    
    let id = UUID()
    var message : String? = ""
    var type: `Type`
    
    init(_ message: String? = nil, _ type: Type){
        self.message = message
        self.type = type
    }
}
