//
//  OAuthCredential.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Alamofire
struct OAuthCredential: AuthenticationCredential{
    let accessToken: String
    let refreshToken: String
    let expiration: Date
    var requiresRefresh: Bool{ Date(timeIntervalSinceNow: 60*5) > expiration}
}
