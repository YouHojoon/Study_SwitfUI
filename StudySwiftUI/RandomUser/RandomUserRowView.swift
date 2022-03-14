//
//  RandomUserRowView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/01/03.
//

import Foundation
import SwiftUI

struct RandomUserRowView: View{
    
    var randomUser: RandomUser
    
    init(_ randomUser: RandomUser){
        self.randomUser = randomUser
    }
    
    var body: some View{
        HStack{
            ProfileImageView(imageUrl: URL(string:randomUser.photo.large)!)
            Text("\(randomUser.name.description)").fontWeight(.heavy).font(.system(size: 25)).lineLimit(2).minimumScaleFactor(0.5)
        }.frame(minWidth: 0, maxWidth: .infinity, minHeight: 0,maxHeight: 50, alignment: .leading).padding(.vertical)
    }
}

struct RandomUserRowView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserRowView(RandomUser.getDummy())
    }
}
