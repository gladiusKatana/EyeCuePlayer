// eyeCuePlayer ･ Parameters.swift
import UIKit; import AVKit

extension VideoVC {
    
    func setParameters(){               ///print("\nsetting parameters")
        mode = "forward.";              //selectedVideoLink = "initially not set"
        
        /*timeCount = 0;*/              ecks = 0;                   taps = 0;               quickSwipes = 0;    fSeeks = 0
        /*timeCountMinusOne = 0;*/      fSwipes = 0;                swipes = 0;             quickTaps = 0;      rSeeks = 0
        /*levelLength = 0.0;*/          qFSwipes = 0;               bubble = 0
        descriptionT = 0.0
        
        timeAccumulated = 0.0;          localSpeed = 1.0;           delT = 0.0;             //pauseTee = 0.0
        delayInter = 0.0;               corFac = 0.05;              boundary = -0.09;       elapsed = 0.0
        //timeAccumulatedForSlider = 0.0 //; delayInterForSlider = 0.0
        
        justPinched = false;            justLongPressed = false
        started = false;                paused = true;              latch = false;          //justSwiped = false
        donePlaying = false;            downPaused = false;         gonnaSpeed = false;     justFSwiped = false
        descriPaused = false
        actualDescription = false
        
        interrupted = false;            justInterrupted = false;    justFSeeked = false;    //justUpSwiped = false
        hourGlassOn = false;            seekOn = false;             justTapped = false;     justDownSwiped = false
        //readyForPause = false         //; slow = false;           //; stopButton = false
    }
    
    func framePlus() {
        if ecks < timeCount - 3 {ecks = ecks + 1}  //;print("+1")
    }
    
    func frameMinus(cutoff: Int) {
        if ecks >= cutoff {ecks = ecks - 1}  //;print("-1")
    }
}

extension VideoPlayerView {
    
    func setDeltas() {  ///print("\n--------------------------- set Deltas  ---------------------------------------------------------\n")
        timeCount = times.count;  timeCountMinusOne = timeCount - 1
        timeD = [Double]()
        
        for index in 1...timeCountMinusOne {
            timeD.append(times[index] - times[index-1])
        }
        //timeD.append(timeD.last!)   //was there just to stop !crash  before
    }
}

