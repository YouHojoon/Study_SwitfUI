//
//  LoadingIndicatorView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/10.
//

import Foundation
import SwiftUI

struct LoadingIndicatorView: UIViewRepresentable{
    typealias UIViewType = UIActivityIndicatorView
    
    var isAnimating = true
    var color: UIColor = .white
    
    func makeUIView(context: Context) -> UIActivityIndicatorView {
        return UIActivityIndicatorView()
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        isAnimating ? uiView.startAnimating() : uiView.stopAnimating()
        uiView.style = .large
        uiView.color = color
    }
}
