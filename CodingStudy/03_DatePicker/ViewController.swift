//
//  ViewController.swift
//  03_DatePicker
//
//  Created by 712 on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0
    
    @IBOutlet var lblCurrentTime: UILabel!  // 현재 시간 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel!   // 선택 시간 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {   // 데이트 피커에 대한 액션 함수
        
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)
        
    }
    
    @objc func updateTime() {
        
        //      lblCurrentTime.text = String(count)
        //      count = count + 1
        
        let date = NSDate()
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
        
    }
    
}

