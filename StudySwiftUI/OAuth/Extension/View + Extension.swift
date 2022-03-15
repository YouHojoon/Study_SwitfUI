//
//  View + Extension.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/15.
//

import Foundation
import SwiftUI
extension View {
    func placeholder<T: View>(shouldShow: Bool, alignment: Alignment = .leading, @ViewBuilder placeholderText: () -> T) -> some View{
        ZStack(alignment: alignment){
            placeholderText().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
