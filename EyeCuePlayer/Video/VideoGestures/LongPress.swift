// eyeCuePlayer ･ LongPress.swift
import UIKit

extension VideoVC {
    
    @objc func handleLongPress() {                              ///print("longPressLocation (y): \(longP.location(in: videoPlayerView).y)")
        
        if isController {remoteControlVC.remoteService.send(controlName: "longPress")}
        
        if !justLongPressed {       //sliderController.sliderControllerShowVideoPlayer()
            
            justLongPressed = true
            
            if calibrateMode {      // for manual calibration
                
                print("pause times: \(times)")
                
            } else {
                
                //if Int((longP.location(in: videoPlayerView)).y) < maxGestureYValue {
                
                if !slideshowModeOn {
                    slideshowModeOn = true;  print("\nslideshow mode on")
                }
                else {
                    slideshowModeOn = false;  print("slideshow mode off")
                }
                
                slideshowModeSwitchState = slideshowModeOn
                
                //handleUpSwipe()
                
                messageController.showMessageView()
                
                //}
            }
        }
    }
}

