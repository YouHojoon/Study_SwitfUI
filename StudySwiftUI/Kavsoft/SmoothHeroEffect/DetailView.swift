//
//  DetailView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/04/01.
//

import SwiftUI

struct DetailView: View {
    var movie: Movie
    @Binding var showDetailView: Bool
    @Binding var detailMovie: Movie?
    @Binding var currentCardSize: CGSize
    @Binding var showDetailContent: Bool
    @State var offset: CGFloat = 0
    
    var animation: Namespace.ID
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack{
                Image(movie.artwork).resizable().aspectRatio(contentMode:.fill).frame(width: currentCardSize.width, height: currentCardSize.height).cornerRadius(15)
                    .matchedGeometryEffect(id: movie.id, in: animation)
                VStack(spacing:15){
                    Text("Story Plot").font(.largeTitle).fontWeight(.semibold).frame(maxWidth:.infinity, alignment: .leading).padding(.top, 25)
                    
                    Text("abcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwog\nabcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwogbcdeawtpwjgpjgpowjaGPjgpjapogajpgjpwajopgwapjapwgojgpawjpjwog").multilineTextAlignment(.leading)
                    
                    Button{
                        
                    }label: {
                        Text("Book Ticket").fontWeight(.semibold).foregroundColor(.white).padding(.vertical).frame(maxWidth:.infinity).background{
                            RoundedRectangle(cornerRadius: 10, style:.continuous).fill(.blue)
                        }
                    }.padding(.top, 20)
                }.opacity(showDetailContent ? 1 : 0).offset(y: showDetailContent ? 0 : 300)
                    
            
            }
            .padding().modifier(OffsetModifier(offset: $offset))
        }.coordinateSpace(name: "scroll")
        .frame(maxWidth:.infinity, maxHeight: .infinity).background{
            Rectangle().fill(.ultraThinMaterial).ignoresSafeArea()
        }.onAppear{
            withAnimation(.easeInOut){
                showDetailContent = true
            }
        }.onChange(of: offset){
            if $0 > 120{
                withAnimation(.easeInOut){
                    showDetailContent = false
                }
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.05){
                    withAnimation(.easeInOut){
                        showDetailView = false
                    }
                }
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        SmoothHeroEffectHomeView()
    }
}
