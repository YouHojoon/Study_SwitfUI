//
//  UserListView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI
struct UserListView: View{
    
    @EnvironmentObject var viewModel: UserViewModel
    @State var users: [UserData] = []
    
    var body: some View{
        List(users){user in
            NavigationLink{
                ProfileView(userData: user)
            }label: {
                HStack{
                    AsyncImage(url: URL(string: user.avatar)!){
                        switch $0{
                        case .empty:
                            ProgressView().frame(width: 120, height: 120, alignment: .center)
                        case .success(let image):
                            image.resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 120, alignment: .center)
                        case .failure:
                            Image(systemName: "person.fill.questionmark").resizable().aspectRatio(contentMode: .fit).frame(width: 120, height: 12, alignment: .center)
                        }
                    }
                }
                Spacer()
                VStack(alignment: .leading){
                    Text(user.name).font(.title3)
                    Text(user.email).font(.callout)
                }
                Spacer()
            }
        }.onAppear{
            viewModel.fetchUserList()
        }.onReceive(viewModel.$userList){
            self.users = $0
        }.navigationTitle("사용자 목록")
    }
}

struct UserListView_Previews: PreviewProvider{
    static var previews: some View{
        UserListView(users: [
            UserData(id: 0, name: "test", email: "test1234", avatar: "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash"),
            UserData(id: 1, name: "test1", email: "test1234", avatar: "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash"),
            UserData(id: 2, name: "test2", email: "test1234", avatar: "https://www.gravatar.com/avatar/b87c0cd09c8c06be1d50f18d2104c814.jpg?s=200&d=robohash")
        ])
    }
}
