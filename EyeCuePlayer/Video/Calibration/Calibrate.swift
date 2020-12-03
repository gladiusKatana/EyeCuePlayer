// eyeCuePlayer ･ SlideCalibrate.swift
import UIKit

extension SliderController {
    
    @objc func calibrationTap() {
        times.append(position)
        print("pause times: \(times)")
        
        if times.count > 1 {
            if abs(times[times.count - 1] - times[times.count - 2]) < 0.1 {
                times.remove(at: times.count - 2);
                print("pause times: \(times)")
            }
        }
        calibTaps = calibTaps + 1
    }
    
    @objc func calibrationPinch() {
        if !justPinched {                           //print(times)   //print("\(calibTaps) taps")
            
            justCalibrated = true
            
            if times.count < 2 {
                print("...sorry, you need to set at least  2  pause times")
                times = [0.0, 0.0, 0.0]
                print("pause times: \(times)")
                
            } else {times.append(0.0);  print("pause times array is now: \(times)")}
            
            justPinched = true;  justPressedSliderButton = false
            position = 0
            
            sliderView.calibrationSlider.removeFromSuperview()
            sliderView.removeFromSuperview()
            backgroundView.removeFromSuperview()
            videoVC.videoPlayerView.removeFromSuperview()
        }
        
        else{print("just pinched!\n")}
    }
}

