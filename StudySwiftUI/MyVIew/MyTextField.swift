//
//  MyTextField.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/28.
//

import Foundation
import SwiftUI

struct MyTextFieldView: View{
    @State private var username = ""
    @State private var passwd = ""
    var body: some View{
        VStack{
            HStack{
                TextField("사용자 이름", text: $username).textFieldStyle(.roundedBorder).textInputAutocapitalization(.none).disableAutocorrection(true)
                Button{
                    self.username = ""
                }label: {
                    Image(systemName: "xmark.circle.fill").foregroundColor(.secondary).font(.system(size: 25))
                }
            }
            HStack{
                SecureField("비밀번호", text: $passwd).textFieldStyle(.roundedBorder)
                    .textInputAutocapitalization(.none).disableAutocorrection(true)
                Button{
                    self.passwd = ""
                }label: {
                    
                    Image(systemName: "xmark.circle.fill").foregroundColor(.secondary).font(.system(size: 25))
                }
            }
            
            Text("입력한 비밀번호 : \(passwd)")
        }.padding(.horizontal, 50)
        
    }
}

struct MyTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        MyTextFieldView()
    }
}
