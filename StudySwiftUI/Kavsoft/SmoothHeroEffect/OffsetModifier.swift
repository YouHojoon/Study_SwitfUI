//
//  OffsetModifier.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/04/01.
//

import SwiftUI

struct OffsetModifier: ViewModifier {
    @Binding var offset : CGFloat
    func body(content:Content) -> some View{
        content.overlay{
            GeometryReader{reader in
                let minY = reader.frame(in:.named("scroll")).minY
                
                Color.clear.preference(key: OffsetKey.self, value: minY)
            }.onPreferenceChange(OffsetKey.self){
                offset = $0
            }
        }
    }
}


struct OffsetKey: PreferenceKey{
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}
