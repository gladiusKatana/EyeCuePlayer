// eyeCuePlayer ･ Video.swift
import UIKit

class SafeJsonObject: NSObject {
    override func setValue(_ value: Any?, forKey key: String) {
        let upperCasedFirstCharacter = String(key.first!).uppercased() /// = String(key.characters.first!).uppercased()
        let range = NSMakeRange(0, 1)
        let selectorString = NSString(string: key).replacingCharacters(in: range, with: upperCasedFirstCharacter)
        let selector = NSSelectorFromString("set\(selectorString):")
        let responds = self.responds(to: selector)
        
        if !responds {return}
        super.setValue(value, forKey: key)
    }
}

class Video: SafeJsonObject {
    var title: String?
    var video_link: String?
    var thumbnail_image_name: String?
    var number_of_views: NSNumber?
    var duration: NSNumber?  //var funLine: String?
    var descriptions: [String]?
    var times: [Double]?
    var pages_to_edit: [Int]?
    var calibrated: Bool?
    var channel: Channel?
    
    override func setValue(_ value: Any?, forKey key: String) {
        if key == "channel" { //custom channel setup *
            self.channel = Channel()
            self.channel?.setValuesForKeys(value as! [String: AnyObject])
        }
        else {super.setValue(value, forKey: key)}
    }
    
    init(dictionary: [String: AnyObject]) {
        super.init()
        setValuesForKeys(dictionary)
    }
}

class Channel: SafeJsonObject {
    var name: String?
    var profile_image_name: String?
}

