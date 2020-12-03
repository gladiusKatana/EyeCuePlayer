// eyeCuePlayer ･ MessageView.swift
import UIKit

class MessageView: UIView {
    
    lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.text = " Upload Video"
        label.textAlignment = .center
        label.backgroundColor = .clear
        label.textColor = .lightGray
        label.numberOfLines = 1
        label.isUserInteractionEnabled = false
        return label
    }()
    
    override init(frame: CGRect) {  //print("   (override init  message)")
        super.init(frame: frame)
        self.isUserInteractionEnabled = true
        backgroundColor = UIColor.rgb(0, green: 0, blue: 0, alpha: 0.3)
        /**/
        
        AppUtility.lockOrientation(.landscape, andRotateTo: .landscapeRight)
        formatMessageLabel()
    }
    
    func formatMessageLabel() {
        //addSubview(settingsLabel)
        addSubview(messageLabel)
        addConstraintsWithFormat("H:|-[v0]-|", views: messageLabel)
        
        if viewFrameHeight == 667 {
            addConstraintsWithFormat("V:|-0-[v0]", views: messageLabel)
            messageLabel.font = UIFont.systemFont(ofSize: 18)
        }
        else if viewFrameHeight == 768 {
            addConstraintsWithFormat("V:|-100-[v0]", views: messageLabel)
            messageLabel.font = UIFont.systemFont(ofSize: 32)
        }
    }
    required init?(coder aDecoder: NSCoder) {fatalError("init(coder:) has not been implemented")}
}

/*
 messageLabel.text = ""
 messageLabel.textAlignment = .center
 messageLabel.backgroundColor = .clear
 messageLabel.textColor = .red
 messageLabel.numberOfLines = 1
 messageLabel.isUserInteractionEnabled = false
 */

//    lazy var options: AnimationOptions = {
//        let options = AnimationOptions()
////        options.beginFrom
//        return options
//    }()
