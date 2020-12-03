// eyeCuePlayer ･ Pinch.swift
import UIKit

extension VideoVC {
    
    @objc func handlePinch() {
        
        //if isController {remoteControlVC.remoteService.send(controlName: "pinch")}
        
        if !justPinched {
            if dismissPinch.velocity < 0 {
                pinchedInward()
            } else {pinchedOutward()}
            justPinched = true
            
        } //else {print("just pinched\n")}
    }
    
    func pinchedInward() {
        
        if !pinchedIn {                 print("\n\npinch in   vidC")      //only inward pinches seem to get called continuously
            if isController {remoteControlVC.remoteService.send(controlName: "pinchIn")}
            settingsPanel.showSettingsView()
            pinchedIn = true
        }
    }
    
    func pinchedOutward() {             //; print("pinch out   vidC")
        
        if !justPinched {
            if isController {remoteControlVC.remoteService.send(controlName: "pinchOut")}
            position = 0
            avPlayer.pause();  removeStuff()
            
            ///if musicOn {pauseTrack(trackTitle: "interloper")} /// removed file as it was 108MB, GitHub size limit for individual files is 100MB, recommended is 50MB
        }
        
        tempSavedBool = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        }
    }
}

