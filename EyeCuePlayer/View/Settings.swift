// eyeCuePlayer ･ Settings.swift
import UIKit

extension SettingsView {
    
    @objc func switchFlipped(mySwitch: SaveableSwitch, switchBool: Bool) {
        
        if mySwitch.isOn {
            tempBool = true                 //;  print("switch is ON")
        } else {
            tempBool = false                //;  print("switch is OFF")
        }
        
        switch mySwitch.switchStateVarName {
            
        case "musicSwitchState":                                //print("musicSwitch")
            musicSwitchState = tempBool
            musicOn = musicSwitchState
            
        case "slideshowModeSwitchState":                        //print("slideshowModeSwitch")
            slideshowModeSwitchState = tempBool
            slideshowModeOn = slideshowModeSwitchState
            
            if slideshowModeSwitchState == true {
                newPlayButton.removeFromSuperview()
            }
            else {
                if started {
                    videoVC.playButtonAppear() ///*** try(ied) to get play button to animate (lots of cruft deleted. <LOL.>)
                }
            }
            
        case "autoDescriptionsSwitchState":                     //print("musicSwitch")
            autoDescriptionsSwitchState = tempBool
            autoDescriptionsOn = autoDescriptionsSwitchState
            
        default: print("switchStateVarName issue")
            
        }
    }
}

