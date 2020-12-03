// eyeCuePlayer ･ SlideSeek.swift
import UIKit; import AVKit

extension VideoPlayerView {
    
    @objc func slideToSeek(_ sender: UISlider) {
        if !justSlid {                              print("\nS l i d i n g ------------------------------------------------")
            justSlid = true
            avPlayer.seek(to: CMTime(seconds: times[ecks], preferredTimescale: 600), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
        slydInCurrentTimeInterval = true
        position = Double(sender.value) * levelLength /*/ sliderScaleFactor*//*SSF*/    //; print(sender.value) //SSF=1
        //if position == 0.0 {justSlid = false}
        
        DispatchQueue.main.asyncAfter(deadline: .now()) {
            avPlayer.seek(to: CMTime(seconds: position, preferredTimescale: 600), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
        }
        progressBar.progress = Float(position) / Float(levelLength)
        
        if !justPressedSliderButton {
            ///if !justSetSliderBackOnce {
            for t in times {
                if ((position) ..< (position + 0.4)).contains(t) {
                    ecks = times.firstIndex(of: t)!                                        //; print("x = \(x)")
                    //DispatchQueue.main.asyncAfter(deadline: .now()) {
                    //playor.seek(to: CMTime(seconds: times[x], preferredTimescale: 600), toleranceBefore: kCMTimeZero, toleranceAfter: kCMTimeZero)}                                                   //printApproximatePosition()
                }
            }
            
            if position >= times[ecks]  {
                if ecks < timeCount - 1 {ecks = ecks + 1}
            }
            delT = times[ecks] - position
            ///}
            //if sender.value > 0.8 * Float(viewFrameHeight) / sliderLength {print("maxxed out slider")}
            //if (0.301 ..< 0.303).contains(sender.value) {
            if sender.value >= 0.45 {
                frameSlider.removeFromSuperview()   ; print("----------------------------------------maxxed out slider")
                ///frameSlider.addTarget(self, action: #selector(dragSliderVpV(_:)), for: .valueChanged)
                
                if !calibrateMode {
                    addSubview(frameSlider)
                    frameSlider.setValue(Float(position / levelLength), animated: false)
                    addConstraintsWithFormat("V:[v0]-4-|", views: frameSlider)
                    addConstraintsWithFormat("H:|-(-450)-[v0(1136)]", views: frameSlider)   //1136
                }
                ///justSetSliderBackOnce = true
            }
        }
    }
}

