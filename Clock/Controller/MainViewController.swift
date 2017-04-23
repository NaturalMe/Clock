//
//  MainViewController.swift
//  Clock
//
//  Created by 张润良 on 2017/4/22.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import UIKit
import LTMorphingLabel

class MainViewController: UIViewController {

    
    @IBOutlet weak var timeLabel: LTMorphingLabel!
    
    @IBAction func switchValueChanged(_ sender: Any) {
        isSpeaking = !isSpeaking
    }
 
    @IBAction func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        var title = sender.titleForSegment(at: sender.selectedSegmentIndex)
        if title == "60" {
           title = "00"
        }
        second = Int(title!)!
    }
    
    
    
    let dateFormatter = DateFormatter()
    let speechSynthesizer = AVSpeechSynthesizer()
    let speechSynthesisVoice = AVSpeechSynthesisVoice(language: "zh_CN")
    
    var isSpeaking = false
    var isIgnore = false
    var second: Int = 2
    var timer: Timer!
    
    //var iFlySpeechSynthesizer: IFlySpeechSynthesizer!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.morphingEffect = .fall
        dateFormatter.dateFormat = "HH:mm:ss"
        updateTime()
        
        
        
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t: Timer) in
//            self.updateTime()
//            if self.isSpeaking {
//                self.speckTime()
//            }
//        }
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(speckTime), userInfo: nil, repeats: true)
    }
    
    func updateTime() {
        self.timeLabel.text = dateFormatter.string(from: Date())
    }
    
    func speckTime() {
        self.updateTime()
        guard self.isSpeaking else { return }
        
        let array = self.timeLabel.text.components(separatedBy: ":")
        var hh = array[0]
        var mm = array[1]
        var ss = array[2]
        
        let nowSecond = Int(ss)!
        print("========")
        print(nowSecond)
        print(second)
        print(nowSecond % second)
        guard nowSecond % second == 0 else {
            return
        }
        
        var speakString = ""
        
        if mm.isZero() && ss.isZero() {
            
            if hh.isSingle() {
                hh.removeSingle()
            }
            
            speakString = hh + "点"
            
            
        } else if ss.isZero() {
            
            if mm.isSingle() {
                mm.removeSingle()
            }
            
            speakString = mm + "分"
            
            
        } else {
            
            if ss.isSingle() {
                ss.removeSingle()
            }
            
            speakString = ss
        }
        
        
        let speechUtterance = AVSpeechUtterance(string: speakString)
        speechUtterance.voice = speechSynthesisVoice
        speechUtterance.rate = 0.5
        speechSynthesizer.speak(speechUtterance)
    }
    
    
    
}

