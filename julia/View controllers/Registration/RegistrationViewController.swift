//
//  ViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 13.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class RegistrationViewController: UIViewController {

    var nameIsCorrect: Bool = false
    var usernameIsCorrect: Bool = false
    
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var usernameLabel: UILabel!
    
    @IBOutlet weak var doneButton: RoundedButton!
    
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var usernameInput: UITextField!
    @IBAction func doneButtonTapped(_ sender: Any) {
        
    }
    
    @IBAction func nameChanched(_ sender: Any) {
        if nameInput.text != "" {
            nameIsCorrect = true
        } else {
            nameInput.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 0.1)
        }
        if nameIsCorrect && usernameIsCorrect {
            doneButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
            doneButton.borderColor = .clear
        }
    }
    
    @IBAction func usernameChanched(_ sender: Any) {
        if usernameInput.text != "" {
            usernameIsCorrect = true
        } else {
            usernameInput.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 0.1)
        }
        if nameIsCorrect && usernameIsCorrect {
            doneButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
             doneButton.borderColor = .clear
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let regularParameterFont = UIFont(name: "AvenirNext-Regular", size: 14)
        let regularInputFont = UIFont(name: "AvenirNext-Regular", size: 16)
        let regularButtonFont = UIFont(name: "AvenirNext-Regular", size: 18)
        
        nameLabel.font = regularParameterFont
        nameLabel.textColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        usernameLabel.font = regularParameterFont
        usernameLabel.textColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        nameInput.font = regularInputFont
        nameInput.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        nameInput.layer.cornerRadius = 8
        nameInput.layer.borderWidth = 0.5
        nameInput.layer.borderColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1).cgColor
        nameInput.textColor = .white
        nameInput.attributedPlaceholder = NSAttributedString(string: "Enter your name",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)])
        
        usernameInput.font = regularInputFont
        usernameInput.backgroundColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        usernameInput.layer.cornerRadius = 8
        usernameInput.layer.borderWidth = 0.5
        usernameInput.layer.borderColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1).cgColor
        usernameInput.textColor = .white
        usernameInput.attributedPlaceholder = NSAttributedString(string: "Enter your username",
      attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)])
        
        doneButton.titleLabel?.font = regularButtonFont
        
        // Do any additional setup after loading the view.
    }


}

