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
    
    @IBOutlet var greenTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            greenTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
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
        let sliderValue = Int(redSlider.value)
        redTextLabel.text = String(sliderValue)
        redTextField.text = String(sliderValue)
        
        mainView.backgroundColor = UIColor(red: CGFloat(sliderValue) / 255, green: 0, blue: 0, alpha: 1)
    }
    
}

