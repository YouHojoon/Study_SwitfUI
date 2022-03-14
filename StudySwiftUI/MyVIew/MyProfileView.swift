//
//  MyProfileView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyProfileView: View{
    var body: some View{
  
        VStack{
            Image("1").resizable().scaledToFill().frame(width: 200, height: 200).clipShape(Circle()).overlay(Circle().stroke(Color.yellow, lineWidth: 10)).shadow(color: .gray, radius: 6, x: 0, y: 7)
            
            Text("개발하는 유호준").fontWeight(.black).font(.system(size: 23)).padding()
            Text("잘 부탁드립니다!").fontWeight(.black).font(.system(size: 18)).padding()
            
            HStack{
                Button{
                    
                }label: {
                    Text("구독하러 가기").fontWeight(.bold)
                }.padding().background(.blue).foregroundColor(.white).cornerRadius(20)
                
                Button{
                    
                }label: {
                    Text("오픈깨똑방 가기").fontWeight(.bold)
                }.padding().background(.orange).foregroundColor(.white).cornerRadius(20)
            }
            Spacer()
        }.navigationTitle("내 프로필").toolbar{
            ToolbarItem(placement:.navigationBarTrailing){
                NavigationLink(destination: Text("설정 창")){
                    Image(systemName: "gear").font(.system(size: 20)).foregroundColor(.black)
                }
            }
        }
    }
}

struct MyProfileView_Previews: PreviewProvider {
    static var previews: some View {
        MyProfileView()
    }
}
