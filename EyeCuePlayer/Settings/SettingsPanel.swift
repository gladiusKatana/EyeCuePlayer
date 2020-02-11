// eyeCuePlayer ･ SettingsPanel.swift
import UIKit

class SettingsPanel: NSObject, UIGestureRecognizerDelegate {
    
    var homeVC = HomeVC()
    var backgroundView = UIView()   //duplicate- also defined globally; remove redundancy
    
    lazy var settingsView: SettingsView = {
        let settingsView = SettingsView()
        return settingsView
    }()
    
    func showSettingsView() {       //justPinched = false
        backgroundView.backgroundColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.3)
        
        settingsPinch = UIPinchGestureRecognizer(target: self, action: #selector(settingsDismissPinch))
        backgroundView.addGestureRecognizer(settingsPinch)
        
        globalWindow.addSubview(backgroundView)
        backgroundView.frame = globalWindow.frame
        settingsView = SettingsView(frame: globalWindow.frame)  //use the lazyvar above instead... or else calls its override init 2x
        
        settingsView.backgroundColor = .clear    //UIColor.rgb(0, green: 90, blue: 110, alpha: 0.5)  //(0/0/0/0.7); (249/158/0/0.3)
        settingsView.settingsButton.tintColor = .white
        
        settingsView.settingsButton.addTarget(self, action: #selector(dismissSettingsView), for: UIControl.Event.touchUpInside)
        backgroundView.addSubview(settingsView)
    }
    
    @objc func settingsDismissPinch() {                                                                           // Pinch
        if settingsPinch.velocity > 0 {                 //print("pinch out settC")           //called twice, why?
            if !justPinchedFromSettings {
                justPinchedFromSettings = true
            }
            
            dismissSettingsView()
        } else {print("pinched in settC")}
        //else{print("(settings controller)\njust pinched!")}
    }
    
    @objc func dismissSettingsView() {
        //numberOfSimulatedOutPinches = numberOfSimulatedOutPinches + 1
        //settingsBackgroundView.removeGestureRecognizer(settingsPinch)
        
        backgroundView.removeFromSuperview()
        settingsView.removeFromSuperview()
        /**/
        justPinched = false;            pinchedIn = false
        justPinchedFromMessage = false; justPinchedFromSettings = false
    } /**/
}

/*
 //                if numberOfSimulatedOutPinches < 20 {
 //                    dismissSettingsViewRepeat(delay: 0.0, closure: { [weak self] () -> () in
 //
 //                        if let strongSelf = self {
 //                            strongSelf.dismissSettingsView()
 //                        }
 //                    })
 //                }
 */

/*
 //        func dismissSettingsViewRepeat(delay:Double, closure:()->()) {
 //            DispatchQueue.main.asyncAfter(deadline: .now() + 0.01) {
 //                self.dismissSettingsView()
 //            }
 //        }
 */

