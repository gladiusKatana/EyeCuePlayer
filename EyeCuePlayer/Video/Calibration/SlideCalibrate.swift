// eyeCuePlayer ･ SlideCalibrate.swift
import UIKit;   import AVKit

extension SliderView {
    
    @objc func slideCalibrate(_ sender: UISlider) {             //slyd InCurrentTimeInterval = true          //for manual calibration
        if !justSlid {justSlid = true}
        
        position = Double(sender.value) * levelLength /* * 0.1 */  //print(position)
        if position == 0.0 {justSlid = false}
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            playor.seek(to: CMTime(seconds: position, preferredTimescale: 600), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)}
        
        if !justPressedSliderButton {       //for manual calibration
            
            delT = times[x+1] - position
            
            for t in times {
                if ((position) ..< (position + 0.4)).contains(t) {
                    
                    x = times.firstIndex(of: t)! ;                          //; print("x = \(x)")
                    
                    DispatchQueue.main.asyncAfter(deadline: .now()) {
                        playor.seek(to: CMTime(seconds: times[x], preferredTimescale: 600), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
                    }
                    
                    //print("approximate  \(position); \(t)  actual;  index #\(index)  delta: \(diff)  timeAcc: \(timeAccumulated)  delT: \(delT)")
                }
            }
            
            /*if times[x] <= position {
             x = x + 1                     // why
             }*/
            
            x = x - 1
            delT = times[x] - position
        }
    }
}

