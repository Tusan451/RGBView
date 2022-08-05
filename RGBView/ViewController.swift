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
            let grayPlaceHolderText = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            redTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    @IBOutlet var greenSlider: UISlider!
    @IBOutlet var greenTextLabel: UILabel!
    @IBOutlet var greenTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            greenTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    @IBOutlet var blueSlider: UISlider!
    @IBOutlet var blueTextLabel: UILabel!
    @IBOutlet var blueTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            blueTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Setup mainView corner radius
        mainView.layer.cornerRadius = 20
        
        mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
        
        redTextField.text = String(redSlider.value)
        greenTextField.text = String(greenSlider.value)
        blueTextField.text = String(blueSlider.value)
        
        redTextLabel.text = String(redSlider.value)
        greenTextLabel.text = String(greenSlider.value)
        blueTextLabel.text = String(blueSlider.value)
        
        addDoneButtonTo(redTextField)
        addDoneButtonTo(greenTextField)
        addDoneButtonTo(blueTextField)
        
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

extension ViewController: UITextFieldDelegate {
    
    // Скрытие клавиатуры нажатием "Done"
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    // Скрытие клавиатуры по тапу
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        super.touchesBegan(touches, with: event)
        
        view.endEditing(true) // Скрывает клавиатуру для любого объекта
    }
    
    // Установка значений после редактирования
    func textFieldDidEndEditing(_ textField: UITextField) {
        guard let text = textField.text else { return }
        
        if let currentValue = Float(text) {
            
            switch textField.tag {
            case 0:
                redSlider.value = currentValue
                redTextLabel.text = String(currentValue)
            case 1:
                greenSlider.value = currentValue
                greenTextLabel.text = String(currentValue)
            case 2:
                blueSlider.value = currentValue
                blueTextLabel.text = String(currentValue)
            default:
                break
            }
            
            mainView.backgroundColor = UIColor(red: CGFloat(redSlider.value), green: CGFloat(greenSlider.value), blue: CGFloat(blueSlider.value), alpha: 1)
            
        } else {
            showAlert(title: "Wrong format", message: "Enter correct value by 0 to 255")
        }
    }
}

extension ViewController {
    
    // Отображение кнопки "Done" на клавиатуре
    private func addDoneButtonTo(_ textField: UITextField) {
        
        let keyboardToolbar = UIToolbar()
        
        textField.inputAccessoryView = keyboardToolbar
        keyboardToolbar.sizeToFit()
        
        let doneButton = UIBarButtonItem(title: "Done",
                                         style: .done,
                                         target: self,
                                         action: #selector(didTapDone))
        
        let flexBarButton = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                            target: nil,
                                            action: nil)
        
        keyboardToolbar.items = [flexBarButton, doneButton]
    }
    
    @objc func didTapDone() {
        view.endEditing(true)
    }
    
    // Отображение предупреждения
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
