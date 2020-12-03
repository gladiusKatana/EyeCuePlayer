// eyeCuePlayer ･ SwipeVertical.swift
import UIKit

extension VideoVC {
    
    @objc func handleUpSwipe() {
        
        //if /*(Int((upSwipe.location(in: videoPlayerView)).y) < maxGestureYValue) ||*/ autoDescriptionsOn {
        
        if paused {
            //latch = true
            justUpSwiped = true
            messageController.showMessageView()
        }
        
        //}
    }
    
    
    @objc func handleDownSwipe() {
        
        if calibrateMode {
            if !started {playForward()      ;  print("(calibrate mode) initial tap to play")}
        }
        
        else {
            //if Int((downSwipe.location(in: videoPlayerView)).y) < maxGestureYValue {
            if justUpSwiped    {
                justDownSwiped = true
                if justFSeeked {justFSeeked = false}
                //latch = true
            }
            //}
        }
    }
}

