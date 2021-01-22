//
//  ChangeNumberDescriptionViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 04.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class ChangeNumberDescriptionViewController: UIViewController {

    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var changeNumber: RoundedButton!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func changeButtonTapped(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()

         backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
         changeNumber.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
         changeNumber.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
         changeNumber.setTitleColor(.white, for: .normal)
         changeNumber.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
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
