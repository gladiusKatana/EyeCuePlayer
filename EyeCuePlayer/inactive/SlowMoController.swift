////  SlowMoController.swift
////  EyeCuePlayer
////  Created by Garth Snyder on 2017-07-26.  //  Copyright © 2017 Garth Snyder. All rights reserved.
//
//import UIKit;  import AVKit
//
//var rateString = "rateString = (.) or (,)\n";  var tapIndex = 0
//
//var calibRate = 1.0;            var timerRate = 0.0;        var frac = 0.0  //0 = pause
//var tCThrow = 0.0;              var tCCatch = 0.0;          var deltaTaccumulator = 0.0
//var localT = 0.0;               var calibT = 0.0;           var elapsedC = 0.0
//
//var readyForPause = false;      var slow = false;           var doneCalibrating = false;        var stopButton = false
//
//var firstT = CFAbsoluteTimeGetCurrent();        var secondT = CFAbsoluteTimeGetCurrent();    var thirdT = CFAbsoluteTimeGetCurrent()
//var firstDelta = TimeInterval()
//var secondDelta = TimeInterval();            var calibWatch = Timer()
//
//func setupCalibPlayer(_ currentView: UIView){};     func calibTimer(){};    func setupHiLitePlayer(_ currentView: UIView){}
////------------------------------------------------------------------------------------------------------------------------------------------
//
//class SlowMoController: UIViewController {
//    
//    func showSlowMoVideoPlayer() {
//        
//        viewLoaded = false
//        justPinched = false
//        
//        times = [0.0]
//        deltaTaccumulator = 0
//        
//        if let keyWindow = UIApplication.shared.keyWindow {
//            backgroundView.backgroundColor = .clear
//            
//            pinchMe = UIPinchGestureRecognizer(target: self, action: #selector(handleSlowMoPinch))
//            backgroundView.addGestureRecognizer(pinchMe)
//            tapG = UITapGestureRecognizer(target: self, action: #selector(playPauseThreeTouch))
//            backgroundView.addGestureRecognizer(tapG)
//            
//            //                                                           Add subviews ----------------------------------------
//            keyWindow.addSubview(backgroundView)
//            backgroundView.frame = keyWindow.frame
//            
//            let videoPlayerFrame = backgroundView.frame
//            videoPlayerView = VideoPlayerView(frame: videoPlayerFrame)
//            backgroundView.addSubview(videoPlayerView)
//            
//            print("\n----------------- launching SLOW MO player ------------------------------------------------------------------------------------------------------\n")
//            print("title = \(slowMoTempTitle)\n")
//        }
//    }
//    
//    func playPauseTwoTouch(){
//        
//        if !slow {  //hourGlassOn = true
//            stopButton = false
//            
//            calibT = calibT + deltaTaccumulator
//            
//            calibTimer()
//            timerRate = calibRate;  playor.rate = Float(timerRate);  rateString = "."
//            tCThrow = CFAbsoluteTimeGetCurrent()
//            
//            slow = true
//        }
//            
//        else {  hourGlassOn = false
//            
//            timerRate = calibRate * frac;  playor.rate = Float(timerRate)
//            rateString = ","
//            
//            if timerRate == 0.0 {stopButton = true}
//            
//            slow = false
//            tapIndex = tapIndex + 1;  if !doneCalibrating {print("\n---------- x = \(tapIndex)   time accumulated: \(deltaTaccumulator)")}
//            times.append((calibT)); print("times = \(times)")
//        }
//    }
//    
//    //--------------------------------------- 2  3
//    //--------------------------------------- 2  3
//    func playPauseThreeTouch(){
//        
//        if !readyForPause {
//            calibTimer()
//            
//            if !slow {
//                
//                stopButton = false
//                deltaTaccumulator = 0
//                
//                timerRate = calibRate;  playor.rate = Float(timerRate);  rateString = "."
//                tCThrow = CFAbsoluteTimeGetCurrent()
//                slow = true
//            }
//            else {
//                timerRate = calibRate * 0.05;  playor.rate = Float(timerRate);  rateString = ","
//                readyForPause = true;  slow = false
//            }
//        }
//        else {
//            stopButton = true
//            DispatchQueue.main.asyncAfter(deadline: .now() + .nanoseconds(1)) {playor.pause()}
//            
//            secondDelta = deltaTaccumulator
//            deltaTaccumulator = 0
//            
//            calibT = calibT + (secondDelta)
//            times.append((calibT)); print("times = \(times)")
//            
//            readyForPause = false;  slow = false
//            tapIndex = tapIndex + 1;  if !doneCalibrating {print("\nx = \(tapIndex)")}
//        }
//    }
//    
//    override func didReceiveMemoryWarning() {
//        super.didReceiveMemoryWarning()
//    }
//    
//    /**********************************************************************************************/
//    
//    func calibTimer() {                                                         //      🕛      //
//        
//        if !stopButton {
//            
//            tCCatch = CFAbsoluteTimeGetCurrent()
//            let delayInterval = tCCatch - tCThrow
//            
//            deltaTaccumulator = deltaTaccumulator + delayInterval * timerRate
//            //if hourGlassOn {print(".", terminator:"")}
//            
//            tCThrow = CFAbsoluteTimeGetCurrent()
//            
//            fineCDelay(delay: 0.0, closure: { [weak self] () -> () in
//                
//                if let strongSelf = self {
//                    strongSelf.calibTimer()
//                }
//            })
//        }
//    }
//    func fineCDelay(delay:Double, closure:()->()) {
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.00001) {
//            self.calibTimer()
//        }
//    }
//    
//    func itemDidFinishPlaying(_ notification:Notification) {
//        print("Done")
//        doneCalibrating = true
//        
//        calibT = 0.0; deltaTaccumulator = 0.0
//        performSegue(withIdentifier: "CalibToPreview", sender: self)
//    }
//    
//    func handleSlowMoPinch() {                                                                                                // PINCH
//        if !justPinched {
//            
//            playor.pause()
//            backgroundView.removeGestureRecognizer(pinchMe)
//            backgroundView.removeGestureRecognizer(tapG)
//            
//            videoPlayerView.removeFromSuperview()
//            backgroundView.removeFromSuperview();
//            
//            justPinched = true
//        }
//    }
//}
