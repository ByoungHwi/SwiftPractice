//
//  ViewController.swift
//  Chap6Practice
//
//  Created by Byoung-Hwi Yoon on 2020/07/20.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector: Selector = #selector(ViewController.updateTime)
    let alarmSelector: Selector = #selector(ViewController.alarmOnOff)
    let interval = 1.0
    var alarmTime : String = "sss"
    var isAlarmOn = true
    
    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblSelectedTime: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
    }

    @IBAction func datePick(_ sender: UIDatePicker) {
        let datePickerView = sender
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarmTime = formatter.string(from: datePickerView.date)
        
        lblSelectedTime.text = "선택시간 : " + alarmTime
    }
    
    @objc func updateTime() {
        let date = NSDate()
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        if isAlarmOn{
            if formatter.string(from: date as Date) == alarmTime {
                let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다.", preferredStyle: UIAlertController.Style.alert)
                
                let confirmAction = UIAlertAction(title: "네, 알겠습니다.", style: UIAlertAction.Style.default, handler: {
                    ACTION in self.isAlarmOn = false
                    Timer.scheduledTimer(timeInterval: 60.0, target: self, selector: self.alarmSelector, userInfo: nil, repeats: false)
                })
                
                alarmAlert.addAction(confirmAction)
                present(alarmAlert, animated: true, completion: nil)
            }
        }
    }
    
    @objc func alarmOnOff() {
        if !isAlarmOn {
            isAlarmOn = true
        }
    }
    
}

