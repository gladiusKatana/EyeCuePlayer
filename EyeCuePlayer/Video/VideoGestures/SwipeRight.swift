// eyeCuePlayer ･ SwipeRight.swift
import UIKit

extension VideoVC {

    @objc func handleRightSwipe() {
        
        //if Int((leftSwipe.location(in: videoPlayerView)).y) < maxGestureYValue {
        
        if (x != 0) || (x == 0 && localSpeed < 0) {
            
            if !slideshowModeOn {
                
                if x < timeCount - 1 && !downPaused {
                    
                    if !justSwiped {    justSwiped = true
                        
                        if abs(descriptionT) < 0.001 || descriPaused == true {
                            playBackwards()
                        }
                        else  {
                            playor.rate = Float(localSpeed)
                            downPaused = false
                            latch = false
                        }
                    }
                    else {
                        if x == 2  {bubble = -1;                print("\n-------------'Bubble' in playback timing-------------")}
                        if x >= 0 {
                            rSeeks = rSeeks + 1                 //print("rSeek \(rSeeks)   ", terminator: "");  pryntPlayback(pageKey: 0)
                        } else {print("x is too small")}
                        //playButtonAppear()
                        paws()
                        seek(framesAhead: 0)
                        justSwiped = false;  justFSeeked = true
                    }
                } else {print("x is too large  x = \(x)")}
                
            } else {
                if x == 0 {x = x + 1}
                x = x - 2
                paws()
                seek(framesAhead: 0)
            }
        } else {print("\nx is too large OR localSpeed > 0  (=\(localSpeed))")}
        //}
    }
}

