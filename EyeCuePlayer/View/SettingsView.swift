// eyeCuePlayer ･ SettingsView.swift
import UIKit

class SaveableSwitch: UISwitch {
    var switchStateVarName = "the name of the bool to send"
}

class SettingsView: UIView { //MARK: ------------- Settings
    var homeVC = HomeVC()
    var settingsButton = UIButton()
    
    //MARK: ----------------------------------------------------------------- Switches
    
    var musicSwitch: SaveableSwitch = {
        let musicSwitch = SaveableSwitch()
        musicSwitch.switchStateVarName = "musicSwitchState"
        musicSwitch.addTarget(self, action: #selector(switchFlipped), for: .valueChanged)
        return musicSwitch
    }()
    
    var slideshowModeSwitch: SaveableSwitch = {
        let slideshowModeSwitch = SaveableSwitch()
        slideshowModeSwitch.switchStateVarName = "slideshowModeSwitchState"
        slideshowModeSwitch.addTarget(self, action: #selector(switchFlipped), for: .valueChanged)
        return slideshowModeSwitch
    }()
    
    var autoDescriptionsSwitch: SaveableSwitch = {
        let autoDescriptionsSwitch = SaveableSwitch()
        autoDescriptionsSwitch.switchStateVarName = "autoDescriptionsSwitchState"
        autoDescriptionsSwitch.addTarget(self, action: #selector(switchFlipped), for: .valueChanged)
        return autoDescriptionsSwitch
    }()

    //MARK: ----------------------------------------------------------------- Labels
    
    let settingsLabel: UILabel = {
        let label = UILabel()
        label.text = "Settings"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear//UIColor.rgb(0, green: 0, blue: 0, alpha: 0.85)
        label.textColor = .white //UIColor.rgb(0, green: 24, blue: 132, alpha: 1.0)//rgb(91, green: 14, blue: 13, alpha: 1.0)
        label.numberOfLines = 1 //was 2
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let musicLabel: UILabel = {
        let label = UILabel()
        label.text = "Music"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = .white
        label.numberOfLines = 1 //was 2
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let slideshowModeLabel: UILabel = {
        let label = UILabel()
        label.text = "Slideshow mode"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = .white
        label.numberOfLines = 1 //was 2
        label.isUserInteractionEnabled = false
        return label
    }()
    
    let autoDescriptionsLabel: UILabel = {
        let label = UILabel()
        label.text = "Automatic descriptions"
        label.font = UIFont.systemFont(ofSize: 12)
        label.backgroundColor = .clear
        label.textColor = .white
        label.numberOfLines = 1 //was 2
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override init(frame: CGRect) {  //print("   (override init  settings)")
        super.init(frame: frame)
        settingsViewSetup()
    }
    
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

