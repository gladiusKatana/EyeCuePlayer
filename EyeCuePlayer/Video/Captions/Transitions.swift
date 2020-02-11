// eyeCuePlayer ･ Transitions.swift
import UIKit

extension MessageVC {
    
    func messageTransitionOn(vu: MessageView, durationSetting: Double) {
        let xOffset = 20
        vu.messageLabel.textColor = .clear
        ///let options = vu.options
        
        MessageView.transition(with: messageView, duration: durationSetting, options: .curveEaseIn, animations: {
            vu.messageLabel.textColor = UIColor.rgb(152, green: 83, blue: 13, alpha: 1)
            
            if justLongPressed {
                if slideshowModeOn {
                    vu.messageLabel.textColor = .lightGray
                    vu.messageLabel.text = "Slideshow"
                    videoVC.objectAppearAsButton(slideIndicatorImage!, xCoord: 667/2 - xOffset, yCoord: 20, tint: .lightGray, deelay: 0, deration: 0.5)
                } else {
                    vu.messageLabel.textColor = .lightGray
                    vu.messageLabel.text = "Video"
                    videoVC.objectAppearAsButton(playIndicatorImage!, xCoord: 667/2 - xOffset, yCoord: 20, tint: darkerIceBlue, deelay: 0, deration: 0.5)
                }
                videoVC.dismissIndicatorObject(667/2 - xOffset, yCoord: 20, deelay: 1.5, dismissDuration: 1.0)
                
                let timeDelayForLongPressAgain = DispatchTime.now() + 1.5
                DispatchQueue.main.asyncAfter(deadline: timeDelayForLongPressAgain) {
                    justLongPressed = false
                    self.messageTransitionOff(durationSetting: 1.0)
                    
                    let timeDelay = DispatchTime.now() + 1.0
                    DispatchQueue.main.asyncAfter(deadline: timeDelay) {
                        self.handleMessageDismiss()
                    }
                }
            }
        }, completion: nil)
    }
    
    func messageTransitionOff(durationSetting: Double) {   //print("message transitions off")               //* something (was) not working here
        MessageView.transition(with: messageView, duration: durationSetting, options: .transitionCrossDissolve, animations: {
            messageView.messageLabel.textColor = .clear //need self. if messageView not global
            ///messageView.backgroundColor = .clear     //works ??
        }, completion: nil)
        
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + durationSetting * 1.1 ) {
            self.handleMessageDismiss()
        }
    }
    
    
}

