//
//  MyDragAndDrop.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/13.
//

import Foundation
import SwiftUI

struct DataItem: Hashable, Identifiable{
    var id: UUID
    var title: String
    var color: Color
    
    init(title: String, color:Color){
        self.title = title
        self.color = color
        self.id = UUID()
    }
}

struct MyDragAndDropView: View{
    @State var dataList = [
        DataItem(title: "1번", color: .yellow),
        DataItem(title: "2번", color: .green),
        DataItem(title: "3번", color: .orange)
    ]
    @State var draggedItem:DataItem?
    @State var isEditMode = false
    var body: some View{
        LazyVStack{
            Toggle("수정 모드:", isOn: $isEditMode)
            ForEach(dataList, id: \.self){item in
                Text(item.title).frame(maxWidth: .infinity, minHeight: 50).background(item.color).onDrag{
                    self.draggedItem = item
                    return NSItemProvider(item: nil, typeIdentifier: item.title)
                }.onDrop(of: [.text], delegate: MyDropDelgate(currentItem: item, dataList: $dataList, draggedItem: $draggedItem, isEditMode: $isEditMode))
            }
        }.onChange(of: isEditMode){_ in
            print("변경")
        }
    }
}

struct MyDropDelgate: DropDelegate{
    let currentItem: DataItem
    @Binding var dataList: [DataItem]
    @Binding var draggedItem: DataItem?
    @Binding var isEditMode: Bool
    
    func dropEntered(info: DropInfo) {
        guard let draggedItem = self.draggedItem else {
            return
        }
        guard isEditMode else{
            return
        }
        if draggedItem != currentItem{
            let from = dataList.firstIndex(of: draggedItem)!
            let to = dataList.firstIndex(of: currentItem)!
            withAnimation{
                self.dataList.move(fromOffsets: IndexSet(integer: from), toOffset: to > from ? to + 1 : to)
            }
        }
    }
    func validateDrop(info: DropInfo) -> Bool {
        return true
    }
    func dropUpdated(info: DropInfo) -> DropProposal? {
        return nil
    }
    //Drop 벗어낫을 시
    func dropExited(info: DropInfo) {
        
    }
    //Drop 처리
    func performDrop(info: DropInfo) -> Bool {
        return true
    }
}

struct MyDragAndDropView_Previews: PreviewProvider{
    static var previews: some View{
        MyDragAndDropView()
    }
}
