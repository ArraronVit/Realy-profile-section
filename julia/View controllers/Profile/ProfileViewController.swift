//
//  ProfileViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 20.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private var collectionViewDatasource: [Story] = StoriesProvider.get()
    private var tableViewDatasource: [ProfilePost] = ProfilePostsProvider.get()
   
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var profileTableView: UITableView!
    @IBOutlet weak var realitiesAmount: UIButton!
    @IBOutlet weak var followersAmount: UIButton!
    @IBOutlet weak var followingAmount: UIButton!
    @IBOutlet weak var realitiesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var profilePhoto: UIImageView!
    @IBOutlet weak var descriptionText: UITextView!
    @IBOutlet weak var addFriendsButton: RoundedButton!
    @IBOutlet weak var editProfileButton: RoundedButton!
    
    
    @IBOutlet weak var noDataImage: UIImageView!
    @IBOutlet weak var noDataText: UIImageView!
    @IBOutlet weak var createRealityButton: RoundedButton!
    
    @IBAction func followersButtonTapped(_ sender: Any) {
            self.performSegue(withIdentifier: "followersSegue", sender: nil)
    }
    @IBAction func followingButtonTapped(_ sender: Any) {
            self.performSegue(withIdentifier: "followingSegue", sender: nil)
    }
    
    @IBAction func EditProfileButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "editSegue", sender: nil)
    }
    
    @IBAction func createRealityButtonTapped(_ sender: Any) {
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let amountLabelFont = UIFont(name: "AvenirNext-Medium", size: 17)
        let amountDescriptionLabelFont = UIFont(name: "AvenirNext-Medium", size: 15)
        let nameLabelFont = UIFont(name: "AvenirNext-DemiBold", size: 16)
        let descriptionFont = UIFont(name: "AvenirNext-Regular", size: 14)
        let buttonFont = UIFont(name: "AvenirNext-Medium", size: 16)
        
        realitiesAmount.titleLabel?.font = amountLabelFont
        realitiesAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        
        followersAmount.titleLabel?.font = amountLabelFont
        followersAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        followersAmount.setTitle("\(FollowersProvider.get().count)", for: .normal)
        
        followingAmount.titleLabel?.font = amountLabelFont
        followingAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        followingAmount.setTitle("\(FollowersProvider.get().count)", for: .normal)
        
        realitiesLabel.font = amountDescriptionLabelFont
        realitiesLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        followersLabel.font = amountDescriptionLabelFont
        followersLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        followingLabel.font = amountDescriptionLabelFont
        followingLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
        
        nameLabel.font = nameLabelFont
        nameLabel.tintColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        descriptionText.font = descriptionFont
        descriptionText.tintColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        addFriendsButton.titleLabel?.font = buttonFont
        addFriendsButton.setTitleColor(UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1), for: .normal)
        addFriendsButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
        
        editProfileButton.titleLabel?.font = buttonFont
        editProfileButton.setTitleColor(UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1), for: .normal)
        editProfileButton.layer.borderColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 0.41).cgColor
    
        createRealityButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        createRealityButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        createRealityButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        createRealityButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
        
        if collectionViewDatasource.count > 0 && tableViewDatasource.count > 0 {
            storiesCollectionView.isHidden = false
            profileTableView.isHidden = false
            noDataImage.isHidden = true
            noDataText.isHidden = true
            createRealityButton.isHidden = true
        } else {
            storiesCollectionView.isHidden = true
            profileTableView.isHidden = true
            noDataImage.isHidden = false
            noDataText.isHidden = false
            createRealityButton.isHidden = false
        }
        
         title = "mason_m"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if segue.identifier == "followersSegue" {
            
               let followersViewController: FollowersViewController = segue.destination as! FollowersViewController
               followersViewController.followersSegmentCalled = true
               followersViewController.isProfile = true
               followersViewController.title = title
           } else if segue.identifier == "followingSegue" {
          
               let followersViewController: FollowersViewController = segue.destination as! FollowersViewController
               followersViewController.followersSegmentCalled = false
               followersViewController.isProfile = true
               followersViewController.title = title
           } else if segue.identifier == "editSegue" {
               let editProfileViewController: EditProfileViewController = segue.destination as! EditProfileViewController
               editProfileViewController.givenName = nameLabel.text!
               editProfileViewController.givenUsername = title!
               editProfileViewController.givenPhoto = profilePhoto.image!
               editProfileViewController.givenAboutMe = descriptionText.text!
               editProfileViewController.givenPhoneNumber = "+7 (921) 808-57-63"
           }
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
extension ProfileViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return collectionViewDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = storiesCollectionView.dequeueReusableCell(withReuseIdentifier: "storiesCell", for: indexPath) as? StoriesCollectionViewCell
        let story = collectionViewDatasource[indexPath.item]
        cell?.update(text: story.text)
        return cell!
    }
}

extension ProfileViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tableViewDatasource.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ProfileTableViewCell
     //   let title = testAuthor[indexPath.row]
        let post = tableViewDatasource[indexPath.item]
        cell?.accountName.text = nameLabel.text
        cell?.accountPhoto.image = profilePhoto.image
        cell?.update(post: post.photo, time: post.time)
        return cell!
    }
}

