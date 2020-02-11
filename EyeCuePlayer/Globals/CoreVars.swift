// eyeCuePlayer ･ CoreVars.swift
import UIKit;   import AVKit

var globalWindow = UIWindow(frame: UIScreen.main.bounds)

var apiService = ApiService()

var titleLabel = UILabel()

var frameWidth = 100



var convertedImage = UIImage()              //; var convertedResizedImage = UIImage()


var snapperShotGlobal = UIView()
var latestWindowImage = UIImage(named: "Mars")
//var windowImage = UIImage()
var screenCapImageGlobal = UIImage()



var backgroundView = UIView()               ; var messageView = MessageView()
//var uploadView = UploadView()




var localPath = URL(fileURLWithPath: "String")


var homeVC = HomeVC()

var videoVC = VideoVC();                    //var slowMoController = SlowMoController()

var settingsPanel = SettingsPanel();        var settingsControllerB = AltSettingsPanel()
var messageController = MessageVC();        var sliderController = SliderController();


var xVal = Int(); var yVal = Int()

var playor = AVPlayer();                    var playerLayer = AVPlayerLayer()
var playa: AVAudioPlayer?;                  var music: AVAudioPlayer?

var tThrow = CFAbsoluteTimeGetCurrent();                    var tCatch = CFAbsoluteTimeGetCurrent()
var tThrowForSlider = CFAbsoluteTimeGetCurrent();           var tCatchForSlider = CFAbsoluteTimeGetCurrent()

var tPitch = CFAbsoluteTimeGetCurrent();                    var tBat = CFAbsoluteTimeGetCurrent();  var stopWatch = Timer()

var timesIndicesToRemove = [Int]()
var times = [0.0, 0.0];   var descriptions = [String]();    var timeD = [Double]();   var pages = [Int]();   var correctionFactors = [Double]()
var deviations = [Double]()
//print("\ntimes [\(times.count) long] : \(times)")  //print("times = \(times)");  print("timeD = \(timeD)")


var gestureLetter = "D"
var latestNameEntered = "initialVideoName"  //name of the video file uploaded (see "Version 1" app)
var slowMoTempTitle = "temporary title for testing SloMoController";        var playerTempTitle = "temp title for player after sloMoController"
var destinationString = " ";        var selectedVideoLink = " ";            var selectedThumbnailLink = " ";    var mode = "forward"
var videoUrl = URL(string: "stringUrl")


var whitePixelCount = 0;            var secondTimeDelay = DispatchTime.now()
var x = 0;                          var taps = 0;           var fSwipes = 0;          var fSeeks = 0
var timeCount = 0;                  var quickTaps = 0;      var quickSwipes = 0;      var rSeeks = 0
var timeCountMinusOne = 0;          var swipes = 0;         var qFSwipes = 0
var medianTIndex = 0


var viewFrameHeight = 0.0;          var viewFrameWidth = 0.0    // replace these
var aspectFrameHeight = 0.0;        var adjustHeight = 7.0

var sliderScaleFactor = 1.0

var delayInter = 0.0;               var delT = 0.0;                 var levelLength = 0.0
var delayInterForSlider = 0.0
var timeAccumulated = 0.0;          var elapsed = 0.0;              var diff = 0.0
var timeAccumulatedForSlider = 0.0
var descriptionT = 0.0;             var boundary = -0.09;           var localSpeed = 1.0;           var bubble = 0

var position = 0.0;                 var positionPlusT = 0.0
var maxedOutPosition = 0.0
var loopT = 0.0
var previousPosition = 0.0

var corFac = 0.05 //0.15

var widheight = 36

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

