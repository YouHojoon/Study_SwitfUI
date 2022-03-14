//
//  ProfileView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI

struct ProfileView: View{
    @EnvironmentObject var viewModel: UserViewModel
    @State var userData: UserData?
    
    var body: some View{
        VStack{
            Form{
                Section{
                    HStack{
                        Spacer()
                        if let avatar = userData?.avatar {
                            AsyncImage(url: URL(string: avatar)!){
                                switch $0{
                                case .empty:
                                    ProgressView().frame(width: 250, height: 250, alignment: .center)
                                case .success(let image):
                                    image.resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250, alignment: .center)
                                case .failure:
                                    Image(systemName: "person.fill.questionmark").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250, alignment: .center)
                                }
                            }
                        }
                        else{
                            Image(systemName: "person.fill.questionmark").resizable().aspectRatio(contentMode: .fit).frame(width: 250, height: 250, alignment: .center)
                        }
                        Spacer()
                    }
                }
                Section{
                    if let userData = userData {
                        Text("아이디: \(userData.id)")
                        Text("이름: \(userData.name)")
                        Text("이메일: \(userData.email)")
                    }
                }
                Section{
                    Button{
                        viewModel.fetchCurrentUser()
                    }label: {
                        Text("새로고침")
                    }
                }
            }.onAppear{
                if userData == nil{
                    viewModel.fetchCurrentUser()
                }
            }.onReceive(viewModel.$loggedInUser){
                guard let user = $0 else {
                    return
                }
                userData = user
            }
        }.navigationTitle(Text("프로필"))
    }
}

struct ProfileView_Previews: PreviewProvider{ 
    static var previews: some View{
        ProfileView(userData: UserData(id: 0, name: "test", email: "test1234", avatar: "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash"))
    }
}

