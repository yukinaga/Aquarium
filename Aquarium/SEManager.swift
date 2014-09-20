//
//  SEManager.swift
//  Aquarium
//
//  Created by Yukinaga Azuma on 2014/09/20.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

import Foundation
import AVFoundation

class SEManager:NSObject, AVAudioPlayerDelegate {
    
    var soundArray:[AVAudioPlayer] = []
    override init() {
        
    }
    
    func play(soundName sName:String){
        let soundPath:String = NSBundle.mainBundle().bundlePath.stringByAppendingPathComponent(sName)
        let url:NSURL? = NSURL.fileURLWithPath(soundPath)
        let p:AVAudioPlayer? = AVAudioPlayer(contentsOfURL:url, error:nil)
        if let player = p{
            player.numberOfLoops = 0
            player.delegate = self
            soundArray.insert(player, atIndex: 0)
            player.prepareToPlay()
            player.play()
        }
    }
    
    func audioPlayerDidFinishPlaying(player: AVAudioPlayer!, successfully flag: Bool) {
        var i = find(soundArray, player)
        if let index = i{
            soundArray.removeAtIndex(index)
        }
    }
}
