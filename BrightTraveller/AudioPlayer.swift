//
//  AudioPlayer.swift
//  BrightTraveller
//
//  Created by Eliasz Sawicki on 09/06/2017.
//  Copyright © 2017 Eliasz Sawicki. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayer {
    
    static let sharedInstance = AudioPlayer()
    let queuePlayer = AVQueuePlayer()
    
    
    
    func playWelcomeAudio() {
//        print("*AUDIO PLAYER* playing welcome")
//        let urlPath = Bundle.main.path(forResource: "bt_welcome", ofType: "m4a")
//        let fileURL = URL(fileURLWithPath:urlPath!)
//        let playerItem = AVPlayerItem(url: fileURL)
//        queuePlayer.insert(playerItem, after: nil)
//        queuePlayer.play()
    }
    
    func playRideDecisionAudio() {
//        print("*AUDIO PLAYER* playing ride decision")
//        let urlPath = Bundle.main.path(forResource: "bt_initializer", ofType: "m4a")
//        let fileURL = URL(fileURLWithPath:urlPath!)
//        let playerItem = AVPlayerItem(url: fileURL)
//        queuePlayer.insert(playerItem, after: nil)
//        queuePlayer.play()
    }
    
    func playOnAcceptAudio() {
        print("*AUDIO PLAYER* playing ride accept audio")
        
        let urlPath = Bundle.main.path(forResource: "bt_accept", ofType: "m4a")
        let fileURL = URL(fileURLWithPath:urlPath!)
        let playerItem = AVPlayerItem(url: fileURL)
        queuePlayer.insert(playerItem, after: nil)
        queuePlayer.play()        
    }
    
    func playOnDiscardAudio() {
//        print("*AUDIO PLAYER* laying ride discard audio")
//        
//        let urlPath = Bundle.main.path(forResource: "bt_welcome", ofType: "m4a")
//        let fileURL = URL(fileURLWithPath:urlPath!)
//        let playerItem = AVPlayerItem(url: fileURL)
//        queuePlayer.insert(playerItem, after: nil)
//        queuePlayer.play()
    }
    
}
