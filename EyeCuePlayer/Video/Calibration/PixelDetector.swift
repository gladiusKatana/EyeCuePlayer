// eyeCuePlayer ･ PixelDetector.swift
import UIKit

extension UIViewController {
    
    func snapshotView(view: UIView) /*-> UIView*/ {
        let snapshot = view.snapshotView(afterScreenUpdates: false)!
        //snapshot.translatesAutoresizingMaskIntoConstraints = false
        settingsPanel.settingsView.addSubview(snapshot) ///include  settingsController.  ??
        
        ///snapshot?.frame = convert(view.bounds, from: view)
        //snapshot?.frame = CGRect(x: 0, y: 0, width: view.frame.width / 2, height: view.frame.height / 2)  //funny fractal effect
        //return snapshot!
        
        imageWithView(inView: snapshot)
    }
    
    /*func snapshotViews(views: [UIView], afterUp dates: Bool) -> [UIView] {
     return views.map { snapshotView(view: $0, afterUp dates: afterUp dates) }           //comment out  afterUp dates  parameter?
     }*/
    
    func imageWithView(inView: UIView) /*-> UIImage*/ {                                         ///print("\n image with view")
        UIGraphicsBeginImageContextWithOptions(inView.bounds.size, inView.isOpaque, 1.0)        // this was  1.0  initially
        //if let context = UIGraphicsGetCurrentContext() {  //inView.layer.render(in: context)
        inView.translatesAutoresizingMaskIntoConstraints = false
        inView.drawHierarchy(in: inView.bounds, afterScreenUpdates: true)      //MUST be true!
        
        convertedImage = UIGraphicsGetImageFromCurrentImageContext()!          //was this an optional originally (does this matter?)
        //UIGraphicsEndImageContext()                                          //uncomment me... and, enjoy some slips
        
        convertedImage.getPixelColor(pos: CGPoint(x: 30, y: 370))
        //        for (xVal, yVal) in [(10, 360), (20, 360), (10, 370), (20, 370)] {
        //            convertedImage.getPixelColor(pos: CGPoint(x: xVal, y: yVal)) }
    }
}

extension UIImage {
    func getPixelColor(pos: CGPoint) /*-> UIColor*/ {
        
        let pixelData = self.cgImage!.dataProvider!.data
        let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
        
        //        let posXInt = Int(pos.x)
        //        let posYInt = Int(pos.y) //;print("(x,y) = (\(posXInt),\(posYInt))")
        
        let pixelInfo: Int = ((Int(self.size.width) * Int(pos.y)) + Int(pos.x)) * 4
        //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .black)
        
        let r = CGFloat(data[pixelInfo+2]) / CGFloat(255.0);      //print("r = \(r)")
        let g = CGFloat(data[pixelInfo+1]) / CGFloat(255.0);      //print("g = \(g)")
        let b = CGFloat(data[pixelInfo]) / CGFloat(255.0);        //print("b = \(b)")       //red and blue are switched
        //let a = CGFloat(data[pixelInfo+3]) / CGFloat(255.0);      //print("a = \(a)")
        
        //testColour = UIColor(red: r, green: g, blue: b, alpha: a);    print("          colour = \(testColour)")
        //print("--------------------------------------------------------------------------------------------------------")
        
        /**/
        
        /*else */ if r == 1 && g == 1 && b == 1 {
            //whitePixelCount = whitePixelCount + 1;    print("whitePixelCount = \(whitePixelCount)")
            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .red)
            print("                                          timeAccumulated = \(timeAccumulated)")
            times.append(timeAccumulated)
        }
        //        else {
        //            //print("other")
        //            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .purple)
        //        }
        // return UIColor(red: r, green: g, blue: b, alpha: a)
    }
}


func dotAppearInImage(xCoord: Int, yCoord: Int, circleColor: UIColor) {
    dotButton = UIButton(frame: CGRect(x: xCoord, y: yCoord, width: 1, height: 1))
    dotButton.setImage(dotButtonImage, for: UIControl.State())
    dotButton.tintColor = circleColor
    
    dotButton.isUserInteractionEnabled = false
    videoVC.videoPlayerView.addSubview(dotButton)
}


/*
 //        if r == 0 && g == 0 && b == 0 {
 //            //print("black")
 //            blackPixelCount = blackPixelCount + 1
 //            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .red)
 //        }
 //        else if r == 1 && g == 0 && b == 0 {      /// pr in ts:  colour = UIExtendedSRGBColorSpace 0.996078 0.00392157 0 1
 //            //print("red--------------------------------------------------------------------------------------------------------r e d")
 //            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .green)
 //        }
 //        else if r == 0 && g == 1 && b == 0 {      /// pr in ts:  colour = UIExtendedSRGBColorSpace 0.00784314 1 0.00392157 1
 //            //print("green")
 //            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .black)
 //        }
 //        else if r == 0 && g == 0 && b == 1 {      /// pr in ts:  colour = UIExtendedSRGBColorSpace 0.00392157 0 1 1
 //            //print("blue")
 //            //dotAppearInImage(xCoord: posXInt, yCoord: posYInt, circleColor: .blue)
 //        }
 */

/*                         * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *
 func getPixelColorAtPoint(point:CGPoint, sourceView: UIView) { //-> UIColor{
 let pixel = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: 4)
 let colorSpace = CGColorSpaceCreateDeviceRGB()
 let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.premultipliedLast.rawValue)
 let context = CGContext(data: pixel, width: 1, height: 1, bitsPerComponent: 8, bytesPerRow: 4, space: colorSpace, bitmapInfo: bitmapInfo.rawValue)
 
 context!.translateBy(x: -point.x, y: -point.y)
 sourceView.layer.render(in: context!)
 color = UIColor(red: CGFloat(pixel[0])/255.0,
 green: CGFloat(pixel[1])/255.0,
 blue: CGFloat(pixel[2])/255.0,
 alpha: CGFloat(pixel[3])/255.0)
 pixel.deallocate(capacity: 4)
 //print("pixels: [\(pixel[0]), \(pixel[1]), \(pixel[2]), \(pixel[3])]")
 //return color
 print("color = \(color) * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * * *")
 }*/

//extension ScreenshotController {
//    func displayDate() {
//        let date = Date()
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MMM d, h:mm "
//        //dateFormatter.timeZone = TimeZone("EST")! as TimeZone
//        let str = dateFormatter.string(from: date as Date)
//        print("-------------");  print("\(str)");  print("-------------")
//    }
//}

