// eyeCuePlayer ･ VideoVC.swift
import UIKit;  import CoreMedia // VC stands for ViewController, of course

class VideoVC: UIViewController, UIGestureRecognizerDelegate {
    
    lazy var videoPlayerView: VideoPlayerView = {        //try deleting / putting back 'lazy' & see what happens
        let videoPlayerView = VideoPlayerView()
        return videoPlayerView
    }()
    
    func showVideoPlayer() {                        //print("--------------------------- video player ", terminator:"")
        setParameters()
        
        actualDescription = false
        justPinched = false;  justLongPressed = false
        //hourGlassOn = true  //messageController.showMessageView()
        
        if playerTempTitle != slowMoTempTitle {
            seekOn = true  //means seek on  forward mode or forFast mode //or the backward modes
        }
        
        playor.seek(to: CMTime(seconds: 0, preferredTimescale: 100), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        stopWatch = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(chrono), userInfo: nil, repeats: true)
        
        backgroundView.backgroundColor = .clear
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)

        setupVideoGestures()
        
        backgroundView.addSubview(videoPlayerView)
        if autoDescriptionsOn /*|| x == 0*/ {messageController.showMessageView()}
        
        if viewFrameHeight == 768 {
            UIView.animate(withDuration: 1.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
                self.videoPlayerView.backgroundColor = .clear //UIColor.rgb(150, green: 180, blue: 220, alpha: 0.4)
            }, completion: nil)
        } else {videoPlayerView.backgroundColor = .clear}

        /*if calibrateMode && !started {
            playForward()
            times = [0.0] //[Double]()
        }
        justPressedSliderButton = true;  times = [Double]()
        timingCircleAppearFromController(xCoord: 667/2, yCoord: 375 - 36, circleColor: .black)*/
        
        //sliderController.sliderControllerShowVideoPlayer() // may trigger constraint bugs
    }
    
    @objc func chrono(){elapsed = elapsed + 0.1  /*;  print("t = \(elapsed)")*/}
    
    func removeStuff() {                                                                                            //print("\nremovedStuff\n")
        backgroundView.removeGestureRecognizer(leftSwipe);  backgroundView.removeGestureRecognizer(rightSwipe)
        backgroundView.removeGestureRecognizer(upSwipe);  backgroundView.removeGestureRecognizer(downSwipe)
        backgroundView.removeGestureRecognizer(tapG)
        backgroundView.removeGestureRecognizer(pinchMe)
        //newPlayButton.removeFromSuperview()
        
        backgroundView.removeFromSuperview()
        videoPlayerView.removeFromSuperview()
        videoPlayerView.frameSlider.removeFromSuperview()
        sliderView.removeFromSuperview()
        messageView.removeFromSuperview()
        
        titleLabel.text = "eyeCuePlayer"
    }
}

