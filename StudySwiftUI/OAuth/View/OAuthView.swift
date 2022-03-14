//
//  OAuthView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI

struct OAuthView: View{
    
    @EnvironmentObject var viewModel: UserViewModel
    
    var body: some View{
        NavigationView{
            VStack{
                Spacer()
                Image(systemName: "lock.shield.fill").font(.system(size:160))
                Spacer()
                NavigationLink{
                    LoginView()
                }label:{
                    HStack{
                        Spacer()
                        Text("로그인 하러가기")
                        Spacer()
                    }.padding().background(.blue).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 6))
                }
                NavigationLink{
                    RegisterView()
                }label:{
                    HStack{
                        Spacer()
                        Text("회원가입 하러가기")
                        Spacer()
                    }.padding().background(.black).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 6))
                }
                Spacer().frame(height:40)
                NavigationLink{
                    ProfileView(userData: nil)
                }label:{
                    HStack{
                        Spacer()
                        Text("내 프로필 보러가기")
                        Spacer()
                    }.padding().background(.purple).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 6))
                }
                NavigationLink{
                    UserListView()
                }label:{
                    HStack{
                        Spacer()
                        Text("사용자 목록 보러가기")
                        Spacer()
                    }.padding().background(.green).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 6))
                }
                Spacer()
                Spacer()
            }.padding()
        }
    }
}

struct OAuthView_Previews: PreviewProvider{
    static var previews: some View{
        OAuthView()
    }
}
