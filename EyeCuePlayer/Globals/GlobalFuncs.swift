// eyeCuePlayer ･ GlobalFuncs.swift
import UIKit

func playForward(){};       func accumulateTime(_ localT: Double){};    func fineDelay(){};                 func paws(){}
func progress(){};          func seek(_ framesAhead: Int){};            func frameMinus(_ cutoff: Int){};   func framePlus(){}
func setupPlayer(){}

func createDocumentFolderUrl(downloadUrl: URL, formatSelectorId: String){}


func displayDate() {
    let date = Date()
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "MMM d, h:mm "
    //dateFormatter.timeZone = TimeZone("EST")! as TimeZone
    let str = dateFormatter.string(from: date as Date)
    //print("-------------")
    print("\(str)")
    //print("-------------")
}


//    func setupLoadingVideo(frameVerticalReduction: Int, frameScaleReduction: Int) {
//        let filePath = Bundle.main.path(forResource: " loadingScreen", ofType:"m4v")
//        let url = URL(fileURLWithPath: filePath!)
//        playor = AVPlayer(url: url)
//        playor.play()
//
//        playerLayer = AVPlayerLayer(player: playor)
//        self.layer.addSublayer(playerLayer)
//        playerLayer.videoGravity = AVLayerVideoGravity.resizeAspect//Fill
//
//        let sliderViewFrame = CGRect(x: 0, y: CGFloat(frameVerticalReduction), width: globalWindow.frame.width, height: globalWindow.frame.height - CGFloat(frameScaleReduction))
//        playerLayer.frame = sliderViewFrame
//    }

