//
//  ViewController.swift
//  UpdownGame
//
//  Created by MAC on 2023/02/25.
//  커밋 테스트입니다
//

import UIKit

class ViewController: UIViewController {
    var randomValue: Int = 0
    var tryCount: Int = 0
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var minValueLabel: UILabel!
    @IBOutlet weak var maxValueLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.setThumbImage(#imageLiteral(resourceName:"slider_thumb.png"), for: .normal)
        reset()
    }
    
   
    
    // 슬라이더 밸류 체인지 함수
    @IBAction func sliderVaueChanged(_ sender: UISlider){
        //슬라이더 값 찍어보기
        print("슬라인더 값: \(sender.value)")
        let integerVale = Int(sender.value)
        sliderValueLabel.text  = String(integerVale)
    }
    
    func showAlert(message: String){
        
        let alert = UIAlertController(title: nil,
                                      message: message,
                                      preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { action in self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    
    @IBAction func touchUpHitButton(_ sender: UIButton){
        print("HIT 값: \(slider.value)")
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount)/5"
        
        if randomValue == hitValue{
            showAlert(message: "YOU WIN!!")
            reset()
        } else if tryCount >= 5{
            showAlert(message: "YOU LOSE...")
            reset()
        } else if randomValue > hitValue{
            minValueLabel.text = String(hitValue)
            slider.minimumValue = Float(hitValue)
        } else {
            maxValueLabel.text = String(hitValue)
            slider.maximumValue = Float(hitValue)
        }
        
    }
    
    @IBAction func touchUpResetButton(_ sender: UIButton){
        reset()
    }
    
    func reset(){
        randomValue = Int.random(in: 0...30)//범위 연산자
        print(randomValue)
        tryCount = 0
        tryCountLabel.text = "0/5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minValueLabel.text = "0"
        maxValueLabel.text = "30"
        sliderValueLabel.text = "15"
    }
}


