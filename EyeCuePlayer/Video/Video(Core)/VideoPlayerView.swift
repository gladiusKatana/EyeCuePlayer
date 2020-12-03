// eyeCuePlayer ･ VideoPlayerView.swift
import UIKit; import AVKit

class VideoPlayerView: UIView {
    var playButtonImage = UIImage()
    var horizontalBarLeftAnchorConstraint: NSLayoutConstraint?;  var sliderLength: Float = 1136.0
    
    lazy var frameSlider: UISlider = {
        let slider = UISlider()
        //slider.setThumbImage(tallSliderImage, for: .normal)
        slider.thumbTintColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.5) //(220, green: 100, blue: 85, alpha: 0.2)
        slider.minimumTrackTintColor = .clear
        slider.maximumTrackTintColor = .clear
        slider.addTarget(self, action: #selector(slideToSeek(_:)), for: .valueChanged)
        slider.isUserInteractionEnabled = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    var progressBar: UIProgressView = {
        let bar = UIProgressView()
        bar.trackTintColor = UIColor.lightGray
        bar.progressTintColor = UIColor.rgb(83, green: 88, blue: 95, alpha: 0.7)
        return bar
    }()
    
    override init(frame: CGRect) {  //print("(override init  player)\n")
        super.init(frame: frame)
        backgroundColor = icyBlue
        setupLoadingVideo()
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            self.addPlayorToView(link: selectedVideoLink)    ///setupHardPlayer() * * *
        }
        
        avPlayer.seek(to: CMTime(seconds: 0, preferredTimescale: 100), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        frameSlider.addTarget(self, action: #selector(slideToSeek(_:)), for: .valueChanged)
        /// frameSlider.setValue(Float(times[x]/levelLength), animated: true)
        setupHorizontalBar()
        
//        if !calibrateMode {
//            addSubview(frameSlider)
//            addConstraintsWithFormat("V:[v0]-4-|", views: frameSlider)         //-12-|
//            addConstraintsWithFormat("H:|-[v0(1136)]", views: frameSlider)    //-9-|        //568  //1136  //1704
//            addSubview(progressBar)
//            addConstraintsWithFormat("V:[v0(3)]|", views: progressBar)
//            addConstraintsWithFormat("H:|-0-[v0]-0-|", views: progressBar)
//        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

