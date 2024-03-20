//
//  ViewController.swift
//  TP_ColorMixer
//
//  Created by ESTS on 2/22/24.
//

import UIKit

class ViewController: UIViewController {
    
    var Red : Int = 0
    var Green : Int = 0
    var Blue : Int = 0
    
    @IBOutlet weak var PrevView: UIView!
    
    @IBOutlet weak var BefPrevView: UIView!
    
    @IBOutlet weak var CurrentView: UIView!
    
    @IBOutlet weak var RedLabel: UILabel!
    
    @IBOutlet weak var RedSlider: UISlider!
    
    @IBOutlet weak var GreenLabel: UILabel!
    
    @IBOutlet weak var GreenSlider: UISlider!
    
    @IBOutlet weak var BlueLabel: UILabel!
    
    @IBOutlet weak var BlueSlider: UISlider!
    
    @IBOutlet weak var SaveButton: UIButton!
    
    @IBOutlet weak var BackToZeroButton: UIButton!
    
    @IBOutlet weak var StepSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func redSliderValueChanged(_ sender: Any) {
        
        Red = Int(RedSlider.value)
        RedLabel.text = "R = \(Red)"
        
    }
    
    @IBAction func greenSliderValueChanged(_ sender: Any) {
        
        Green = Int(GreenSlider.value)
        GreenLabel.text = "G = \(Green)"
    }
    
    
    @IBAction func blueSliderValueChanged(_ sender: Any) {
        
        Blue = Int(BlueSlider.value)
        BlueLabel.text = "B = \(Blue)"
    }
    
    
    @IBAction func saveButtonPressed(_ sender: Any) {
        
        BefPrevView.backgroundColor = PrevView.backgroundColor
           
           PrevView.backgroundColor = CurrentView.backgroundColor
           
        let redColor = CGFloat(Red) / 100
        let greenColor = CGFloat(Green) / 100
        let blueColor = CGFloat(Blue) / 100
           
        let color = UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1.0)
           
        CurrentView.backgroundColor = color
        
    }
    
    @IBAction func backToZeroBtnPressed(_ sender: Any) {
        
        Blue = 0
        Green = 0
        Red = 0
        RedSlider.value = 0
        GreenSlider.value = 0
        BlueSlider.value = 0
        
        if #available(iOS 13.0, *) {
            BefPrevView.backgroundColor = UIColor.systemGray4
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            PrevView.backgroundColor = UIColor.systemGray4
        } else {
            // Fallback on earlier versions
        }
        
        if #available(iOS 13.0, *) {
            CurrentView.backgroundColor = UIColor.systemGray4
        } else {
            // Fallback on earlier versions
        }
    }

    
    @IBAction func switchPressed(_ sender: Any) {
        
        if StepSwitch.isOn {
            let stepValue: Float = 10.0
            let minValue: Float = 0.0
            let maxValue: Float = 100.0
            let numberOfSteps = Int((maxValue - minValue) / stepValue)
            RedSlider.minimumValue = minValue
            RedSlider.maximumValue = Float(numberOfSteps)
            RedSlider.isContinuous = false
            RedSlider.setValue(minValue, animated: false)
            GreenSlider.minimumValue = minValue
            GreenSlider.maximumValue = Float(numberOfSteps)
            GreenSlider.isContinuous = false
            GreenSlider.setValue(minValue, animated: false)
            BlueSlider.minimumValue = minValue
            BlueSlider.maximumValue = Float(numberOfSteps)
            BlueSlider.isContinuous = false
            BlueSlider.setValue(minValue, animated: false)
        }else {
            
            RedSlider.minimumValue = 0
            RedSlider.maximumValue = 100
            RedSlider.isContinuous = true
            RedSlider.setValue(RedSlider.value, animated: false)
                   
            GreenSlider.minimumValue = 0
            GreenSlider.maximumValue = 100
            GreenSlider.isContinuous = true
            GreenSlider.setValue(GreenSlider.value, animated: false)
                   
            BlueSlider.minimumValue = 0
            BlueSlider.maximumValue = 100
            BlueSlider.isContinuous = true
            BlueSlider.setValue(BlueSlider.value, animated: false)
        }
    }
    
}



