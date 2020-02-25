// eyeCuePlayer ･ MessageVC.swift
import UIKit

class MessageVC: UIViewController, UIGestureRecognizerDelegate /*, UINavigationControllerDelegate*/ {
    
    var homeVC = HomeVC()
    var window: UIWindow?
    
    func showMessageView() {            //print("\n------------------- Message")
        justPinchedFromMessage = false  //print("justPinchedFromMessage = \(justPinchedFromMessage)")
        
        dismissPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinchForDescription))
        messageView.addGestureRecognizer(dismissPinch)
        
        let dismissTap = UITapGestureRecognizer(target: self, action: #selector(handleTapForDescription))
        messageView.addGestureRecognizer(dismissTap)
        
        let dismissRightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipeForDescription))
        dismissRightSwipe.direction = .right
        messageView.addGestureRecognizer(dismissRightSwipe)
        
        let dismissLeftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipeForDescription))
        dismissLeftSwipe.direction = .left
        messageView.addGestureRecognizer(dismissLeftSwipe)
        
        let downSwipeForDescription = UISwipeGestureRecognizer(target: self, action: #selector(handleDownSwipeForDescription))
        downSwipeForDescription.direction = .down
        messageView.addGestureRecognizer(downSwipeForDescription)
        
        messageView.backgroundColor = .clear  //UIColor.rgb(0, green: 0, blue: 0, alpha: 0.2)
        messageView.frame = globalWindow.frame
        globalWindow.addSubview(messageView)
        
        messageView.messageLabel.text = descriptions[ecks+1]
        /// bug/crash, if certain cells tapped 1st after opening.)  ie,  Determinant, Long Divisn' (vid's w/out enough [descriptions] )
        
        actualDescription = true
        
        if interrupted {messageView.messageLabel.text = "*interrupted"}
        
        //print("\nmessage on  ", terminator: "")   ///print("justPinched = \(justPinched)")
        //backgroundViewDarken()
        
        messageTransitionOn(vu: messageView, durationSetting: 2)
    }
}

