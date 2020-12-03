// eyeCuePlayer ･ Sounds.swift
import UIKit; import AVKit

extension VideoVC {
    
    func playSound(trackTitle: String) {
        let url = Bundle.main.url(forResource: trackTitle, withExtension: "mp3")!
        do {
            soundEffectPlayer = try AVAudioPlayer(contentsOf: url)
            guard let playa = soundEffectPlayer else { return }
            
            playa.prepareToPlay()
            playa.play(); playa.rate = 2.0
        } catch let error as NSError {
            print("this is the playa error: \(error.description)")
        }
    }
    
    func playTrack(trackTitle: String) {
        let url = Bundle.main.url(forResource: trackTitle, withExtension: "mp3")!
        do {
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            guard let music = musicPlayer else { return }
            
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
            musicPlayer = try AVAudioPlayer(contentsOf: url)
            guard let music = musicPlayer else { return }
            
            music.pause()
        } catch let error as NSError {
            print("this is the playa error: \(error.description)")
        }
    }
}

