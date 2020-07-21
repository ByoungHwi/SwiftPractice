//
//  ViewController.swift
//  DatePicker
//
//  Created by Byoung-Hwi Yoon on 2020/07/20.
//

import UIKit

class DateViewController: UIViewController {
    let timeSelector : Selector = #selector(DateViewController.updateTime)
    let interval = 1.0
    var count = 0
    var alarmTime : String?

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil,
                             repeats: true)
        
    
    }
    
    @objc func updateTime() {
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
        
        if alarmTime == formatter.string(from: date as Date){
            view.backgroundColor = UIColor.red
        } else {
            view.backgroundColor = UIColor.white
        }
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        alarmTime = formatter.string(from: datePickerView.date)
        lblPickerTime.text = "선택시간 : " + alarmTime!
    }
    
}

