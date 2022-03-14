//
//  MyList.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyList: View{
    
    var body: some View{
        List{
            Section(header: Text("오늘 할 일")){
                ForEach(1...3, id:\.self){
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .green)
                }
            }.listRowSeparator(.hidden)
            
            Section(header: Text("내일 할일")){
                ForEach(1...3, id:\.self){
                    MyCard(icon: "book.fill", title: "책읽기 \($0)", start: "1 PM", end: "3 PM", bgColor: .blue)
                }
            }.listRowSeparator(.hidden)
        }.listStyle(GroupedListStyle())
    }
}

struct MyList_Previews: PreviewProvider{
    static var previews: some View{
        MyList()
    }
}
