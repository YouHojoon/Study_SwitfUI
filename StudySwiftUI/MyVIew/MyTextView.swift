//
//  MyTextView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/24.
//
import SwiftUI
import Foundation

struct MyTextView : View {
    @Binding
    var isActivated: Bool
    
    init(isActivated: Binding<Bool> = .constant(false)){
        _isActivated = isActivated
    }
    
    
    @State
    private var index: Int = 0
    
    //배경색 배열
    private let backgroundColors : [Color] = [
        .red,.yellow,.blue,.cyan,.gray,.green,.orange
    ]
    var body: some View{
        VStack{
            
            Text("\(String(isActivated))").font(.system(size: 50)).frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                
            Text("안뇽안뇽").tracking(20).font(.system(size: 50)).background(Color.cyan).foregroundColor(.pink).padding(30).lineSpacing(20)
                .shadow(color: .yellow, radius: 1.5, x: 0, y: 10)
        }.background(backgroundColors[index]).edgesIgnoringSafeArea(.all).onTapGesture {
            print("배경 아이템 클릭")
            self.index += 1
            if self.index > backgroundColors.capacity - 1 {
                self.index = 0
            }
        }
        
        
    }
}


struct MyTextViewPreview : PreviewProvider{
    static var previews: some View{
        MyTextView()
    }
}
