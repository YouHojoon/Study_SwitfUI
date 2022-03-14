//
//  MyGeometryReader.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2021/12/27.
//

import Foundation
import SwiftUI

struct MyGeometryReader : View{
    var body: some View{
        GeometryReader{reader in
            HStack(spacing:10){
                let width = reader.size.width - 30
                Text("1").fontWeight(.black).font(.largeTitle).frame(width:  width / 4).background(.red).foregroundColor(.white)
                Text("2").fontWeight(.black).font(.largeTitle).frame(width: width / 4).background(.purple).foregroundColor(.white)
                Text("3").fontWeight(.black).font(.largeTitle       ).frame(width: width / 4).background(.blue).foregroundColor(.white)
                Text("4").fontWeight(.black).font(.largeTitle).frame(width: width / 4).background(.yellow).foregroundColor(.white)
            }.background(.green).position(x: reader.frame(in: CoordinateSpace.local).midX, y: reader.frame(in: CoordinateSpace.local).midY)
            
            
        }.background(.black)
    }
}

struct MyGeometryReader_Previews: PreviewProvider {
    static var previews: some View {
        MyGeometryReader()
    }
}
