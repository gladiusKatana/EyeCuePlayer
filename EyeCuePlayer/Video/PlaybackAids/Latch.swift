// eyeCuePlayer ･ Latch.swift
import UIKit; import AVKit

extension VideoVC {
    
    func latchKey() {                       //print("latched")
        if !justInterrupted {
            playSound(trackTitle: "Funk")
        }
        else {latch = false}
    }
    
}

