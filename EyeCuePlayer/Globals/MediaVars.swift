// eyeCuePlayer ･ MediaVars.swift
import UIKit; import AVKit


var videoVC = VideoVC()                     //; var sliderController = SliderController()

var avPlayer = AVPlayer();                  var playerLayer = AVPlayerLayer()

var soundEffectPlayer: AVAudioPlayer?;      var musicPlayer: AVAudioPlayer?


var tThrow = CFAbsoluteTimeGetCurrent();                    var tCatch = CFAbsoluteTimeGetCurrent()
var tThrowForSlider = CFAbsoluteTimeGetCurrent()            //; var tCatchForSlider = CFAbsoluteTimeGetCurrent()
var stopWatch = Timer()


var ecks = 0;                       var taps = 0;           var fSwipes = 0;          var fSeeks = 0
var timeCount = 0;                  var quickTaps = 0;      var quickSwipes = 0;      var rSeeks = 0
var timeCountMinusOne = 0;          var swipes = 0;         var qFSwipes = 0


var sliderScaleFactor = 1.0

var delayInter = 0.0;               var delT = 0.0;                 var levelLength = 0.0
//var delayInterForSlider = 0.0
//var timeAccumulatedForSlider = 0.0
var timeAccumulated = 0.0;          var elapsed = 0.0
var diff = 0.0

var descriptionT = 0.0;             var boundary = -0.09;           var localSpeed = 1.0
var bubble = 0


var selectedVideoLink = " ";        var selectedThumbnailLink = " "
var destinationString = " "
var mode = "forward"
var slowMoTempTitle = "temporary title for testing SloMoController"
var playerTempTitle = "temp title for player after sloMoController"

