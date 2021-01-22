//
//  EditProfileViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 03.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class EditProfileViewController: UIViewController {

    @IBOutlet weak var photo: UIImageView!
    @IBOutlet weak var username: UILabel!
    @IBOutlet weak var usernameInput: UITextField!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var aboutMe: UILabel!
    @IBOutlet weak var aboutMeInput: UITextField!
    @IBOutlet weak var phoneNumber: UILabel!
    @IBOutlet weak var phoneNumberInput: UITextField!
    @IBOutlet weak var changePhoneButton: UIButton!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    public var givenPhoto: UIImage = #imageLiteral(resourceName: "Image-17")
    public var givenName: String = ""
    public var givenUsername: String = ""
    public var givenAboutMe: String = ""
    public var givenPhoneNumber: String = ""
    
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        username.font = UIFont(name: "AvenirNext-Regular", size: 14)
        username.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        usernameInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        usernameInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        usernameInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        name.font = UIFont(name: "AvenirNext-Regular", size: 14)
        name.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        nameInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        nameInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        nameInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        aboutMe.font = UIFont(name: "AvenirNext-Regular", size: 14)
        aboutMe.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        aboutMeInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        aboutMeInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        aboutMeInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        phoneNumber.font = UIFont(name: "AvenirNext-Regular", size: 14)
        phoneNumber.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        phoneNumberInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        phoneNumberInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        phoneNumberInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        changePhoneButton.titleLabel?.font = UIFont(name: "AvenirNext-Regular", size: 14)
        changePhoneButton.setTitleColor(UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1), for: .normal)
        
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
        saveButton.setTitleTextAttributes([NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 17) as Any, NSAttributedString.Key.foregroundColor: UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)], for: .normal)
        // Do any additional setup after loading the view.
        
        usernameInput.text = givenUsername
        nameInput.text = givenName
        aboutMeInput.text = givenAboutMe
        phoneNumberInput.text = givenPhoneNumber
        photo.image = givenPhoto
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
