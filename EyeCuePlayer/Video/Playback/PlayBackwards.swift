// eyeCuePlayer ･ PlayBackwards.swift
import UIKit;  import AVKit

extension VideoVC {
    
    func playBackwards() { //print("<< playing back")
        //newPlayButton.removeFromSuperview()
        dismissPlayButton(0, deration: 0.5)
        
        if justFSeeked {justFSeeked = false}
        
        if !latch {
            //if !justInterrupted {clearAnyDescriptions()}
            avPlayer.pause()
            
            if paused {  mode = "reverse";  selectCorrectionFactor()
                
                if ecks > 0 {
                    latch = true
                    localSpeed = -1.8;  avPlayer.rate = Float(localSpeed)
                    swipes = swipes + 1
                    
                    if ecks == 3  {bubble = 1/*; print("\nbubble _____________________________________________")*/}
                    print("\n\nSwipe \(swipes)   ", terminator: "");  pryntPlayback(pageKey: 1)
                    
                    frameMinus(cutoff: 1)
                    if slydInCurrentTimeInterval {ecks = ecks + 1}
                    
                    tThrow = CFAbsoluteTimeGetCurrent(); tThrowForSlider = CFAbsoluteTimeGetCurrent()
                    if !justSlid {delT = -timeD[ecks]}
                    
                    if slydInCurrentTimeInterval {delT = -(position - times[ecks-1])}
                    
                    if ecks > 1 {
                        frameMinus(cutoff: 1)
                    }
                    playbackTimer(localT: 1.0)  //; print("called playbackTimer reverse")
                }
            }
            else {
                mode = "fastRev"
                selectCorrectionFactor()
                latch = true
                avPlayer.play()
                localSpeed = -1.9;  avPlayer.rate = Float(localSpeed)
                
                if justInterrupted {
                    tThrow = CFAbsoluteTimeGetCurrent(); tThrowForSlider = CFAbsoluteTimeGetCurrent()
                    playbackTimer(localT: 1.0)
                }
                
                quickSwipes = quickSwipes + 1;
                if hourGlassOn {print("")}      //;  print("qSwipe \(quickSwipes)  ", terminator: "");  pryntPlayback(pageKey: 0)
                frameMinus(cutoff: 0)
            }
        }
        else {latchKey(); print("I won't rest til those boys are back in clown college!")}
    }
}

