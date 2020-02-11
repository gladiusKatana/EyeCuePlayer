// eyeCuePlayer ･ Pause.swift
import UIKit;  import AVKit

extension VideoVC {
    
    func paws() {       mode = "paused"  //;  print("paws")             // ⏸ Pause
        
        //let timeToPause = DispatchTime.now();  DispatchQueue.main.asyncAfter(deadline: timeToPause) {playor.pause()}
        playor.pause()
        
        //if !slideshowModeOn && x < (timeCount - 4) && started {animatePlayButton(0, deration: 0.5)}
        latch = false
        
        if !(x <= 1 && localSpeed == -1.8) {
            if !justSlid && x < timeCount - 1 {
                x = x + 1
            }
        } else {
            x = x + bubble
            if bubble == 1 {print("(x+\(bubble))")}                     // bubble print
        }
        
        if hourGlassOn && !(justFSeeked) {print("")}
        //print("----------", terminator: "");  pryntPlayback(pageKey: 1)
        //if printAnomalousDiffValue {print("(paws) diff = \(diff)")}
        
        updateProgressBar()                  //if slydInCurrentTimeInterval {x = x - 1}
        
        descriptionT = 0.0
        timeAccumulatedForSlider = 0.0
        localSpeed = 0.0;           bubble = 0
        justSlid = false;           playButtonOn = false
        
        paused = true;              justInterrupted = false
        descriPaused = false;       justDownSwiped = false
        /*latch = false;*/          justUpSwiped = false;       justTapped = false
        gonnaSpeed = false;         justFSwiped = false;        justFSeeked = false
        justLongPressed = false
        
        if !slideshowModeOn {justSwiped = false}
        
        if calibrateMode {
            videoPlayerView.removeDuplicates()
            videoPlayerView.setDeltas()
        }
        
        //if !slideshowModeOn {
        animatePlayButton(0, deration: 0.75)
        //}
    }
}

