//
//  MyNavigationView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyNavigationView: View{
    var body: some View{
        NavigationView{
            MyList().navigationTitle("안녕하세요!").navigationBarTitleDisplayMode(.inline).toolbar{
                
                ToolbarItem(placement: .navigationBarLeading){
                    Button(action: {print("gg")},label: {
                        Text("호호")
                    })
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    NavigationLink(destination: Text("넘어온 화면")){
                        Image(systemName: "bookmark.fill").font(.largeTitle).foregroundColor(.black)
                    }
                }
            }
        }
    }
}

struct MyNavigationView_Previews: PreviewProvider {
    static var previews: some View {
        MyNavigationView()
    }
}
