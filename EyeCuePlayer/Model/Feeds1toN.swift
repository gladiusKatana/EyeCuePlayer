// eyeCuePlayer ･ Feeds1toN.swift
import UIKit

class CellOne: FeedCell {                                        ///There is no "CellZero"... it's the FeedCell              //Do some factoring here   
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedOne { (videos) in
            
            self.videos = videos
            
            //print("cell one has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

class CellTwo: FeedCell {
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedTwo { (videos) in
            
            self.videos = videos
            
            //print("cell two has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

class CellThree: FeedCell {
    
    override func getFeed() {
        ApiService.sharedInstance.fetchFeedThree { (videos) in
            
            self.videos = videos
            
            //print("cell three has \(self.videos!.count) videos")
            
            self.collectionView.reloadData()
        }
    }
}

