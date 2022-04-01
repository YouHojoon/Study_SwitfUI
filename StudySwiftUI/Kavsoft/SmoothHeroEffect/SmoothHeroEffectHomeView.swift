//
//  HomeView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/31.
//

import SwiftUI

struct SmoothHeroEffectHomeView: View {
    
    enum Tab: String,CaseIterable{
        case films = "Films"
        case localities = "Localities"
    }
    
    @State var currentIndex = 0
    @State var currentTab  = Tab.films
    
    @State var detailMovie: Movie?
    @State var showDetailView: Bool = false
    @State var currentCardSize: CGSize = .zero
    @State var showDetailContent: Bool = false
    @Namespace var animation
    @Environment(\.colorScheme) var scheme
    let movies = Movie.getDummyList()
    var body: some View {
        ZStack{
            GeometryReader{reader in
                TabView(selection: $currentIndex){
                    ForEach(movies.indices, id: \.self){
                        Image(movies[$0].artwork).resizable().aspectRatio(contentMode: .fill).frame(width: reader.size.width, height: reader.size.height).clipped().tag($0)
                    }
                }.tabViewStyle(.page(indexDisplayMode: .never)).animation(.easeInOut, value: currentIndex)
                
                let color: Color = (scheme == .dark ? .black : .white)
                LinearGradient(colors: [
                    .black, .clear
                    ,color.opacity(0.15)
                    ,color.opacity(0.5)
                    ,color.opacity(0.8)
                    ,color
                    ,color
                ], startPoint: .top, endPoint: .bottom)
                Rectangle().fill(.ultraThinMaterial)
            }.ignoresSafeArea()
        
            VStack{
                //Nav bar
                HStack(spacing:0){
                    ForEach(Tab.allCases, id:\.rawValue){tab in
                        Button{
                            withAnimation{
                                currentTab = tab
                            }
                        }label: {
                            Text(tab.rawValue).foregroundColor(.white).padding(.vertical, 6).padding(.horizontal, 20).background{
                                if currentTab == tab{
                                    Capsule().fill(.regularMaterial).environment(\.colorScheme, .dark).matchedGeometryEffect(id: "tab", in: animation)
                                }
                            }
                        }
                    }
                }.padding()
                
                Carousel(index:$currentIndex,spacing:20, trailingSpacing: 110, items: movies){movie in
                    GeometryReader{reader in
                        Image(movie.artwork).resizable().aspectRatio(contentMode: .fill).frame(width:reader.size.width, height: reader.size.height).cornerRadius(15)
                            .matchedGeometryEffect(id: movie.id, in: animation).onTapGesture {
                            currentCardSize = reader.size
                            detailMovie = movie
                            withAnimation(.easeInOut){
                                showDetailView = true
                            }
                        }
                    }
                }.padding(.top, 70)
                
                HStack(spacing:5){
                    ForEach(movies.indices){
                        Circle().fill(currentIndex == $0 ? .blue : .gray.opacity(0.5)).frame(width:currentIndex == $0 ? 10 : 6, height: currentIndex == $0 ? 10 : 6)
                    }
                }.animation(.easeInOut, value: currentIndex)
            
                HStack{
                    Text("Popular").font(.title3.bold())
                    Spacer()
                    Button{
                        
                    }label:{
                        Text("See More").font(.system(size:16, weight: .semibold))
                    }
                }.padding()
                
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing:15){
                        ForEach(movies){
                            Image($0.artwork).resizable().aspectRatio(contentMode: .fill).frame(width: 100, height: 120).cornerRadius(15)
                        }
                    }.padding()
                }
            }.overlay{
                if let movie = detailMovie, showDetailView{
                    DetailView(movie: movie, showDetailView: $showDetailView, detailMovie: $detailMovie, currentCardSize: $currentCardSize, showDetailContent: $showDetailContent, animation: animation)
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        SmoothHeroEffectHomeView().preferredColorScheme(.dark)
    }
}
