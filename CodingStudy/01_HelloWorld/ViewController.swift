//
//  ViewController.swift
//  01_HelloWorld
//
//  Created by 712 on 2023/04/02.
//

// 일반적으로 코딩을 하는 위치.
// 화면에 보이는 뷰에서 처리하는 내용의 스위프트 소스 코드를 담고 있는 클래스 파일.
// 스토리보드에서 여러 개의 뷰를 추가하면 뷰 컨트롤러 클래스 파일은 뷰의 개수에 맞춰 파일이 필요함.

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var IbHello: UILabel!         // [출력 레이블용 아웃렛 변수] 레이블에 아웃렛 변수 추가
    @IBOutlet var txtName: UITextField!     // [이름 입력용 아웃렛 변수] 텍스트 필드에 아웃렛 변수 추가
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 액션함수는 일반적으로 클래스의 맨 마지막 부분에 추가함.
    
    @IBAction func btnSend(_ sender: UIButton) {
        // 버튼을 클릭하면 "Hello, "라는 문자열과 txtName.text의 문자열을 결합하여 IbHello.txt에 넣음. 
        IbHello.text = "Hello, " + txtName.text!
    }                                       // 버튼에 대한 액션 함수 추가
    
}

