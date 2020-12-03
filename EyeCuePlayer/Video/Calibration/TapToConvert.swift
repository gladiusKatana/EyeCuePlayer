// eyeCuePlayer ･ TapToConvert.swift
import UIKit

extension VideoVC {
    
    @objc func tapToConvertFile() {                                         //print("scanning started")
        if !started {   ///keep this  if  ... or else, enjoy some slips in timing mechanism
            
            print("\ninitial tap to play/convert")
            
            playForward()
            times = [0.0]
        }
        
        snapshotView(view: videoPlayerView)                                 //; print("whitePixelCount = \(whitePixelCount)")
        
        if !paused {
            snapshotRepeat(delay: 0.0, closure: { [weak self] () -> () in
                
                if let strongSelf = self {
                    strongSelf.tapToConvertFile()
                }
            })
        }
    }
    
    func snapshotRepeat(delay:Double, closure:()->()) {                     //* 0.00001 lowest (from Timer)
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {            //0.02/0.4  2 slips
            self.tapToConvertFile()                                         //0.02/0.5  20 entries
        }                                                                   //0.01/0.5  3 slips; 21 entries (1 miss)
    }                                                                       //0.01/0.5 bad
    //---------------------------------                                     //0.02/0.4 small slippages
    //0.01/0.4 seems to be the winning ticket (0.5, and it slips a bit)
    
}

