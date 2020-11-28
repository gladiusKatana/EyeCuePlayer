// eyeCuePlayer ･ Colors&Images.swift
import UIKit


extension UIColor {
    static func rgb(_ red: CGFloat, green: CGFloat, blue: CGFloat, alpha: CGFloat) -> UIColor {
        return UIColor(red: red/255, green: green/255, blue: blue/255, alpha: alpha)
    }
}

var testColour = UIColor()

//var uiBarsColor = UIColor.rgb(150, green: 180, blue: 220, alpha: 1)

var icyBlue = UIColor.rgb(150, green: 180, blue: 220, alpha: 0.3)
var darkerIceBlue = UIColor.rgb(150, green: 160, blue: 220, alpha: 1)


var convertedImage = UIImage()

var feedBackgroundImage = UIImage(named: "earth")?.withRenderingMode(.alwaysTemplate)
var playButtonImage = UIImage(named: "playButtonStencil")?.withRenderingMode(.alwaysTemplate)
var dotButtonImage = UIImage(named: "timeCircleSolid")?.withRenderingMode(.alwaysTemplate)
//var tallSliderImage = UIImage(named: "dial")?.withRenderingMode(.alwaysOriginal)

var playIndicatorImage = UIImage(named: "indicators2")?.withRenderingMode(.alwaysTemplate)
var slideIndicatorImage = UIImage(named: "indicators1")?.withRenderingMode(.alwaysTemplate)

