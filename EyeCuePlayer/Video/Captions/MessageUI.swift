// eyeCuePlayer ･ MessageUI.swift
import UIKit

extension MessageVC {

    @objc func handlePinchForDescription() {                                //print("handlePinchForMessage")
        //handleDownSwipeForDescription()
        //videoVC.handlePinch()
        
        if dismissPinch.velocity < 0 {
            videoVC.pinchedInward()
        } else {videoVC.pinchedOutward()}
    }
    
    @objc func handleTapForDescription() {
        handleMessageDismiss()
        videoVC.handleTap()
    }
    
    @objc func handleRightSwipeForDescription() {
        handleMessageDismiss()
        videoVC.handleRightSwipe()
    }
    
    @objc func handleLeftSwipeForDescription() {
        handleMessageDismiss()
        videoVC.handleLeftSwipe()
    }
    
    @objc func handleDownSwipeForDescription() {
        //backgroundViewBrighten()
        messageTransitionOff(durationSetting: 0.7)
        videoVC.handleDownSwipe()
    }
    
    func handleMessageDismiss() {  ///print("handle MessageDismiss")
        latch = false
        messageView.removeFromSuperview()
        actualDescription = false
    }
    
    /*func backgroundViewDarken() {
        MessageView.animate(withDuration: 2.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            messageView.backgroundColor = .red //UIColor.rgb(0, green: 0, blue: 0, alpha: 0.3)
        }, completion: nil)
    }
    func backgroundViewBrighten() {
        MessageView.animate(withDuration: 3.0, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            messageView.backgroundColor = UIColor.clear
        }, completion: nil)
    }*/
}

