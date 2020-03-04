// eyeCuePlayer ･ Tap.swift
import UIKit

extension VideoVC {
    
    @objc func handleTap() {                                                    ///print("location = \(tapG.location(in: videoPlayerView))")
        
        if isController {
            remoteControlVC.remoteService.send(controlName: "tap")
        }
        
        //if printAnomalousDiffValue {print("diff = \(diff)")}
        
        //if (Int((tapG.location(in: videoPlayerView)).y) < maxGestureYValue) || viewFrameHeight == 768 {
        
        if ecks < timeCount - 2 {
            
            if slideshowModeOn {
                handleLeftSwipe()
            }
            else {
                justTapped = true                                               ///;  print("\n[the tap location is: \(tapG.location(in: tapG.view))]", terminator: "")
                
                if abs(descriptionT) < 0.001 || descriPaused == true {
                    
                    //if x < timeCount - 2 {  //2 because of timeD
                    
                    if !downPaused {
                        
                        if localSpeed >= 0 {
                            playForward()
                        } else {latchKey(); print("<tap> latch error")}
                    }
                    else  {
                        avPlayer.rate = Float(localSpeed)
                        downPaused = false
                        latch = false
                    }
                    //} else {print("\n! x is too large...")}
                    
                } else {print("descriptionT is too large")}
            }
        } else {                                                                print("\n                  ...looped back around...\n")
            ecks = -1
            started = false
            paws()
            seek(framesAhead: 0)
        }
        //}
    }
}

