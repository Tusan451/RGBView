//
//  ViewController.swift
//  RGBView
//
//  Created by Olegio on 02.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var mainView: UIView!
    
    @IBOutlet var redTextField: UITextField! {
        didSet {
            let grayPlaceHolderText = NSAttributedString(string: "0.00", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
            
            redTextField.attributedPlaceholder = grayPlaceHolderText
        }
    }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        mainView.layer.cornerRadius = 20

        
        
    }


}

