//
//  ConfirmationViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 06.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class ConfirmationViewController: UIViewController {

    @IBOutlet weak var confirmCode: UILabel!
    @IBOutlet weak var codeInput: UITextField!
    @IBOutlet weak var resendCode: UIButton!
    @IBOutlet weak var timer: UILabel!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBAction func codeInputTapped(_ sender: Any) {
    }
    @IBAction func resendCodeTapped(_ sender: Any) {
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confirmCode.font = UIFont(name: "AvenirNext-DemiBold", size: 22)
        confirmCode.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        codeInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        codeInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        codeInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        codeInput.attributedPlaceholder = NSAttributedString(string: "Enter code via SMS",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)])
        
        
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
        resendCode.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 14)
        resendCode.setTitleColor(UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1), for: .normal)
        resendCode.backgroundColor = .white
        
        timer.font = UIFont(name: "AvenirNext-Regular", size: 14)
        timer.textColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
