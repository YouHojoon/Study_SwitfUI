//
//  MyLazyVGrid.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/29.
//

import Foundation
import SwiftUI

struct MyLazyVGideView: View{
    let data = Array(1...2000).map({"\($0) 번"})
    @State private var selectedValue = 1
    /*
        .adaptive 여러 개 채우기
        .flexible 하나 만 채우기
     */
    var body: some View{
        GeometryReader{geometry in
            VStack{
                Picker("",selection: $selectedValue, content: {
                    Button{
                        
                    }label: {
                        Image(systemName: "list.bullet")
                    }.tag(0)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "square.grid.2x2.fill")
                    }.tag(1)
                    
                    Button{
                        
                    }label: {
                        Image(systemName: "square.grid.3x3.fill")
                    }.tag(2)
                }).pickerStyle(.segmented)
                ScrollView{
                    switch selectedValue{
                    case 0:
                        LazyVGrid(columns: [GridItem(.flexible(minimum: 10, maximum: geometry.size.width))]){
                            ForEach(1...2000, id:\.self){_ in
                                MyCard(icon: "book", title: "책 읽기", start: "1 PM", end: "3 PM", bgColor: .green)
                            }
                        }
                    case 1:
                        LazyVGrid(columns: [GridItem(.flexible(minimum: 160, maximum: geometry.size.width)), GridItem(.flexible(minimum: 160, maximum: geometry.size.width))], spacing: 10){
                            ForEach(1...2000, id:\.self){number in
                                VStack{
                                    Circle().frame(width: 80, height: 80)
                                    Text("타이틀 : \(number)")
                                    Text("서브 타이틀 : \(number)")
                                }.frame(width: 160,height: 200).background(.orange).cornerRadius(20)
                            }
                        }
                    default:
                       Spacer()
                    }
                    
                }.animation(.easeInOut).padding()
            }.edgesIgnoringSafeArea(.bottom)
        }
        
    }
}

struct MyLazyVGrid_Previews: PreviewProvider {
    static var previews: some View {
        MyLazyVGideView()
    }
}
