
import Foundation
import SwiftUI

struct MyProjectCard: View {
    @State
    var shouldShowAlert : Bool = false
    var body: some View{
        VStack(alignment:.leading, spacing: 0){
            
            Divider().opacity(0)
            Text("정대리 유튭 프로젝트").font(.system(size: 23)).fontWeight(.black).padding(.bottom, 5)
            
            Text("10 AM ~ 11AM").foregroundColor(.secondary).padding(.bottom, 10)
            
            HStack{
                Image("1").resizable().frame(width: 50, height: 50).clipShape(Circle())
                Image("2").resizable().frame(width: 50, height: 50).clipShape(Circle())
                Image("3").resizable().frame(width: 50, height: 50).clipShape(Circle())
                Spacer()
                Button{
                    self.shouldShowAlert = true
                }label:{
                    Text("확인").fontWeight(.bold)
                }.padding().frame(width: 80).foregroundColor(.white).background(.blue).cornerRadius(20).alert(isPresented: $shouldShowAlert){
                    Alert(title: Text("알림창 입니다."))
                }
            }
        }.padding(20).background(.yellow).cornerRadius(20)
    }
}

struct MyProjectCard_Previews: PreviewProvider{
    static var previews: some View{
        MyProjectCard()
    }
}
