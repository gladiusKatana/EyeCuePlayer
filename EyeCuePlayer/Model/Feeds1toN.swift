// eyeCuePlayer ･ Feeds1toN.swift
import UIKit

class CellOne: FeedCell {                                        ///There is no "CellZero"... it's the FeedCell              //Do some factoring here   
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedOne { (videos) in
            
            self.videos = videos
            
//            self.videos = globalVideos                          //; print("\nvideo link: \(videos.first?.title ?? "!(1)")\n")
            
//            print("cell one has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

class CellTwo: FeedCell {
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedTwo { (videos) in
            
            self.videos = videos
            
//            self.videos = globalVideos                          //; print("\nvideo link: \(videos.first?.title ?? "!(2)")\n")
            
//            print("cell two has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

class CellThree: FeedCell {
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedThree { (videos) in
            
            self.videos = videos
            
//            self.videos = globalVideos                          //; print("\nvideo link: \(videos.first?.title ?? "!(2)")\n")
            
//            print("cell three has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

