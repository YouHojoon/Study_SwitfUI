//
//  StudySwiftUIApp.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/24.
//

import SwiftUI

@main
struct StudySwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            OAuthView().environmentObject(UserViewModel())
        }
    }
}
