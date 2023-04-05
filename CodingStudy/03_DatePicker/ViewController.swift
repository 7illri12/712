//
//  ViewController.swift
//  03_DatePicker
//
//  Created by 712 on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    // 타이머가 구동되는 데에 사용될 함수.
    let timeSelector : Selector = #selector(ViewController.updateTime)
    let interval = 1.0  // 타이머 간격 설정 : 1초
    var count = 0       // 타이머가 설정한 간격대로 실행되는지 확인할 변수
    
    @IBOutlet var lblCurrentTime: UILabel!  // 현재 시간 레이블 아웃렛 변수
    @IBOutlet var lblPickerTime: UILabel!   // 선택 시간 레이블 아웃렛 변수
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 타이머 설정
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timeSelector, userInfo: nil, repeats: true)
        
    }

    @IBAction func changeDatePicker(_ sender: UIDatePicker) {   // 데이트 피커에 대한 액션 함수
        
        let datePickerView = sender         // 전달될 인수 저장
        
        let formatter = DateFormatter()     // DateFormatter 클래스를 상수로 선언
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"   // formatter의 dateFormat 속성 설정
        lblPickerTime.text = "선택 시간 : " + formatter.string(from: datePickerView.date)   // 데이트 피커에서 선택한 날짜를 formatter의 dateFormat에서 설정한 포맷으로 변환. (string 메서드를 사용하여 문자열 String으로 변환. )
        
    }
    
    // 타이머가 구동된 후 정해진 시간이 되면 실행할 함수.
    @objc func updateTime() {
        
        //      count 값을 문자열로 변환하여 lblCurrentTime.Text에 출력함.
        //      lblCurrentTime.text = String(count)
        //      count = count + 1       // count 값에 1을 증가
        
        let date = NSDate()     // 현재 시간 가져오기
        
        let formatter = DateFormatter()     // DateFormatter라는 클래스를 Formatter 상수로 선언
        
        formatter.dateFormat = "yyyy-MM-dd HH:mm:ss EEE"    // 상수 formatter의 dateFormat 속성 설정
        
        lblCurrentTime.text = "현재 시간 : " + formatter.string(from: date as Date)
        // 현재 날짜(date)를 formatter의 dateFormat에서 설정한 포맷으로 설정.
        // string 메서드를 사용하여 문자열 String으로 변환.
        // 문자열로 변환한 date 값을 "현재 시간 : "이라는 문자열에 추가.
        // 해당 문자열을 lblCurrentTime의 text에 입력. 
        
    }
    
}

