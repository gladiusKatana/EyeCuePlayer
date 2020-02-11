// eyeCuePlayer ･ Latch.swift
import UIKit; import AVKit

extension VideoVC {
    
    func latchKey() {                                                           //print("latched")
        if !justInterrupted {   //*watch that  justInterrupted  = false
            playSound(trackTitle: "Funk")
        }
        else {latch = false}
    }
    
}

