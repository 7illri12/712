//
//  ViewController.swift
//  02_ImageView
//
//  Created by 712 on 2023/04/05.
//

import UIKit

class ViewController: UIViewController {
    
    var isZoom = false      // 확대 여부를 나타내는 bool 타입의 변수
    var imgOn: UIImage?     // 토끼 이미지가 있는 UIImage 타입의 변수
    var imgOff: UIImage?    // 새 이미지가 있는 UIImage 타입의 변수
    
    @IBOutlet var imgView: UIImageView! // 이미지 뷰에 대한 아웃렛 변수. 이 변수를 사용하여 화면의 이미지 설정.
    // 일반적으로 아울렛 변수는 클래스 바로 아래에 추가함.
    
    @IBOutlet var btnResize: UIButton!  // 버튼에 대한 아웃렛 변수. 이 변수를 사용하여 버튼의 타이틀을 수정할 수 있음.
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        imgOn = UIImage(named: "IMG_0351.jpg")      // imgOn에 토끼 이미지를 할당
        imgOff = UIImage(named: "IMG_0352.jpg")     // imgOff에 새 이미지를 할당
        
        imgView.image = imgOn       // 위에서 할당한 imgOn 이미지를 imgView에 할당
        
    }

    // 확대/축소 버튼에 대한 액션 함수
    @IBAction func btnResizeImage(_ sender: UIButton) {
        
        let scale:CGFloat = 2.0     // 확대할 배율 값
        
        var newWidth:CGFloat, newHeight: CGFloat    // 확대할 크기의 계산값을 보관할 변수.
        
        if (isZoom) {   // true. 현재 상태가 '확대'일 때 (이미지의 상태는 기본이거나 축소된 상태)
            
            newWidth = imgView.frame.width/scale        // 이미지 프레임의 가로 크기에 scale 값을 나눠 newWidth에 할당
            newHeight = imgView.frame.height/scale      // 이미지 프레임의 세로 크기에 scale 값을 나눠 newHeight에 할당
            btnResize.setTitle("확대", for: .normal)     // 버튼의 텍스트를 '확대'로 변경.
            
        }   else {  //false. 현재 상태가 '축소'일 때 (이미지의 상태는 확대된 상태)
            
            newWidth = imgView.frame.width*scale        // 이미지 프레임의 가로 크기에 scale 값을 곱해 newWidth에 할당
            newHeight = imgView.frame.height*scale      // 이미지 프레임의 가로 크기에 scale 값을 곱해 newHeight에 할당
            btnResize.setTitle("축소", for: .normal)     // 버튼의 텍스트를 '축소'로 변경.
            
        }
        
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)     // CGSize 메서드를 사용. 이미지 뷰의 프레임 크기를 수정된 너비와 높이로 변경.
        isZoom = !isZoom    // isZoom 변수의 상태를 ! 연산자를 사용하여 반전시킴.
                
    }
    
    // ON/OFF 스위치에 대한 액션 함수
    @IBAction func switchImageOnOff(_ sender: UISwitch) {
        
        if sender.isOn  {   // 만약 스위치가 On의 상태라면
            
            imgView.image = imgOn   // 이미지 뷰의 이미지에 imgOn 이미지 할당.
            
        } else  {   // 만약 스위치가 Off의 상태라면
            
            imgView.image = imgOff  // 이미지 뷰의 이미지에 imgOff 이미지 할당. 
            
        }
        
    }
    
}

