//
//  MyButton.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/28.
//

import Foundation
import SwiftUI

struct MyButtonView: View{
    var body: some View{
        VStack{
            Button{
                
            }label: {
                Text("탭").fontWeight(.bold)
            }.buttonStyle(MyButtonStyle())
        }
    }
}

struct MyButtonView_Previews: PreviewProvider {
    static var previews: some View {
        MyButtonView()
    }
}

struct MyButtonStyle: ButtonStyle{
    func makeBody(configuration: Configuration) -> some View {
        configuration.label.foregroundColor(.white).padding().background(.red).cornerRadius(20).scaleEffect(configuration.isPressed ? 1.3 : 1)
    }
}
