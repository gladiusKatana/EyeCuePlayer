// eyeCuePlayer ･ Timer.swift
import UIKit

extension VideoVC {
    
    func playbackTimer(localT: Double) {  //--------------------------------------- 🕛 T I M E R
        
        if (!donePlaying && !paused) || mode == "reverse" || justInterrupted {      //* get rid of  localT
            if (!interrupted || justInterrupted) && !justFSeeked {
                
                tCatch = CFAbsoluteTimeGetCurrent()
                delayInter = tCatch - tThrow
                
                if !downPaused {timeAccumulated = timeAccumulated + delayInter * localSpeed}
                tThrow = CFAbsoluteTimeGetCurrent()
                if hourGlassOn {hourglass()}
                //selectCorrectionFactor()
                
                if slydInCurrentTimeInterval {
                    
                    /*if justSetSliderBackOnce {
                     var positionPlusT = 0.0
                     videoPlayerView.frameSlider.setValue(Float((positionPlusT + timeAccumulated) * sliderScaleFactor / levelLength), animated: true)
                     } else {*/
                    
                    videoPlayerView.frameSlider.setValue(Float((position + timeAccumulated) * sliderScaleFactor / levelLength), animated: true)
                    
                    /*position = (position + timeAccumulated) * sliderScaleFactor / levelLength}*/
                } else {
                    ///if !justSetSliderBackOnce {
                    if (!paused || mode == "reverse") {
                        
                        if mode == "forward" || mode == "forFast" {
                            videoPlayerView.frameSlider.setValue(Float((times[ecks] + timeAccumulated) * sliderScaleFactor / levelLength), animated: true)
                            videoPlayerView.progressBar.setProgress(Float((times[ecks] + timeAccumulated)/levelLength), animated: true)
                            position = (times[ecks] + timeAccumulated)/levelLength
                        }
                        
                        else if mode == "reverse" {
                            videoPlayerView.frameSlider.setValue(Float((times[ecks + 2] + timeAccumulated) * sliderScaleFactor / levelLength), animated: true)
                        }
                        
                        else if mode == "fastRev" {
                            videoPlayerView.frameSlider.setValue(Float((times[ecks + 1] + timeAccumulated) * sliderScaleFactor / levelLength), animated: true)
                        }
                    }///}
                }
                
                if timeAccumulated < boundary && localSpeed < 0 && (!paused) {                                      //print("zeroPaused")
                    //if !slideshowModeOn && (1 ..< (timeCount - 4)).contains(x) && started {animatePlayButton(0, deration: 0.2)}
                    paws()
                    
                    if seekOn {seek(framesAhead: 0)}
                    else {
                        if autoDescriptionsOn /*&& descriptions[x] != 0*/ {
                            handleUpSwipe()
                        }
                    }
                }
                
                else if (boundary ..< abs(delT - corFac)).contains(abs(timeAccumulated)) {
                    playbackRepeatStopwatch(delay: 0.0, closure: { [weak self] () -> () in
                        
                        if let strongSelf = self {
                            strongSelf.playbackTimer(localT: 1.0)
                        }
                    })
                    ///earlyPlayButtonAnimate()
                } 
                
                else if abs(timeAccumulated) >= abs(delT - corFac) {                                                //print("delTPaused")
                    //if !slideshowModeOn && x < (timeCount - 4) && started {animatePlayButton(0, deration: 0.2)}
                    paws()
                    
                    if seekOn {seek(framesAhead: 0)}
                    else {
                        if autoDescriptionsOn /*&& descriptions[x] != 0*/ {
                            handleUpSwipe()
                        }
                    }
                } else {print("! [timer range error] ! ----------------------------------------------------")}
            } //else { print("\n* interrupted = \(interrupted) & justFSeeked = \(justFSeeked)")}
        } ///else { print("\n* donePlaying = \(donePlaying) & paused = \(paused) & mode = \(mode) -------------------------------------")}
    }
    
    func playbackRepeatStopwatch(delay:Double, closure:()->()) {                                              // D i s p a t c h
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) { //0.001 previous  //0.00001 lowest
            self.playbackTimer(localT: 1.0)
        }
    }
}

