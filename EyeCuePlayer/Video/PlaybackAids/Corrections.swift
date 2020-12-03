// eyeCuePlayer ･ Corrections.swift
import UIKit; import AVKit

extension VideoVC {
    
    func selectCorrectionFactor() {
        
        //if autoDescriptionsOn {correctionFactors = [0.3, 0.3, 0.02, 0]}
        //else {correctionFactors = [0, 0, 0.02, 0]}
        
        correctionFactors = [0.05, 0.08, 0.02, 0]
        //correctionFactors = [0.3, 0.3, 0.02, 0]
        
        if mode == "forward" {                                                                              // Forward
            corFac = correctionFactors[0] //0 * localSpeed //0.0 //0.03 * localSpeed //-0.25 for ClipGrab
        }
        
        else if mode == "forFast" {
            corFac = correctionFactors[1] //0 * localSpeed //0.0 //-0.25 for ClipGrab(?)
        }
        
        else if mode == "reverse" {                                                                         // Reverse
            corFac = correctionFactors[2] //0.02 //0.082 //0.09
        }
        
        else if mode == "fastRev" {
            boundary = 0.0
        }
        
        else {}
    }
    
}

