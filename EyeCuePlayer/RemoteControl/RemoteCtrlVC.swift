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
            case "pinchIn":     videoVC.pinchedInward()
            case "pinchOut":    videoVC.pinchedOutward()
            case "longPress":   videoVC.handleLongPress()
            case "pinchQuitSettings":   settingsPanel.dismissSettingsView()
                
            default:
                NSLog("%@", "Unknown remote control string received: \(remoteControlString)")
            }
        }
    }
    
}

