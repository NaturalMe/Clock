//
//  BackgroundTask.swift
//  Clock
//
//  Created by 张润良 on 2017/5/7.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import Foundation
import AVFoundation

protocol BackgroundTaskDelegate {
    func task()
}

class BackgroundTask {
    
    var player: AVQueuePlayer!
    
    var delegate: BackgroundTaskDelegate!
    
    func config() {
        do{
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayAndRecord, with: .defaultToSpeaker)
        } catch {
            print(error)
        }
        
        
        let url = Bundle.main.url(forResource: "OneHour", withExtension: "mp3")
        
        let song = AVPlayerItem(url: url!)
        
        player = AVQueuePlayer(items: [song])
        
        player.actionAtItemEnd = .advance
        
        player.addPeriodicTimeObserver(forInterval: CMTimeMake(1, 1), queue: DispatchQueue.main) { (time) in
            self.delegate.task()
        }
    }
    
    func start() {
        player.play()
    }
}
