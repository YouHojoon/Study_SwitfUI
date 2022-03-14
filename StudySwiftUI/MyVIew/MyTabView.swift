//
//  MyTabView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

enum TabIndex {
    case home
    case cart
    case profile
}

struct MyTabView : View{
    @State var tabIndex : TabIndex
    var largerScale : CGFloat = 1.4
    var body: some View{
        GeometryReader{geometry in
            ZStack(alignment: .bottom){
                self.changeMyView().position(x: geometry.frame(in: .local).midX, y: geometry.frame(in: .local).midY).animation(.none)
                
                Circle().frame(width: 90, height: 90).offset(x: self.calcCircleBgPosition(geometry: geometry) ,y: 18).foregroundColor(.yellow)
                
                HStack(spacing: 0){
                    Button(action: {
                        withAnimation{
                            self.tabIndex = .home
                        }
                    }, label: {
                        Image(systemName: "house.fill").font(.system(size: 25)).scaleEffect(tabIndex == .home ? largerScale : 1.0).frame(width: geometry.size.width / 3, height: 50).foregroundColor(tabIndex == .home ? .blue : .gray).offset(y:tabIndex == .home ? -10 : 0).background(.white)
                    })
                    Button(action: {
                        withAnimation{
                            self.tabIndex = .cart
                        }
                    }, label: {
                        Image(systemName: "cart.fill").font(.system(size: 25)).scaleEffect(tabIndex == .cart ? largerScale : 1.0).frame(width: geometry.size.width / 3, height: 50).foregroundColor(tabIndex == .cart ? .blue : .gray).offset(y:tabIndex == .cart ? -10 : 0).background(.white)
                    })
                    Button(action: {
                        withAnimation{
                            self.tabIndex = .profile
                        }
                    }, label: {
                        Image(systemName: "person.circle.fill").font(.system(size: 25)).scaleEffect(tabIndex == .profile ? largerScale : 1.0).frame(width: geometry.size.width / 3, height: 50).foregroundColor(tabIndex == .profile ? .blue : .gray).offset(y:tabIndex == .profile ? -10 : 0).background(.white)
                    })
                }
            }
        }.edgesIgnoringSafeArea(.all)
    }
    
    func calcCircleBgPosition(geometry: GeometryProxy) -> CGFloat{
        switch tabIndex {
        case .home:
            return -(geometry.size.width / 3)
        case .cart:
            return 0
        case .profile:
            return (geometry.size.width / 3)
        }
    }
    func changeMyView() -> Text{
        switch tabIndex {
        case .home:
            return Text("홈")
        case .cart:
            return Text("장바구니")
        case .profile:
            return Text("프로필")
        }
    }
}

struct MyTabView_Previews: PreviewProvider {
    static var previews: some View {
        MyTabView(tabIndex: .home)
    }
}
