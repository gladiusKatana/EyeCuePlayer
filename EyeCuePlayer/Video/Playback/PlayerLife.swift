// eyeCuePlayer ･ PlayerLife.swift
import UIKit; import AVKit //Life means lifecycle

extension VideoPlayerView {
    
    func addPlayorToView(link: String) {
        
        if let tempVideoUrl = URL(string: link) { //was NSURL(string: selectedVideoLink)
            avPlayer = AVPlayer(url: tempVideoUrl as URL)
            let tempVideoCell = VideoCell()
            tempVideoCell.createDocumentFolderUrl(downloadUrl: tempVideoUrl, formatSelectorId: "video")
            viewLoaded = true
        } else {print("could not downcast temp video url")}
        
        setupPlayerLayer()  ///; playerEndNotification()
        
        /*(hardcoding times-array: see below)*/
        
        if calibrateMode {
            times = [0.0]
            timeD = [levelLength, 0.0]  //redundant?ify
        }
        timeCount = times.count;  timeCountMinusOne = timeCount - 1
        if !calibrateMode {setDeltas()}
    }
    
    func playerEndNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(VideoPlayerView.itemDidFinishPlaying(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
    }
    
    func playerEndReplay() {
        NotificationCenter.default.addObserver(self, selector: #selector(VideoPlayerView.itemDidFinishPlayingAndWillReplay(_:)), name: NSNotification.Name.AVPlayerItemDidPlayToEndTime, object: avPlayer.currentItem)
    }
    
    @objc func itemDidFinishPlaying(_ notification: Notification) {                 //print("-------------------------- done playing")
    }
    
    @objc func itemDidFinishPlayingAndWillReplay(_ notification: Notification) {
        if !viewLoaded {                                                            //print("seekedBack")
            setupLoadingVideo()
        } //else {print("did not seek back")}
    }
}

/*times = [0.0, 1.8024384260177608, 4.412105679512023, 6.8054954290389968, 9.1338281869888256, 11.594683814048755, 13.93960819244384, 15.10726265907287, 18.510440301895134, 20.612417054176323, 23.21692709922791, 24.352161884307865, 27.900114679336554, 29.009499073028568, 33.142857360839848, 33.970673322677612, 35.817933678627028, 37.139514493942272, 38.299734473228469, 39.613180518150344, 42.708488178253191, 44.776158094406142]*/

