// eyeCuePlayer ･ SwipeLeft.swift
import UIKit

extension VideoVC {
    
    @objc func handleLeftSwipe() {
        
        //if Int((leftSwipe.location(in: videoPlayerView)).y) < maxGestureYValue {
        
        if x < timeCount - 2 && !downPaused {
            
            if !slideshowModeOn {
                
                if !justFSwiped {
                    if localSpeed >= 0 {
                        justFSwiped = true;  justTapped = false
                        taps = taps - 1
                        if paused {
                            fSwipes = fSwipes + 1               //; print("\n\nfSwipe \(fSwipes)  ", terminator: "");  printPlayback(pageKey: 0)
                        }
                        if abs(descriptionT) < 0.001 || descriPaused == true {
                            playForward()
                        }
                    } else{latchKey(); print("<leftSwipe> latch error")}
                }
                    
                else {
                    fSeeks = fSeeks + 1                         //; print("fSeek \(fSeeks)   ", terminator:"");  pryntPlayback(pageKey: 0)
                    //playButtonAppear()
                    paws();  justFSeeked = true
                    seek(framesAhead: 0)
                }
                
            } else {
                if !started { started = true}
                paws()
                seek(framesAhead: 0)
            }
            
        } else {print("! x = \(x) & downPaused = \(downPaused)")}
        //}
    }
}

