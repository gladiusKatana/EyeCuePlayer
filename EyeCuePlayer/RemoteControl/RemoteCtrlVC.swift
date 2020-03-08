// eyeCuePlayer ･ RemoteCtrlVC.swift
import UIKit

class RemoteControlVC: UIViewController, RemoteServiceDelegate {
    
    let remoteService = RemoteService()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        remoteService.delegate = self
    }
    
    func connectedDevicesChanged(manager: RemoteService, connectedDevices: [String]) {
        OperationQueue.main.addOperation {}
    }
    
    
    func receivedRemoteCommand(manager: RemoteService, remoteControlString: String) {
        
        OperationQueue.main.addOperation {
            
            isController = false
            
            switch remoteControlString {
                
            case "tap":         videoVC.handleTap()
            case "rswipe":      videoVC.handleRightSwipe()
            case "lswipe":      videoVC.handleLeftSwipe()
            case "pinch":       videoVC.handlePinch()
            case "longPress":   videoVC.handleLongPress()
                
            default:
                NSLog("%@", "Unknown remote control string received: \(remoteControlString)")
            }
        }
    }
    
}

