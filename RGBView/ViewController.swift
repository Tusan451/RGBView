//
//  ViewController.swift
//  RGBView
//
//  Created by Olegio on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redSlider: UISlider!
    @IBOutlet var redTextLabel: UILabel!
    @IBOutlet var redTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            redTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextLabel: UILabel!
    @IBOutlet var greenTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            greenTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextLabel: UILabel!
    @IBOutlet var blueTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            blueTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Setup mainView corner radius
        mainView.layer.cornerRadius = 20
    }
    
    @IBAction func redSliderChanged(_ sender: UISlider) {
        let redValue = Int(redSlider.value)
        let greenValue = Int(greenSlider.value)
        let blueValue = Int(blueSlider.value)
        
        redTextLabel.text = String(redValue)
        redTextField.text = String(redValue)
        
        mainView.backgroundColor = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
    }
    
    @IBAction func greenSliderChanged(_ sender: UISlider) {
        let redValue = Int(redSlider.value)
        let greenValue = Int(greenSlider.value)
        let blueValue = Int(blueSlider.value)
        
        greenTextLabel.text = String(greenValue)
        greenTextField.text = String(greenValue)
        
        mainView.backgroundColor = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
    }
    
    @IBAction func blueSliderChanged(_ sender: UISlider) {
        let redValue = Int(redSlider.value)
        let greenValue = Int(greenSlider.value)
        let blueValue = Int(blueSlider.value)
        
        blueTextLabel.text = String(blueValue)
        blueTextField.text = String(blueValue)
        
        mainView.backgroundColor = UIColor(red: CGFloat(redValue) / 255, green: CGFloat(greenValue) / 255, blue: CGFloat(blueValue) / 255, alpha: 1)
    }
}

