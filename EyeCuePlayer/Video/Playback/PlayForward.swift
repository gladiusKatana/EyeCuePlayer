// eyeCuePlayer ･ PlayForward.swift
import UIKit;  import AVKit

extension VideoVC {
    func playForward(){                                                 //print("<< playing forward")
        //newPlayButton.removeFromSuperview()
        dismissPlayButton(0, deration: 0.5)
        
        if !started {   started = true
            ///if musicOn {playTrack(trackTitle: "interloper")} /// removed file as it was 108MB, GitHub size limit for individual files is 100MB, recommended size 50MB
        }
        
        if justFSeeked {justFSeeked = false}
        if !gonnaSpeed && !downPaused {tThrow = CFAbsoluteTimeGetCurrent(); tThrowForSlider = CFAbsoluteTimeGetCurrent()}
        
        if !latch && !donePlaying {
            
            if !gonnaSpeed {  mode = "forward";     selectCorrectionFactor()
                gonnaSpeed = true
                
                avPlayer.pause()
                //if !justInterrupted {clearAnyDescriptions()}
                //if !justInterrupted {descriptionLauncher.handleDismiss()} else {print("fack")}
                
                avPlayer.play();  paused = false
                localSpeed = 1.0;               if calibrateMode {localSpeed = 0.4}
                avPlayer.rate = Float(localSpeed)                                              //  F o r w a r d
                
                if !justSlid {delT = timeD[ecks]}
                taps = taps + 1
                
                if !justSwiped && !justFSwiped {                        //print("\n\nTap \(taps)     ", terminator: "")
                    pryntPlayback(pageKey: 0)}
                
                if !downPaused {
                    playbackTimer(localT: 1.0)
                }   //; print("called playbackTimer forward")
                
                if justFSwiped {                                        //print("\n\nfSwipe \(fSwipes)  ", terminator: "")
                    pryntPlayback(pageKey: 0)}
            }
                
            else {  mode = "forFast";   selectCorrectionFactor()
                gonnaSpeed = false
                latch = true
                avPlayer.play()
                localSpeed = 2.0;   avPlayer.rate = Float(localSpeed)                                      // FastForward
                
                if hourGlassOn {print("")}
                
                if justTapped {
                    quickTaps = quickTaps + 1                           //print("\nqTap \(quickTaps)")
                }
                if justFSwiped {
                    qFSwipes = qFSwipes + 1                             //print("\nqFSp \(qFSwipes)")
                }
                pryntPlayback(pageKey: 0)
            }
        } else {latchKey()}
    }
}

