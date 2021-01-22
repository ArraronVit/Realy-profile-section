//
//  AddFriendsViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 31.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class AddFriendsViewController: UIViewController {

    private var recommendedDatasource: [Follower] = FollowersProvider.get()
    var profileViewControllerCalled: Bool = false
    
    @IBOutlet weak var recommended: UILabel!
    @IBOutlet weak var smile: UIButton!
    @IBOutlet weak var inviteFriends: UIButton!
    @IBOutlet weak var addContactsIcon: UIButton!
    @IBOutlet weak var addContacts: UIButton!
    @IBOutlet weak var facebook: UIButton!
    @IBOutlet weak var addFriendsFromFacebook: UIButton!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBOutlet weak var recomendationCollectionView: UICollectionView!
    
    @IBAction func smileTapped(_ sender: Any) {
    }
    
    @IBAction func inviteFriendsTapped(_ sender: Any) {
    }
    
    @IBAction func addContactsIconTapped(_ sender: Any) {
    }
    
    @IBAction func addContactsTapped(_ sender: Any) {
    }
    
    @IBAction func facebookTapped(_ sender: Any) {
    }
    
    @IBAction func addFriendsFromFacebookTapped(_ sender: Any) {
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
            self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        recommended.font = UIFont(name: "AvenirNext-Medium", size: 16)
        recommended.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        inviteFriends.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        inviteFriends.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        addContacts.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        addContacts.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
        addFriendsFromFacebook.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        addFriendsFromFacebook.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
        
       backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        // Do any additional setup after loading the view.
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if profileViewControllerCalled {
            viewDidLoad()
        }
    }
}

extension AddFriendsViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recommendedDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recomendationCollectionView.dequeueReusableCell(withReuseIdentifier: "AddFriendsCell", for: indexPath) as? AddFriendsCollectionViewCell
        let recomendation = recommendedDatasource[indexPath.item]
        cell?.update(avatar: recomendation.photo, nick: recomendation.nickName, name: recomendation.fullName)
        return cell!
    }
}
