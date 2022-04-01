//
//  Carousel.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/31.
//

import SwiftUI

struct Carousel<Content:View,T:Identifiable>: View {
    
    let items: [T]
    let spacing: CGFloat
    let trailingSpacing: CGFloat
    let content: (T) -> Content
    
    @Binding var index: Int
    @GestureState var offset: CGFloat = 0.0
    init(index: Binding<Int>, spacing:CGFloat = 5, trailingSpacing:CGFloat = 0,items: [T], @ViewBuilder content: @escaping (T) -> Content){
        self.items = items
        self.trailingSpacing = trailingSpacing//얼마나 오른쪽 content를 보여줄 것이냐
        self.spacing = spacing
        self.content = content
        _index = index
    }
    
    @State var currentIndex: Int = 0
    
    var body: some View {
        GeometryReader{reader in
            let width = reader.size.width - (trailingSpacing - spacing)//content의 실제 길이
            let adjustMentWidth = (trailingSpacing / 2) - spacing// 0이 아닐 때 왼쪽에서 보여줄 content의 길이
            //
            HStack(spacing: spacing){
                ForEach(items){
                    content($0).frame(width:reader.size.width - trailingSpacing).offset(y:getOffset(item: $0, width: width))
                }
            }.padding(.horizontal, spacing)
            .offset(x:(CGFloat(currentIndex) * -width) + (currentIndex != 0 ? adjustMentWidth : 0) + offset).gesture(DragGesture().updating($offset){value, out, _ in
                out = value.translation.width / 1.5
                }.onEnded{
                    let offset = $0.translation.width//드래그한 길이
                    //width를 드래그로 나눔 0~1 사이 숫자
                    let progress = -offset / width
                    //반올림
                    let roundIndex = progress.rounded()
                    //min - item 오른쪽 끝에 가면 더이상 드래그 x
                    //max - item 왼쪽 끝에 가게 되면 더이상 드래그 x
                    currentIndex = max(min(currentIndex + Int(roundIndex), items.count - 1),0)
                    index = currentIndex
                })
        }.animation(.easeInOut, value: offset == 0)
    }
    
    func getOffset(item:T, width:CGFloat)->CGFloat{
        let progress = ((offset < 0 ? offset : -offset) / width) * 60
        let topOffset = -progress < 60 ? progress : -(progress + 120)
        let previous = getIndex(item: item) - 1 == currentIndex ? (offset < 0 ? topOffset: -topOffset)  : 0
//        let previous = 0.0
//        let previous = getIndex(item: item) + 1 == index ? topOffset : 0
        let next = getIndex(item: item) + 1 == currentIndex ? (offset < 0 ? -topOffset: topOffset): 0
        
        
        let check = currentIndex >= 0 && currentIndex < items.count ? (getIndex(item: item) - 1 == currentIndex ? previous : next) : 0
        return getIndex(item: item) == currentIndex ? -60 - topOffset : check
    }
    
    func getIndex(item: T) -> Int{
        let index = items.firstIndex{$0.id == item.id} ?? 0
        return index
    }
}

//struct Carousel_Previews: PreviewProvider {
//    static var previews: some View {
////        var index:Int = 0
////        Carousel(index:$index,spacing:15,trailingSpacing: 100,items: Movie.getDummyList()){
////            Image($0.artwork).resizable()
//        }
//    }
//}
