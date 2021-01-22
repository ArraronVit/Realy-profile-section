//
//  NewRealityViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 30.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class NewRealityViewController: UIViewController {

    private var sendToTableViewDatasource: [SendTo] = SendToProvider.get()
    private var suggestedTableViewDatasource: [Suggested] = SuggestedProvider.get()
    
    @IBOutlet weak var realityPhoto: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var nameInput: UITextField!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionInput: UITextField!
    @IBOutlet weak var sendToLabel: UILabel!
    @IBOutlet weak var addPersonButton: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    @IBOutlet weak var realitiesTableView: UITableView!
    
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    @IBAction func saveButtonTapped(_ sender: Any) {
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        nameLabel.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        nameInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        nameInput.attributedPlaceholder = NSAttributedString(string: "Name your reality",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)])
        nameInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        nameInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        descriptionLabel.font = UIFont(name: "AvenirNext-Regular", size: 14)
        descriptionLabel.textColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        descriptionInput.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        descriptionInput.attributedPlaceholder = NSAttributedString(string: "describe your reality, add #tags (optional)",
        attributes: [NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)])
        descriptionInput.font = UIFont(name: "AvenirNext-Regular", size: 16)
        descriptionInput.backgroundColor = UIColor(red: 0.961, green: 0.965, blue: 0.973, alpha: 1)
        
        sendToLabel.font = UIFont(name: "AvenirNext-Medium", size: 17)
        sendToLabel.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
        
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
        saveButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        // Do any additional setup after loading the view.
    }
    

}

extension NewRealityViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
           return sendToTableViewDatasource.count
        } else {
           return suggestedTableViewDatasource.count
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if section == 1 {
           let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 55))
           let label = UILabel()
           label.frame = CGRect.init(x: 0, y: 0, width: headerView.frame.width-10, height: headerView.frame.height-10)
           label.font = UIFont(name: "AvenirNext-Medium", size: 17)
           label.textColor = UIColor(red: 0, green: 0, blue: 0, alpha: 1)
           label.text = "    Suggested"
           return label
        } else {
            let view = UIView()
            view.frame = CGRect(x: 0, y: 0, width: 0, height: 0)
           return view
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! RealityTableViewCell
      
        if indexPath.section == 0 {
            let sendTo = sendToTableViewDatasource[indexPath.item]
            cell.update(photo: sendTo.photo, realityName: sendTo.name , description: sendTo.description )
            return cell
        } else {
            let suggested = suggestedTableViewDatasource[indexPath.item]
            cell.update(photo: suggested.photo, realityName: suggested.name, description: suggested.description)
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}
