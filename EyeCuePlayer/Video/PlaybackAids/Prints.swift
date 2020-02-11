// eyeCuePlayer ･ Prints.swift
import UIKit; import AVKit


extension VideoVC {
    
    func pryntPlayback(pageKey k: Int) {
        //        let timeAccd = String(format: "%.5f", timeAccumulated)
        
        //            print("\nx = \(x)   time: ", terminator: "")                                    //... for testing in central mode
        //            print(String(format: "%.3f", times[x]), terminator: "")
        //            print("   timeD: ", terminator: "")
        //            print(String(format: "%.5f", timeD[x]), terminator: "")
        //            print("    pg. \(pages[x])    v = \(localSpeed)    i = \(x-k)\ntimeAcc'd = \(timeAccd)    elapsed = ", terminator: "")
        //            print(String(format: "%.3f", elapsed), terminator: "")
        //            print("    slyd: \(slydInCurrentTimeInterval)")
    }
    
    
    func hourglass() {                                                          //print(".")
        if mode == "forward" || mode == "forFast" {         print(".", terminator:"")}
        else if mode == "reverse" || mode == "fastRev" {    print("'", terminator:"")}
        else if mode ==  "paused" {                         print("|", terminator: "")}
        else {                                              print("error with mode")}
    }
    
}


extension VideoPlayerView {
    
    //    func printApproximatePosition() {
    //        //print("approximate  \(position); \(t)  actual;  index #\(index)  delta: \(diff)  timeAcc: \(timeAccumulated)  delT: \(delT)")
    //    }
    
}

