//
//  MyPicker.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/28.
//

import Foundation
import SwiftUI
struct MyPickerView: View{
    @State private var selectionValue = 0
    let color : [Color] = [.red, .green, .blue]
    var body: some View{
        VStack{
            Circle().frame(width: 100, height: 100).foregroundColor(color[selectionValue])
            Text("선택된 값 : \(selectionValue)")
            Text("선택된 색깔 : \(color[selectionValue].description)")
            
            Picker("aa", selection: $selectionValue, content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            }).pickerStyle(.segmented).padding()
            
            Picker("bbbb", selection: $selectionValue, content: {
                Text("레드").tag(0)
                Text("그린").tag(1)
                Text("블루").tag(2)
            }).pickerStyle(WheelPickerStyle()).frame(width: 50, height: 100).clipped().padding().border(self.color[selectionValue], width: 10)
        }
    }
}

struct MyPickerView_Previews: PreviewProvider {
    static var previews: some View {
        MyPickerView()
    }
}
