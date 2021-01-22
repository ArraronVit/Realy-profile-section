//
//  RegistrationConfirmViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 07.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit
import MRCountryPicker

class RegistrationConfirmViewController: UIViewController {

    @IBOutlet weak var welcome: UILabel!
    
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var flagBackground: UITextField!
    
    @IBOutlet weak var flag: UIImageView!
    
    @IBOutlet weak var confirmButton: RoundedButton!
    
    @IBOutlet weak var countryPicker: MRCountryPicker!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func flagTapped(_ sender: Any) {
         countryPicker.isHidden = false
         flagBackground.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
         flagBackground.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
         flagBackground.layer.cornerRadius = 8
         flagBackground.layer.borderWidth = 0.5
    }
    
    @IBAction func phoneNumberTapped(_ sender: Any) {
        countryPicker.isHidden = true
               if phoneNumberInput.text!.count > 15 {
                     phoneNumberInput.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                     phoneNumberInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
                     phoneNumberInput.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
                     phoneNumberInput.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
                     phoneNumberInput.layer.cornerRadius = 8
                     phoneNumberInput.layer.borderWidth = 0.5
               } else {
                     phoneNumberInput.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
                     phoneNumberInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
                     phoneNumberInput.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 0.1)
                     phoneNumberInput.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
                     phoneNumberInput.layer.cornerRadius = 8
                     phoneNumberInput.layer.borderWidth = 0.5
               }
    }
    
    @IBAction func confirmButtonTapped(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
               let secondVC = storyboard.instantiateViewController(identifier: "TabBarVC")
               
               secondVC.modalPresentationStyle = .fullScreen
               secondVC.modalTransitionStyle = .crossDissolve
               
               present(secondVC, animated: true, completion: nil)
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
             navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
               super.viewDidLoad()

               welcome.font = UIFont(name: "AvenirNext-DemiBold", size: 22)
               welcome.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
               
               phoneNumberInput.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
               phoneNumberInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
               phoneNumberInput.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
               phoneNumberInput.layer.borderWidth = 0.5
               phoneNumberInput.layer.borderColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1).cgColor
               phoneNumberInput.layer.cornerRadius = 8
        
               backButton.tintColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1)
               
               confirmButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 18)
               confirmButton.layer.borderColor = UIColor(red: 1, green: 1, blue: 1, alpha: 1).cgColor
               confirmButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
               confirmButton.backgroundColor = .clear
               confirmButton.borderWidth = 1
               
               flagBackground.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
               
               countryPicker.countryPickerDelegate = self
               countryPicker.showPhoneNumbers = true
               countryPicker.isHidden = true
        
        
        // Do any additional setup after loading the view.
    }

}
extension RegistrationConfirmViewController: MRCountryPickerDelegate {
  
    func countryPhoneCodePicker(_ picker: MRCountryPicker, didSelectCountryWithName name: String, countryCode: String, phoneCode: String, flag: UIImage) {
               self.flag.image = flag
              // self.countryCode = countryCode
               phoneNumberInput.text = ""
               phoneNumberInput.text?.append(phoneCode)
    }
}
