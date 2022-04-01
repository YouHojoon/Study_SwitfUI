//
//  LoginView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI
import Combine
struct LoginView: View{
    @EnvironmentObject var viewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var shouldShowAlert = false
    @State var emailInput = ""
    @State var passwordInput = ""
    var body: some View{
        VStack{
            Form{
                Section{
                    TextField("", text: $emailInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.emailAddress)
                        .placeholder(shouldShow: emailInput.isEmpty){
                            Text("이메일을 입력해주세요!").font(.system(size: 20)).foregroundColor(.green).opacity(0.5)
                        }
                    SecureField("비밀번호", text: $passwordInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.default)
                }header: {
                    Text("로그인 정보")
                }
                Section{
                    Button("로그인 하기"){
                        viewModel.login(email: emailInput, password: passwordInput)
                    }
                }header: {
                    
                }
            }.onReceive(viewModel.loginSuccess){_ in
                self.shouldShowAlert = true
            }.alert("로그인 완료", isPresented: $shouldShowAlert, actions: {
                Button("확인", role: .cancel){
                    self.dismiss()
                }
            })
        }.navigationTitle(Text("로그인"))
    }
}

struct LoginView_Previews: PreviewProvider{
    static var previews: some View{
        LoginView()
    }
}
