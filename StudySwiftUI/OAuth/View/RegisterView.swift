//
//  LoginView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI
struct RegisterView: View{
    @EnvironmentObject var viewModel: UserViewModel
    @Environment(\.dismiss) var dismiss
    
    @State var nameInput = ""
    @State var emailInput = ""
    @State var passwordInput = ""
    @State var repeatPasswordInput = ""
    @State var shouldShowAlert = false
    var body: some View{
        VStack{
            Form{
                Section{
                    TextField("이름", text: $nameInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.default)
                }header: {
                    Text("이름")
                }
                Section{
                    TextField("이메일", text: $emailInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.emailAddress)
                }header: {
                    Text("이메일")
                }
                Section{
                    SecureField("비밀번호", text: $passwordInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.default)
                    SecureField("비밀번호 확인", text: $repeatPasswordInput).textInputAutocapitalization(.never).disableAutocorrection(true).keyboardType(.default)
                }header: {
                    Text("비밀번호")
                }
                Section{
                    Button("회원가입 하기"){
                        viewModel.register(name: nameInput, email: emailInput, password: passwordInput)
                    }
                }header: {
                    
                }
            }.onReceive(viewModel.registSuccess){_ in
                self.shouldShowAlert = true
            }.alert("회원가입 완료", isPresented: $shouldShowAlert, actions: {
                Button("확인", role: .cancel){
                    self.dismiss()
                }
            })
        }.navigationTitle(Text("회원가입"))
    }
}

struct RegisterView_Previews: PreviewProvider{
    static var previews: some View{
        RegisterView()
    }
}
