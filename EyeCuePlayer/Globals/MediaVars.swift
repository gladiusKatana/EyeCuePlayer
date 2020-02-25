// eyeCuePlayer ･ MediaVars.swift
import UIKit; import AVKit


var videoVC = VideoVC()                     //; var sliderController = SliderController()

var avPlayer = AVPlayer();                  var playerLayer = AVPlayerLayer()

var soundEffectPlayer: AVAudioPlayer?;      var musicPlayer: AVAudioPlayer?

var messageController = MessageVC()


var selectedVideoLink = " ";        var selectedThumbnailLink = " "
var destinationString = " "
var mode = "forward"
var slowMoTempTitle = "temporary title for testing SloMoController"
var playerTempTitle = "temp title for player after sloMoController"

