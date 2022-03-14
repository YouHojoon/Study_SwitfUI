//
//  LoadingScreenView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/10.
//

import Foundation
import SwiftUI

struct LoadingScreenView : View{
    var body: some View{
        ZStack(alignment: .center){
            Color.black.opacity(0.6).edgesIgnoringSafeArea(.all)
            LoadingIndicatorView()
        }
    }
}
