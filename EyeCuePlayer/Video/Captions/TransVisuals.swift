// eyeCuePlayer ･ TransVisuals.swift
import UIKit    //TransitionVisuals

extension VideoVC {
    
    func objectAppearAsButton(_ objectImage: UIImage, xCoord: Int, yCoord: Int, tint: UIColor, deelay: Double, deration: Double) {
        
        vidOrSlideButton = UIButton(frame: CGRect(x: xCoord, y: yCoord, width: widheight, height: widheight))
        
        vidOrSlideButton.setImage(objectImage, for: UIControl.State())
        vidOrSlideButton.isUserInteractionEnabled = false
        vidOrSlideButton.tintColor = .clear
        
        backgroundView.addSubview(vidOrSlideButton)  //print("added play button")
        
        let timeDelay = DispatchTime.now() + deelay
        DispatchQueue.main.asyncAfter(deadline: timeDelay) {
            
            VideoPlayerView.transition(with: messageView, duration: deration, options: .transitionCrossDissolve, animations: {
                
                vidOrSlideButton.tintColor = tint
                vidOrSlideButton.frame = CGRect(x: xCoord, y: yCoord, width: widheight, height: widheight)
            }, completion: nil)
        }
    }
    
    func dismissIndicatorObject(_ xCoord: Int, yCoord: Int, deelay: Double, dismissDuration: Double) {
        
        let timeDelay = DispatchTime.now() + deelay
        
        DispatchQueue.main.asyncAfter(deadline: timeDelay) {
            
            VideoPlayerView.transition(with: messageView, duration: dismissDuration, options: .transitionCrossDissolve, animations: {
                vidOrSlideButton.tintColor = UIColor.clear
                vidOrSlideButton.frame = CGRect(x: xCoord, y: yCoord, width: widheight, height: widheight)
            }, completion: nil)
        }
    }
    
}

