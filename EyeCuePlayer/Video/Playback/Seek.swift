// eyeCuePlayer ･ Seek.swift
import UIKit;  import AVKit

extension VideoVC {
    
    func seek(framesAhead: Int) {                                           //print("seeked")
        
        if ecks < timeCount {
            
            //if slydInCurrentTimeInterval {
            //let pauseTee = times[x + framesAhead] //- corFac//- 0.1
            //seekToCurrentPauseTime(pauseTime: pauseTee);
            //}
            //else {
            
            let pauseTee = times[ecks + framesAhead]
            seekToCurrentPauseTime(pauseTime: pauseTee)
            
            //}
            
            if autoDescriptionsOn {
                handleUpSwipe()
            }
        }
    }
    
    func seekToCurrentPauseTime(pauseTime: Double) {
        avPlayer.seek(to: CMTime(seconds: pauseTime, preferredTimescale: 600), toleranceBefore: CMTime.zero, toleranceAfter: CMTime.zero)
    }
}

