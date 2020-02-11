// eyeCuePlayer ･ ControlVars.swift
import UIKit

//MARK: Buttons

var vidOrSlideButton = UIButton();              var newPlayButton = UIButton()
var dotButton = UIButton() ///doesn't need to be a button


//MARK: Gestures

var sliderView = SliderView()

var settingsPinch = UIPinchGestureRecognizer()

var leftSwipe = UISwipeGestureRecognizer();     var rightSwipe = UISwipeGestureRecognizer();
var upSwipe = UISwipeGestureRecognizer();       var downSwipe = UISwipeGestureRecognizer()
var tapG = UITapGestureRecognizer();            var pinchMe = UIPinchGestureRecognizer()
var longP = UILongPressGestureRecognizer();     var dismissPinch = UIPinchGestureRecognizer()

///var leftControlSwipe = UISwipeGestureRecognizer();  var rightControlSwipe = UISwipeGestureRecognizer()
///var maxGestureYValue = 300  //320

var calibTaps = 0;


