//
//  MainViewController.swift
//  Clock
//
//  Created by 张润良 on 2017/4/22.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import UIKit
import LTMorphingLabel

class MainViewController: UIViewController, IFlySpeechSynthesizerDelegate {

    
    @IBOutlet weak var timeLabel: LTMorphingLabel!
    
    @IBAction func tapStartButton(_ sender: Any) {
        isSpeaking = !isSpeaking
        
    }
    
    var isSpeaking = false
    
    let dateFormatter = DateFormatter()
    
    var timer: Timer!
    
    var iFlySpeechSynthesizer: IFlySpeechSynthesizer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.morphingEffect = .fall
        dateFormatter.dateFormat = "HH:mm:ss"
        updateTime()
        initSpeech()
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t: Timer) in
            self.updateTime()
            if self.isSpeaking {
                self.speckTime()
            }
        }
    }
    
    func initSpeech() {
        iFlySpeechSynthesizer = IFlySpeechSynthesizer.sharedInstance()
        iFlySpeechSynthesizer.delegate = self
        iFlySpeechSynthesizer.setParameter("50", forKey: IFlySpeechConstant.speed())
        iFlySpeechSynthesizer.setParameter("vixx", forKey: IFlySpeechConstant.voice_NAME())
    }
    
    func updateTime() {
        self.timeLabel.text = dateFormatter.string(from: Date())
    }
    
    func speckTime() {
        let array = self.timeLabel.text.components(separatedBy: ":")
        var hh = array[0]
        var mm = array[1]
        var ss = array[2]
        
        var speakString = ""
        
        if mm.isZero() && ss.isZero() {
            
            if hh.isSingle() {
                hh.removeSingle()
            }
            
            speakString = hh + "点整"
            
        } else if ss.isZero() {
            
            if mm.isSingle() {
                mm.removeSingle()
            }
            
            speakString = hh + "点" + mm + "分"
            
        } else {
            
            if ss.isSingle() {
                ss.removeSingle()
            }
            
            speakString = ss
        }
        
        
        
        print(speakString)
        //iFlySpeechSynthesizer.startSpeaking(speakString)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func onCompleted(_ error: IFlySpeechError!) {
        print(error)
    }
    
    
}

