//
//  RandomUserListView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/01/03.
//

import Foundation
import SwiftUI
struct RandomUserListView: View{
    @ObservedObject var randomUserViewModel = RandomUserViewModel.shared
    
    var body: some View{
        VStack{
            List(randomUserViewModel.randomUsers){randomUser in
                RandomUserRowView(randomUser).onAppear{
                    if self.randomUserViewModel.randomUsers.last!.id == randomUser.id {
                        randomUserViewModel.fetchMoreActionSubject.send(())
                    }
                }
            }.refreshable {
                randomUserViewModel.fetchMoreActionSubject.send(())
            }.edgesIgnoringSafeArea(.vertical)
            if randomUserViewModel.isLoading {
                ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red))
                    .scaleEffect(1.7, anchor: .center)
            }
        }
      
       
//        ProgressView().progressViewStyle(CircularProgressViewStyle(tint: .red))
//            .scaleEffect(1.7, anchor: .center)
     
    }
    
    init(){
        randomUserViewModel.fetchRandomUsers()
        print(randomUserViewModel.randomUsers.count)
    }
}

struct RandomUserListView_Previews: PreviewProvider {
    static var previews: some View {
        RandomUserListView()
    }
}
