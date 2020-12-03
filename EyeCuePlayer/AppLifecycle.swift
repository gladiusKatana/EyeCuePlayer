// eyeCuePlayer ･ AppLifecycle.swift
import UIKit

extension AppDelegate {
    func applicationDidBecomeActive(_ application: UIApplication) {     //print("interupted = \(interupted)")
        
        if started { ///print("---------------------------------------------...and on become-active (mode is \(mode))")
            
            //if !actualDescription{
            messageController.handleMessageDismiss()
            //}
            
            gonnaSpeed = false;  latch = false
            interrupted = false
            justInterrupted = true
            
            if localSpeed > 0 {
                taps = taps - 1
                /*if mode == "forward" {
                 timeAccumulated = timeAccumulated + 0.05
                 }else if mode == "forFast" {
                 timeAccumulated = timeAccumulated + 0.087
                 }*/
                videoVC.playForward()
                paused = false
            }
            else if localSpeed < 0 {
                
                swipes = swipes - 1
                if ecks != 0 {videoVC.framePlus()};  //videoController.framePlus()
                if ecks == 2 { ecks = ecks - 1}  //;print("-1  3->2i") }
                justSwiped = false
                //justInterrupted = true
                
                if mode == "reverse" {
                    /*timeAccumulated = timeAccumulated - 0.150*/
                    videoVC.framePlus()
                }
                else if mode == "fastRev" {  //print("\nmode initially = \(mode)")
                    /*timeAccumulated = timeAccumulated - 0.015*/
                    paused = false
                    if ecks <= 2 {videoVC.framePlus()}
                }
                videoVC.playBackwards()  //print("\nmode = \(mode)")
            }
        }
    }
    
    func applicationWillResignActive(_ application: UIApplication) {  ///print("--------------- willResignActive", terminator: "")
        avPlayer.pause()
        ////paused = true
        
        if started {
            interrupted = true
            if !actualDescription {
                
                if !justPinched {
                    if !paused || localSpeed == -1.8 {messageController.showMessageView()}
                } //else {print("\nwrong view (justPinched = \(justPinched))")}
            }
        } //else { print("started: \(started)   actual Description: true")}
        paused = true
        ///print("\n---------------------------------------------------------------called on resign-active... (mode is \(mode))...")
    }
    
    func applicationDidEnterBackground(_ application: UIApplication) {}
    
    func applicationWillEnterForeground(_ application: UIApplication) {}
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.saveContext()
    }
}

