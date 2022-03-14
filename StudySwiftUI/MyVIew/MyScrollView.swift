//
//  MyScrollView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/12.
//

import Foundation
import SwiftUI
struct MyScrollView: View{
    
    @State var selectedIndex: Int = 0
    @Namespace var topID
    @Namespace var bottomID
    
    var selectedBG : (Int,Int) -> Color = {
        if $0 == $1{
            return Color.green
        }
        else{
            return Color.red
        }
    }
    
    var body: some View{
        VStack{
            ScrollViewReader{proxy in
                ScrollView(.vertical, showsIndicators: false){
                    Button("Scroll to Bottom"){
                        withAnimation{
                            proxy.scrollTo(bottomID)
                        }
                    }.id(topID)
                    
                    ForEach(0..<100){
                        Text("오늘도 빡코딩! \($0)").padding().background(selectedBG(selectedIndex,$0)).id($0)
                    }.onChange(of: selectedIndex){index in
                        print("changed index: \(index)")
                        withAnimation{
                            proxy.scrollTo(index, anchor: .center)
                        }
                                            }
                    
                    Button("Scroll to Top"){
                        withAnimation{
                            proxy.scrollTo(topID)
                        }
                    }.id(bottomID)
                }
            }
            
            HStack(spacing:10){
                Spacer()
                Button{
                    self.selectedIndex = 1
                }label: {
                    Text("index: 1")
                }
                Spacer()
                
                Button{
                    self.selectedIndex = 10
                }label: {
                    Text("index: 10")
                }
                
                Spacer()
                Button{
                    self.selectedIndex = 99
                }label: {
                    Text("index: 99")
                }
                Spacer()
            }
        }
    }
}

struct MyScrollView_Previews: PreviewProvider{
    static var previews: some View{
        MyScrollView()
    }
}
