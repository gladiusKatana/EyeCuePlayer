// eyeCuePlayer ･ SwipeRight.swift
import UIKit

extension VideoVC {
    
    @objc func handleRightSwipe() {
        
        if isController {remoteControlVC.remoteService.send(controlName: "rswipe")}
        //if Int((leftSwipe.location(in: videoPlayerView)).y) < maxGestureYValue {
        
        if (ecks != 0) || (ecks == 0 && localSpeed < 0) {
            if !slideshowModeOn {
                if ecks < timeCount - 1 && !downPaused {
                    if !justSwiped {    justSwiped = true
                        if abs(descriptionT) < 0.001 || descriPaused == true {
                            playBackwards()
                        }
                        else  {
                            avPlayer.rate = Float(localSpeed)
                            downPaused = false
                            latch = false
                        }
                    }
                    else {
                        if ecks == 2  {bubble = -1          ; print("\n-------------'Bubble' in playback timing-------------")}
                        if ecks >= 0 {
                            rSeeks = rSeeks + 1             ///; print("rSeek \(rSeeks)   ", terminator: "");  pryntPlayback(pageKey: 0)
                        } else {print("x is too small")}
                        //playButtonAppear()
                        paws()
                        seek(framesAhead: 0)
                        justSwiped = false;  justFSeeked = true
                    }
                } else {print("x is too large  x = \(ecks)")}
            } else {
                if ecks == 0 {ecks = ecks + 1}
                ecks = ecks - 2
                paws()
                seek(framesAhead: 0)
            }
        } else {print("\nx is too large OR localSpeed > 0  (=\(localSpeed))")}
        //}
    }
}

