// eyeCuePlayer ･ Pinch.swift
import UIKit

extension VideoVC {
    
    @objc func handlePinch() {
        if !justPinched {
            justPinched = true
            
            if dismissPinch.velocity < 0 {
                pinchedInward()
            }
            else {
                pinchedOutward()
            }
        } //else {print("just pinched\n")}
    }
    
    func pinchedInward() {                      //print("\n\npinch in   vidC")      //only inward pinches seem to get called continuously
        if !pinchedIn {
            settingsPanel.showSettingsView()
            //pinchedIn = true
        }
    }
    
    func pinchedOutward() {                     //print("pinch out   vidC")
        position = 0
        playor.pause();  removeStuff()
        
        ///if musicOn {pauseTrack(trackTitle: "interloper")}   /// removed file as it was 108MB, GitHub size limit for individual files is 100MB, recommended size 50MB
        
        justPinched = true
        tempSavedBool = false
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now()) {
            AppUtility.lockOrientation(.portrait, andRotateTo: .portrait)
        }
    }
}

