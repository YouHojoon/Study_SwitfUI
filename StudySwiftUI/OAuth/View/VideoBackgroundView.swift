//
//  VideoBackgroundView.swift
//  StudySwiftUI
//
//  Created by 유호준 on 2022/03/16.
//

import SwiftUI
import AVFoundation
import UIKit
struct VideoBackgroundView: View {
    var body: some View {
        ZStack{
            LoopingVideoPlayerView()
            Color.black.opacity(0.4)
        }.edgesIgnoringSafeArea(.all)
    }
}

struct VideoBackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        VideoBackgroundView()
    }
}


fileprivate struct LoopingVideoPlayerView: UIViewRepresentable{
    func makeUIView(context: Context) -> some UIView {
        return LoopingVideoPlayerUIView(frame: .zero)
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

fileprivate class LoopingVideoPlayerUIView: UIView{
    fileprivate var playerLayer = AVPlayerLayer()
    fileprivate var playerLooper : AVPlayerLooper?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let videoFileUrl = Bundle.main.url(forResource: "bg-video", withExtension: "mp4")!
        
        let playerItem = AVPlayerItem(url: videoFileUrl)
        let queuePlayer = AVQueuePlayer(items: [playerItem])
        playerLayer.player = queuePlayer
        playerLayer.videoGravity = .resizeAspectFill
        self.layer.addSublayer(playerLayer)
        
        playerLooper = AVPlayerLooper(player: queuePlayer, templateItem: playerItem)
        queuePlayer.play()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        playerLayer.frame = bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
