//
//  Speech.swift
//  Clock
//
//  Created by 张润良 on 2017/5/6.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import Foundation
import Speech

class Speech {
    let dateFormatter = DateFormatter()
    let speechSynthesizer = AVSpeechSynthesizer()
    let speechSynthesisVoice = AVSpeechSynthesisVoice(language: "zh_CN")
    
    func speck(string: String) {
        let speechUtterance = AVSpeechUtterance(string: string)
        speechUtterance.voice = speechSynthesisVoice
        speechUtterance.rate = 0.5
        speechSynthesizer.speak(speechUtterance)
    }
}
