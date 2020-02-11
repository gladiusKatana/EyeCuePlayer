// eyeCuePlayer ･ Sounds.swift
import UIKit; import AVKit


extension VideoVC {
    
    func playSound(trackTitle: String) {
        let url = Bundle.main.url(forResource: trackTitle, withExtension: "mp3")!
        do {
            playa = try AVAudioPlayer(contentsOf: url)
            guard let playa = playa else { return }
            
            playa.prepareToPlay()
            playa.play(); playa.rate = 2.0
        } catch let error as NSError {
            print("this is the playa error: \(error.description)")
        }
    }
    
    func playTrack(trackTitle: String) {
        let url = Bundle.main.url(forResource: trackTitle, withExtension: "mp3")!
        do {
            music = try AVAudioPlayer(contentsOf: url)
            guard let music = music else { return }
            
            music.prepareToPlay()
            music.play(); music.rate = 1.0
            music.numberOfLoops = -1
        } catch let error as NSError {
            print("this is the playa error: \(error.description)")
        }
    }
    
    func pauseTrack(trackTitle: String) {
        let url = Bundle.main.url(forResource: trackTitle, withExtension: "mp3")!
        do {
            music = try AVAudioPlayer(contentsOf: url)
            guard let music = music else { return }
            
            music.pause()
        } catch let error as NSError {
            print("this is the playa error: \(error.description)")
        }
    }
    
}

