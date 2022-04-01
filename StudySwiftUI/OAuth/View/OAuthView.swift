//
//  OAuthView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/14.
//

import Foundation
import SwiftUI
import Combine
struct OAuthView: View{
    var subscription = Set<AnyCancellable>()
    @EnvironmentObject var viewModel: UserViewModel
    @State var isLoading = false
    let testViewModel = TestViewModel()
    
    var body: some View{
        NavigationView{
            ZStack{
                VideoBackgroundView()
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
                    
                    Button{
                        withAnimation{
                            self.testViewModel.requsetTimeOutTest()
                        }
                    }label:{
                        Text("리퀘스트 테스트")
                    }.padding().background(.blue).foregroundColor(.white).clipShape(RoundedRectangle(cornerRadius: 6))
                    Spacer()
                }.onReceive(testViewModel.$isLoading, perform: {
                    self.isLoading = $0
                }).padding()
                if isLoading{
                    Color.black.opacity(0.7).ignoresSafeArea()
                    ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .white)).scaleEffect(2)
                    
                }
            }
            
        }
    }
}

struct OAuthView_Previews: PreviewProvider{
    static var previews: some View{
        OAuthView().environmentObject(UserViewModel())
    }
}
