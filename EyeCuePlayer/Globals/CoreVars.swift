// eyeCuePlayer ･ CoreVars.swift
import UIKit


var globalWindow = UIWindow(frame: UIScreen.main.bounds)

var backgroundView = UIView()

var messageView = MessageView()

var settingsPanel = SettingsPanel();    var settingsControllerB = AltSettingsPanel()

var titleLabel = UILabel()

var buttonSize = 36
var viewFrameHeight = 0.0
var viewFrameWidth = 0.0;               var frameWidth = 100    // replace one of these
var aspectFrameHeight = 0.0;            var adjustHeight = 7.0
//var xVal = Int(); var yVal = Int()


var viewLoaded = false;                 var started = false;            var donePlaying = false;    var gonnaSpeed = false
var paused = true;                      var downPaused = false;         var descriPaused = false;   var latch = false

var interrupted = false;                var seekOn = false;             var justFSeeked = false
var justInterrupted = false;            var actualDescription = false;  var hourGlassOn = false

var justTapped = false;                 var justLongPressed = false;    var playButtonOn = false
var justSwiped = false;                 var justFSwiped = false;        var justUpSwiped = false;   var justDownSwiped = false
var justPinched = false;                var pinchedIn = false
var justPinchedFromSettings = false;    var justPinchedFromMessage = false

var justPressedSliderButton = false
var justSetSliderBackOnce = false;      var slydInCurrentTimeInterval = false;      var justSlid = false

var justCalibrated = false;             var calibrateMode = false
//var screenshotTestBool = true;          var justTookSnapshot = false

var tempSavedBool = false
//var justTookRemoteInput = true        //var printAnomalousDiffValue = true


