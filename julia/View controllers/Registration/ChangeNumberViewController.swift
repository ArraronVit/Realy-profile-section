//
//  ChangeNumberViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 04.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit
import MRCountryPicker

class ChangeNumberViewController: UIViewController {

  //  private var countryCode = ""
    
    @IBOutlet weak var newPhoneNumber: UILabel!
    @IBOutlet weak var newPhoneNumberInput: UITextField!
    @IBOutlet weak var nextButton: RoundedButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var flag: UIImageView!
    
    @IBOutlet weak var countryPicker: MRCountryPicker!
    
    @IBOutlet weak var flagBackground: UITextField!
    
    @IBAction func flagTapped(_ sender: Any) {
        countryPicker.isHidden = false
    }
    
    @IBAction func phoneInputTapped(_ sender: Any) {
        countryPicker.isHidden = true
        if newPhoneNumberInput.text!.count > 15 {
           nextButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
           nextButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
           nextButton.setTitleColor(.white, for: .normal)
           nextButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        } else {
            nextButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 18)
            nextButton.layer.borderColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1).cgColor
            nextButton.setTitleColor(UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1), for: .normal)
            nextButton.backgroundColor = .white
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func nextButtonTapped(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        newPhoneNumber.font = UIFont(name: "AvenirNext-DemiBold", size: 22)
        newPhoneNumber.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        newPhoneNumberInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        newPhoneNumberInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        newPhoneNumberInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
        nextButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 18)
        nextButton.layer.borderColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1).cgColor
        nextButton.setTitleColor(UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1), for: .normal)
        nextButton.backgroundColor = .white
        
        flagBackground.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        countryPicker.countryPickerDelegate = self
        countryPicker.showPhoneNumbers = true
        countryPicker.isHidden = true
        
        // Do any additional setup after loading the view.
    }
}

extension ChangeNumberViewController: MRCountryPickerDelegate {
    
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
        self.flag.image = flag
       // self.countryCode = countryCode
        newPhoneNumberInput.text = ""
        newPhoneNumberInput.text?.append(phoneCode)
    }
}
