// eyeCuePlayer ･ AddGestures.swift
import UIKit

extension VideoVC {
    
    func setupVideoGestures() {
        
        dismissPinch = UIPinchGestureRecognizer(target: self, action: #selector(handlePinch))
        backgroundView.addGestureRecognizer(dismissPinch)
        
        longP = UILongPressGestureRecognizer(target: self, action: #selector(handleLongPress))
        backgroundView.addGestureRecognizer(longP)
        
        if calibrateMode {tapG = UITapGestureRecognizer(target: self, action: #selector(tapToConvertFile))}
        else {tapG = UITapGestureRecognizer(target: self, action: #selector(handleTap))}
        backgroundView.addGestureRecognizer(tapG)
        
        leftSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleLeftSwipe))
        leftSwipe.direction = .left
        backgroundView.addGestureRecognizer(leftSwipe)
        
        rightSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleRightSwipe))
        rightSwipe.direction = .right
        backgroundView.addGestureRecognizer(rightSwipe)
        
        downSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleDownSwipe))
        downSwipe.direction = .down
        backgroundView.addGestureRecognizer(downSwipe)
        
        upSwipe = UISwipeGestureRecognizer(target: self, action: #selector(handleUpSwipe))
        upSwipe.direction = .up
        backgroundView.addGestureRecognizer(upSwipe)
        
        globalWindow.addSubview(backgroundView)
        backgroundView.frame = globalWindow.frame
        videoPlayerView = VideoPlayerView(frame: backgroundView.frame)
    }
}

