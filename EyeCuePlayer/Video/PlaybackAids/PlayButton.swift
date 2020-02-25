// eyeCuePlayer ･ PlayButton.swift
import UIKit

extension VideoVC {
    
    func playButtonAppear() {   //print("playButtonAppear")
        if viewFrameHeight == 667 {
            newPlayButton = UIButton(frame: CGRect(x: 667 / 2 - 40, y: 375 - 53, width: 80, height: 80))
        }
        else if viewFrameHeight == 768 {
            newPlayButton = UIButton(frame: CGRect(x: 1024 / 2 - 40, y: 768 - 150, width: 80, height: 80))
        } else {print ("pbs4")}
        
        setPlayButtonFrame()
        newPlayButton.tintColor = .darkGray //UIColor.rgb(60, green: 80, blue: 150, alpha: 1.0) //.rgb(150, green: 180, blue: 220, alpha: 0.9)
    }
    
    func animatePlayButton(_ deelay: Double, deration: Double) {                                        //print ("here's the play button")
        if ecks > 0 || localSpeed > 0 {
            
            setPlayButtonFrame()
            newPlayButton.tintColor = UIColor.clear  //.rgb(150, green: 180, blue: 220, alpha: 0.9)
            
            /*if viewFrameHeight == 667 {
             newPlayButton = UIButton(frame: CGRect(x: 667 / 2 - 15, y: 375 - 20, width: 20, height: 20))
             }
             
             else if viewFrameHeight == 768 {
             newPlayButton = UIButton(frame: CGRect(x: 1024 / 2 - 20, y: 768 - 130, width: 40, height: 40))
             } else {print ("pbs1")}*/
            
            newPlayButton.frame = CGRect(x: globalWindow.frame.height / 2 - 15, y: globalWindow.frame.width - 20, width: 20, height: 20)
            
            let timeDelay = DispatchTime.now() + deelay
            DispatchQueue.main.asyncAfter(deadline: timeDelay) {
                
                VideoPlayerView.transition(with: messageView, duration: deration, options: .transitionCrossDissolve, animations: {
                    newPlayButton.tintColor = .lightGray //2UIColor.rgb(60, green: 80, blue: 150, alpha: 1.0)  //.darkGray
                    
                    /*if viewFrameHeight == 667 {
                     newPlayButton.frame = CGRect(x: 667 / 2 - 40, y: 375 - 55, width: 80, height: 80)
                     }
                     
                     else if viewFrameHeight == 768 {
                     newPlayButton.frame = CGRect(x: 1024 / 2 - 40, y: 768 - 150, width: 80, height: 80)
                     } else {print ("pbs2")}*/
                    
                    newPlayButton.frame = CGRect(x: globalWindow.frame.height / 2 - 40, y: globalWindow.frame.width - 55, width: 80, height: 80)
                    
                }, completion: nil)
            }
        } else {print("x or local speed error")}
    }
    
    func dismissPlayButton(_ deelay: Double, deration: Double) { //print ("here's the play button")
        let timeDelay = DispatchTime.now() + deelay
        DispatchQueue.main.asyncAfter(deadline: timeDelay) {
            
            VideoPlayerView.transition(with: messageView, duration: deration * 2/3, options: .transitionCrossDissolve, animations: {
                newPlayButton.tintColor = UIColor.clear //(60, green: 80, blue: 150, alpha: 1.0)  //.darkGray
                
                
                /*if viewFrameHeight == 667 {
                 newPlayButton.frame = CGRect(x: 667 / 2 - 15, y: 375 - 20, width: 20, height: 20)
                 }
                 
                 else if viewFrameHeight == 768 {
                 newPlayButton.frame = CGRect(x: 1024 / 2 - 20, y: 768 - 130, width: 40, height: 40)
                 } else {print ("pbs3")}*/
                
                newPlayButton.frame = CGRect(x: globalWindow.frame.height / 2 - 15, y: globalWindow.frame.width - 20, width: 20, height: 20)
                
                
            }, completion: nil)
            //newPlayButton.removeFromSuperview()
        }
    }
    
    func setPlayButtonFrame() {
        newPlayButton.setImage(playButtonImage, for: UIControl.State())
        newPlayButton.isUserInteractionEnabled = false
        backgroundView.addSubview(newPlayButton);  //print("added play button")
        playButtonOn = true
    }
}

