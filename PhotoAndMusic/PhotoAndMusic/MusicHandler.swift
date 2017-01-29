//
//  audioPlayer.swift
//  PhotoAndMusic
//
//  Created by 楊信之 on 29/01/2017.
//  Copyright © 2017 楊信之. All rights reserved.
//

import UIKit
import AVFoundation

class MusicHandler: NSObject {
    
    //MARK: - Variable
    var audioPlayer : AVAudioPlayer
    var isPlaying   : Bool = false
    var path        : URL?
    var isLooper    : Bool = false
    
    
    //MARK: - Singleton
    class var sharedInstance: MusicHandler {
        struct Static {
            static let instance: MusicHandler = MusicHandler()
        }
        return Static.instance
    }
    
    override init() {
        //
        audioPlayer = AVAudioPlayer()
        super.init()
    }
    
    //MARK: - Function
    func setMusic(name: String, type: String) {
        
        do {
            path = Bundle.main.url(forResource: name, withExtension: type)
            audioPlayer = try AVAudioPlayer(contentsOf: path!)
        }
        catch {
            print(">> No such file path")
        }
    }
    
    func play() {
        guard (path != nil) else {
            print(">> No set music yet!!")
            return
        }
        
        if audioPlayer.prepareToPlay() == true {
            audioPlayer.play()
            self.isPlaying = true
        }
        
    }
    
    func stop() {
        self.isPlaying = false
        audioPlayer.stop()
    }
    
    func getMusicDuration() -> Float {
        return Float(audioPlayer.duration)
    }
    
    func getCurrentTime() -> Float {
        return Float(audioPlayer.currentTime)
    }
}


