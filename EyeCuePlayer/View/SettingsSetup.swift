// eyeCuePlayer ･ SettingsSetup.swift
import UIKit

extension SettingsView {
    
    func settingsViewSetup() {
        backgroundColor = .orange   //UIColor.rgb(0, green: 0, blue: 0, alpha: 0.3)
        //print("viewFrameHeight = \(viewFrameHeight)")
        justPinched = false

        if viewFrameHeight == 667 {
            settingsButton = UIButton(frame: CGRect(x: 615, y: 2, width: 40, height: 40))
        }
        else if viewFrameHeight == 768 {
            settingsButton = UIButton(frame: CGRect(x: 972, y: 8, width: 40, height: 40))
        } else {print ("settingsButton size error")}
        
        let image = UIImage(named: "settingsButton")?.withRenderingMode(.alwaysTemplate)
        settingsButton.setImage(image, for: UIControl.State())
        addSubview(settingsButton)
        //settingsButton.addTarget(self, action: #selector(handleSettingsDismiss), for: UIControlEvents.touchUpInside)
        
        addSubview(musicSwitch)
        addSubview(slideshowModeSwitch)
        addSubview(autoDescriptionsSwitch)
        
        addConstraintsWithFormat("V:|-61-[v0]-49-[v1]-49-[v2]", views: musicSwitch, slideshowModeSwitch, autoDescriptionsSwitch)
        addConstraintsWithFormat("H:|-40-[v0(55)]", views: musicSwitch)
        
        addConstraint(NSLayoutConstraint(item: slideshowModeSwitch, attribute: .left, relatedBy: .equal, toItem: musicSwitch, attribute: .left, multiplier: 1, constant: 0))
        addConstraint(NSLayoutConstraint(item: autoDescriptionsSwitch, attribute: .left, relatedBy: .equal, toItem: musicSwitch, attribute: .left, multiplier: 1, constant: 0))
        
        addSubview(settingsLabel)
        addSubview(musicLabel)
        addSubview(slideshowModeLabel)
        addSubview(autoDescriptionsLabel)
        
        addConstraintsWithFormat("V:|-(-35)-[v0]-90-[v1]-65-[v2]-65-[v3]",                                                                         views: settingsLabel, musicLabel, slideshowModeLabel, autoDescriptionsLabel)
        addConstraintsWithFormat("H:|-110-[v0(150)]-(-150)-[v1(150)]-(-150)-[v2(150)]-(-150)-[v3(150)]",                                                 views: settingsLabel, musicLabel, slideshowModeLabel, autoDescriptionsLabel)
        
        musicSwitch.isOn = musicSwitchState
        slideshowModeSwitch.isOn = slideshowModeSwitchState
        autoDescriptionsSwitch.isOn = autoDescriptionsSwitchState
    }
}

