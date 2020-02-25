// eyeCuePlayer ･ VideoViewSetup.swift
import UIKit; import AVKit

extension VideoPlayerView {
    
    func setupLoadingVideo() {
        let filePath = Bundle.main.path(forResource: " loadingScreen", ofType:"m4v")
        let url = URL(fileURLWithPath: filePath!)
        avPlayer = AVPlayer(url: url)
        
        setupPlayerLayer()
        avPlayer.play()
        playerEndReplay() ///if !viewLoaded {playerEndReplay()}
        playerEndNotification()
    }
    
    func setupPlayerLayer() {
        playerLayer = AVPlayerLayer(player: avPlayer)
        self.layer.addSublayer(playerLayer)
        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect//Fill
        playerLayer.frame = globalWindow.frame///(UIApplication.shared.keyWindow?.frame)!
    }
    
    func setupHorizontalBar() {
        let horizontalBarView = UIView()
        
        if calibrateMode {horizontalBarView.backgroundColor = .clear}
        else {horizontalBarView.backgroundColor = .white} //uiBarsColor} //UIColor(white: 0.95, alpha: 0.9)}
        
        horizontalBarView.translatesAutoresizingMaskIntoConstraints = false
        if !calibrateMode {
            addSubview(horizontalBarView)
            horizontalBarLeftAnchorConstraint = horizontalBarView.leftAnchor.constraint(equalTo: self.leftAnchor)
            horizontalBarLeftAnchorConstraint?.isActive = true
            
            horizontalBarView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
            horizontalBarView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1).isActive = true
            horizontalBarView.heightAnchor.constraint(equalToConstant: 36).isActive = true //26
        }
    }
}

