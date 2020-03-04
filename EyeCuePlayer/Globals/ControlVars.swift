// eyeCuePlayer ･ ControlVars.swift
import UIKit

var remoteControlVC = RemoteControlVC()


var tThrow = CFAbsoluteTimeGetCurrent();                    var tCatch = CFAbsoluteTimeGetCurrent()
var tThrowForSlider = CFAbsoluteTimeGetCurrent()            //; var tCatchForSlider = CFAbsoluteTimeGetCurrent()
var stopWatch = Timer()


var ecks = 0;                       var taps = 0;           var fSwipes = 0;          var fSeeks = 0
var timeCount = 0;                  var quickTaps = 0;      var quickSwipes = 0;      var rSeeks = 0
var timeCountMinusOne = 0;          var swipes = 0;         var qFSwipes = 0

var boundary = -0.09;               var localSpeed = 1.0
var bubble = 0

var position = 0.0;                 var maxedOutPosition = 0.0
var sliderScaleFactor = 1.0


var levelLength = 0.0
var delayInter = 0.0;               var delT = 0.0;
var timeAccumulated = 0.0;          var elapsed = 0.0
var descriptionT = 0.0

var isController = true
var slideshowModeOn = false;        var autoDescriptionsOn = false

//var delayInterForSlider = 0.0
//var timeAccumulatedForSlider = 0.0

//var diff = 0.0
//var loopT = 0.0

