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
            
            switch remoteControlString {
                
            case "tap":
                isController = false
                videoVC.handleTap()
                
            default:
                NSLog("%@", "Unknown remote control string received: \(remoteControlString)")
            }
        }
    }
    
}

