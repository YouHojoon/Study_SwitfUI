//
//  MyBasicCard.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyCard: View{
    var icon: String
    var title: String
    var start: String
    var end: String
    var bgColor: Color
    
    var body: some View{
        HStack(spacing:20){
            Image(systemName: icon).font(.system(size: 40)).foregroundColor(.white)
            VStack(alignment:.leading, spacing: 0){
                Divider().opacity(0)
                Text(title).font(.system(size: 23)).foregroundColor(.white).fontWeight(.bold).padding(.bottom, 5)
                Text("\(start) - \(end)").foregroundColor(.white)
                
            }
        }.padding(20).background(bgColor).cornerRadius(20)
        
    }
}

struct MyBasicCard_Previews: PreviewProvider{
    static var previews: some View{
        MyCard(icon: "book.fill", title: "책 읽기", start: "1 PM", end: "9 PM", bgColor: .purple)
    }
}
