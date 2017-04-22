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
    
    @IBAction func tapStartButton(_ sender: Any) {
        
    }
    
    var timer: Timer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        timeLabel.morphingEffect = .fall
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        
        self.timeLabel.text = dateFormatter.string(from: Date())
        
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { (t: Timer) in
            self.timeLabel.text = dateFormatter.string(from: Date())
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

