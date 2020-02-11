// eyeCuePlayer ･ ProgBar.swift
import UIKit; import AVKit  // Prog bar means progress bar (non userInteractive view, as opposed to the slider view)

extension VideoVC {
    
    func updateProgressBar() {

        if x < timeCount {
            videoPlayerView.progressBar.progress = Float (times[x]) / Float(levelLength)
            
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {           ///print("progress set after slider")
                
                
                //                if justSetSliderBackOnce {loopT = 0.95 * sliderScaleFactor / levelLength;  print("OKOKOK")}
                //                else {loopT = 0}
                
                
                if justSwiped {x = x - 1}
                
                if !justSetSliderBackOnce {
                    self.videoPlayerView.frameSlider.setValue(Float((times[x]) * sliderScaleFactor / levelLength), animated: true)
                    //print("error related to setting the slider back ONCE")
                }
                
                
                //                else {
                //                self.videoPlayerView.frameSlider.setValue(Float((times[x] - maxedOutPosition) * sliderScaleFactor / levelLength), animated: true)
                ////                    self.videoPlayerView.frameSlider.setValue(Float(0.5), animated: true)
                //                }
                
            }
            
            //            }
            //            else {                                                                  print("progress set   NO  slider")
            //                DispatchQueue.main.asyncAfter(deadline: .now() + 0.001) {
            //                    self.videoPlayerView.frameSlider.setValue(Float(times[x] * sliderScaleFactor / levelLength), animated: true)
            //                }
            //            }
        }
        
        timeAccumulated = 0
        slydInCurrentTimeInterval = false
    }
}

