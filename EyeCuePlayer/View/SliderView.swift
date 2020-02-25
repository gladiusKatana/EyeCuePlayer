// eyeCuePlayer ･ SliderView.swift
import UIKit;   import AVKit

class SliderView: UIView {
    
    var calibrationSlider: UISlider = {
        let slider = UISlider()
        slider.thumbTintColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.2) 
        slider.minimumTrackTintColor = UIColor.darkGray
        slider.maximumTrackTintColor = UIColor.lightGray //rgb(83, green: 88, blue: 95, alpha: 0.7)//(100, green: 100, blue: 220,...)
        slider.addTarget(self, action: #selector(slideCalibrate(_:)), for: .valueChanged)
        slider.isUserInteractionEnabled = true
        slider.translatesAutoresizingMaskIntoConstraints = false
        return slider
    }()
    
    override init(frame: CGRect) { //print("\n  (override init slider)")                                              // ! called twice
        super.init(frame: frame)
        calibrationSlider.addTarget(self, action: #selector(slideCalibrate(_:)), for: .valueChanged)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            self.calibrationSlider.setValue(Float(times[ecks]/levelLength), animated: true)
        }
        backgroundColor = .clear    //UIColor.rgb(150, green: 180, blue: 220, alpha: 0.8)
        
        ///if justLongPressed {setupSliderPlayer(link: selectedVideoLink)}
        addSubview(calibrationSlider)
        addConstraintsWithFormat("V:[v0]-12-|", views: calibrationSlider)
        addConstraintsWithFormat("H:|-10-[v0]-10-|", views: calibrationSlider)
        
        if !justLongPressed {
            avPlayer.seek(to: CMTime(seconds: Double(times[ecks]), preferredTimescale: 400), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
    }
    
    /**/
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

/*func setupSliderPlayer(link: String) {                                                   //?? Seems to get called twice...  or does it??
    if let url = URL(string: selectedVideoLink) {   //was NSURL(string: selected Video Link) without the spaces lol
        playor = AVPlayer(url: url as URL)
        let tempVideoCell = VideoCell()
        tempVideoCell.createDocumentFolderUrl(downloadUrl: url, formatSelectorId: "video")      //! prevent console print for sliderView
        viewLoaded = true                                                                                  /**********************/
    }
    
    playerLayer = AVPlayerLayer(player: playor)
    self.layer.addSublayer(playerLayer)
    playerLayer.videoGravity = AVLayerVideoGravityResizeAspect//Fill
    //playerLayer.frame = (UIApplication.shared.keyWindow?.frame)!
    
    if let keyWindow = UIApplication.shared.keyWindow {
        //let sliderViewFrame = CGRect(x: 0, y: 5, width: keyWindow.frame.width, height: keyWindow.frame.height - 90)
        let sliderViewFrame = CGRect(x: 0, y: 0, width: keyWindow.frame.width, height: keyWindow.frame.height)
        playerLayer.frame = sliderViewFrame
    }
    timeCount = times.count;  timeCountMinusOne = timeCount - 1       //;  print("timeCount = \(timeCount)")
}*/

