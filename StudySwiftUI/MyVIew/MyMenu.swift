//
//  MyMenu.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/28.
//

import Foundation
import SwiftUI

struct MyMenuView: View {
    @State private var isPresented : Bool = false
    @State private var msg = ""
    var body: some View{
        NavigationView{
            Text("하이요").navigationTitle("하이요").toolbar{
                ToolbarItem(placement: .navigationBarTrailing, content: {
                    Menu{
                        Button{
                            self.isPresented = true
                            self.msg = "오늘도 빡코딩"
                        }label: {
                            Text("오늘도 빡코딩")
                        }
                        
                        Button{
                            self.isPresented = true
                            self.msg = "집에서 쉬는 날"
                        }label: {
                            Text("집에서 쉬는 날")
                        }
                        
                    }label: {
                        Circle().foregroundColor(.yellow).frame(width: 50, height: 50).overlay{
                            Image(systemName: "ellipsis").foregroundColor(.black).font(.system(size: 30))
                        }
                    }
                })
            }.alert(isPresented: $isPresented, content: {
                Alert(title: Text("알림"), message: Text(self.msg), dismissButton: .default(Text("확인")))
            })
        }
    }
}

struct MyMenuView_Previews: PreviewProvider {
    static var previews: some View {
       MyMenuView()
    }
}
