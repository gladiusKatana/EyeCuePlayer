// eyeCuePlayer ･ AltSettingsPanel.swift
import UIKit

class AltSettingsPanel: NSObject, UIGestureRecognizerDelegate {
    
    var homeVC = HomeVC()
    var settingsPinch = UIPinchGestureRecognizer()//*
    
    lazy var settingsView: SettingsView = {
        let settingsView = SettingsView()
        return settingsView
    }()
    
    func showSettingsView() {                       //print("----------------- Settings B")
        justPinched = false
        
        settingsView = SettingsView(frame: globalWindow.frame)  ///use the lazy var above instead... or else calls its override init 2x
        settingsView.backgroundColor = UIColor.rgb(75, green: 90, blue: 110, alpha: 0.9)
        
        settingsView.settingsButton.tintColor = .white
        settingsView.settingsButton.addTarget(self, action: #selector(dismissSettingsView), for: UIControl.Event.touchUpInside)
        
        settingsPinch = UIPinchGestureRecognizer(target: self, action: #selector(settingsDismissPinch))
        settingsView.addGestureRecognizer(settingsPinch)
        globalWindow.addSubview(settingsView)
    }
    
    @objc func settingsDismissPinch() {             // Pinch
        if settingsPinch.velocity > 0 {
            dismissSettingsView()
            justPinched = false
        }
    }
    
    @objc func dismissSettingsView() {
        settingsView.removeFromSuperview()
    }
}

