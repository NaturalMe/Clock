//
//  InkViewController.swift
//  Clock
//
//  Created by 张润良 on 2017/4/26.
//  Copyright © 2017年 Zhangrunliang. All rights reserved.
//

import UIKit
import DropDown
import pop

class InkViewController: UIViewController, BackgroundTaskDelegate {

    @IBOutlet weak var speckButton: UIButton!
    
    @IBOutlet weak var frequencyButton: UIButton!
    
    @IBOutlet weak var hourTensDigit: UIImageView!
    
    @IBOutlet weak var hourUnitsDigit: UIImageView!
    
    @IBOutlet weak var minuteTenDigit: UIImageView!
    
    @IBOutlet weak var minuteUnitsDigit: UIImageView!
    
    @IBOutlet weak var secondTenDigit: UIImageView!
    
    @IBOutlet weak var secondUnitsDigit: UIImageView!
    
    @IBAction func tapSpeckButton(_ sender: Any) {
        
        isSpeak = !isSpeak
        
        if isSpeak {
            speckButton.setTitle("停止", for: .normal)
        } else {
            speckButton.setTitle("播报", for: .normal)
        }
    }
    
    @IBAction func tapFrequencyButton(_ sender: Any) {
        dropDown.show()
    }
    
    /// 下拉菜单
    let dropDown = DropDown()
    
    /// 文字转语音
    let speech = Speech()
    
    /// 报时间隔时间
    var intervalTime = "2"
    
    /// 是否播报
    var isSpeak = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setDropDown()
        setBackGroundTask()
    }
    
    func setDropDown() {
        DropDown.appearance().textFont = UIFont(name: "(", size: 15)!
        
        dropDown.anchorView = frequencyButton
        dropDown.dataSource = ["2", "5", "10", "30", "60"]
        dropDown.selectionAction = { [unowned self] (index: Int, item: String) in
            self.intervalTime = item
        }
    }
    
    func setBackGroundTask() {
        let backgroundTask = BackgroundTask()
        backgroundTask.config()
        backgroundTask.delegate = self
        backgroundTask.start()
    }
    
    func updateTime() {
        let timeArray = getCurrentTime()
        let hour = timeArray[0]
        let minute = timeArray[1]
        let second = timeArray[2]
        
        hourTensDigit.image    = UIImage(named: hour.substring(to: 1))
        hourUnitsDigit.image   = UIImage(named: hour.substring(from: 1))
        minuteTenDigit.image   = UIImage(named: minute.substring(to: 1))
        minuteUnitsDigit.image = UIImage(named: minute.substring(from: 1))
        secondTenDigit.image   = UIImage(named: second.substring(to: 1))
        secondUnitsDigit.image = UIImage(named: second.substring(from: 1))
        
        if isSpeak {
            speckWhenOpportunity(hour: hour as String, minute: minute as String, second: second as String)
        }
    }
    
    
    
    func getCurrentTime() -> Array<NSString> {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm:ss"
        let timeString = dateFormatter.string(from: Date())
        let array = timeString.components(separatedBy: ":")
        return array as Array<NSString>
    }
    
    func speckWhenOpportunity(hour: String, minute: String, second: String) {
        let secondNum = Int(second)!
        
        // 秒为0
        if secondNum == 0 {
            let minuteNum = Int(minute)!
            
            // 分钟为0
            if minuteNum == 0 {
                let hourNum = Int(hour)!
                speech.speck(string: "\(hourNum)点")
            } else {
                speech.speck(string: "\(minuteNum)分")
            }
        } else if secondNum % Int(intervalTime)! == 0 {
            speech.speck(string: "\(secondNum)")
        }
    }
    
    // MARK: - BackgroundTaskDelegate
    func task() {
        
        updateTime()
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
