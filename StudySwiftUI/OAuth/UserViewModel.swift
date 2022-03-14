//
//  UserViewModel.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import Combine

class UserViewModel: ObservableObject{
    var subscription = Set<AnyCancellable>()
    @Published var loggedInUser: UserData? = nil
    @Published var userList : [UserData] = []
    
    let registSuccess = PassthroughSubject<(),Never>()
    let loginSuccess = PassthroughSubject<(),Never>()
    
    
    func register(name:String, email:String, password: String){
        OAuthApi.shared.register(name: name, email: email, password: password).sink(receiveCompletion: {
            print("UserViewModel Completion: \($0)")
        }, receiveValue: {
            self.loggedInUser = $0
            self.registSuccess.send(())
        }).store(in: &subscription)
    }
    
    func login(email:String, password:String){
        OAuthApi.shared.login(email: email, password: password).sink(receiveCompletion: {
            print("UserViewModel Completion: \($0)")
        }, receiveValue: {
            self.loggedInUser = $0
            self.loginSuccess.send(())
        }).store(in: &subscription)
    }
    
    func fetchCurrentUser(){
        UserApi.shared.fetchCurrentUserInfo().sink(receiveCompletion: {
            print("UserViewModel Completion: \($0)")
        }, receiveValue: {
            self.loggedInUser = $0
        }).store(in: &subscription)
    }
    
    func fetchUserList(){
        UserApi.shared.fetchUsers().sink(receiveCompletion: {
            print("UserViewModel Completion: \($0)")
        }, receiveValue: {
            self.userList = $0
        }).store(in: &subscription)
    }
    
}
