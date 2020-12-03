// eyeCuePlayer ･ TapFeedCellButtons.swift
import UIKit

extension FeedCell {
    
    @objc func handleSlowMoViewTap(button: CalibrateButton?) {                  print("\ntapped slowMoView button")
        buttonTypeName = "slowMo"
        handleButtonTap(button: button)
    }
    
    @objc func handleSliderViewTap(button: CalibrateButton?) {                  //print("\n<sliderViewTap>")
        buttonTypeName = "slider"
        handleButtonTap(button: button)
    }
    
    func handleButtonTap(button: CalibrateButton?) {
        if let index = button?.cellIndex {                                      //print("cell index: \(index)")
            
            if let tappedVideoDuration = videos?[index].duration {              //print("duration = \(tappedVideoDuration)")
                levelLength = Double(truncating: tappedVideoDuration)
            } else {print("did not call SliderController due to  duration")}
            
            if let tappedVideoLink = videos?[index].video_link {                //print("video link = \(tappedVideoLink)")
                selectedVideoLink = tappedVideoLink
            } else {print("did not call SliderController due to  video_link")}
            
            
            if let tappedTitle = videos?[index].title {
                slowMoTempTitle = tappedTitle                                   //; print("video link = \(tappedVideoLink)")
            } else {print("did not call SliderController due to  title")}
            
            if buttonTypeName == "slider" {
                //times = [Double]();  print("now times = \(times)")
                //x = 0
                //justPressedSliderButton = true
                print("tapped slider button")
                //videoController.showVideoPlayer()
                //sliderController.sliderControllerShowVideoPlayer()
            } else {
                //slowMoController.showSlowMoVideoPlayer()
            }
        }
    }
}

