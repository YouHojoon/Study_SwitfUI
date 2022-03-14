import Foundation
import SwiftUI
import URLImage
struct ProfileImageView : View {
    
    var imageUrl: URL
    
    var body: some View {
        URLImage(url: imageUrl,
                 content: {
            switch $0{
            case .success(let image):
                image.resizable().aspectRatio(contentMode: .fit)
            default:
                Image(systemName: "person.fill.questionmark").resizable().aspectRatio(contentMode: .fit)
            }
                 })
            .frame(width: 50, height: 60)
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.init(#colorLiteral(red: 0.9686274529, green: 0.78039217, blue: 0.3450980484, alpha: 1)), lineWidth: 2))
    }
}


struct ProfileImgView_Previews: PreviewProvider {
    static var previews: some View {
        
        let url = URL(string: "https://randomuser.me/api/portraits/women/21.jpg")!
        
        ProfileImageView(imageUrl: url)
    }
}
