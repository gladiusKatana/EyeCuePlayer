// eyeCuePlayer ･ CoreVars.swift
import UIKit//;   import AVKit


var globalWindow = UIWindow(frame: UIScreen.main.bounds)

var backgroundView = UIView()

var messageView = MessageView()

var settingsPanel = SettingsPanel();        var settingsControllerB = AltSettingsPanel()

var titleLabel = UILabel()


var buttonSize = 36
var viewFrameHeight = 0.0
var viewFrameWidth = 0.0;               var frameWidth = 100    // replace one of these
var aspectFrameHeight = 0.0;            var adjustHeight = 7.0

//var xVal = Int(); var yVal = Int()

//---------------------------------------------------------------- reorganized vars up to here so far

var viewLoaded = false;                 var paused = true;              var latch = false;                  var justTapped = false
var started = false;                    var downPaused = false;         var gonnaSpeed = false;             var justSwiped = false
var donePlaying = false;                var descriPaused = false;       var justDownSwiped = false;         var justFSwiped = false

var justCalibrated = false;             var justLongPressed = false;    var justPressedSliderButton = false
var interrupted = false;                var seekOn = false;             var justUpSwiped = false;           var justFSeeked = false
var justInterrupted = false;            var hourGlassOn = false;        var justPinched = false;            var pinchedIn = false
var actualDescription = false

var calibrateMode = false
var justTookRemoteInput = true
var justSetSliderBackOnce = false;      var slydInCurrentTimeInterval = false
var screenshotTestBool = true;          var justTookSnapshot = false

var justPinchedFromSettings = false;    var justPinchedFromMessage = false
var justSlid = false;                   var printAnomalousDiffValue = true
var tempSavedBool = false
var playButtonOn = false

