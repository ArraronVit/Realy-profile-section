//
//  AccountViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 09.08.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class AccountViewController: UIViewController {

    private var collectionViewDatasource: [Story] = StoriesProvider.get()
    private var tableViewDatasource: [ProfilePost] = ProfilePostsProvider.get()
    
    @IBOutlet weak var accountImage: UIImageView!
    @IBOutlet weak var fullNameLabel: UILabel!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var accountActionsButton: UIBarButtonItem!
    
    @IBOutlet weak var realitiesAmount: UIButton!
    @IBOutlet weak var followersAmount: UIButton!
    @IBOutlet weak var followingAmount: UIButton!
    
    @IBOutlet weak var realitiesLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    
    @IBOutlet weak var noDataImage: UIImageView!
    @IBOutlet weak var noDataText: UIImageView!
    @IBOutlet weak var createRealityButton: RoundedButton!
    
    @IBOutlet weak var descriptionText: UITextView!
    
    @IBOutlet weak var followButton: RoundedButton!
    @IBOutlet weak var messageButton: RoundedButton!
    
    @IBOutlet weak var storiesCollectionView: UICollectionView!
    @IBOutlet weak var accountTableView: UITableView!
    
    @IBAction func backButtonTapped(_ sender: Any) {
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func followersButtonTapped(_ sender: Any) {
         self.performSegue(withIdentifier: "accountFollowersSegue", sender: nil)
    }
    
    @IBAction func followingButtonTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "accountFollowingSegue", sender: nil)
    }
    
    var photo: UIImage = #imageLiteral(resourceName: "Image-17")
    var fullName: String = ""
    var nickName: String = ""
    var flag: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        accountImage.image = photo
        fullNameLabel.text = fullName
        
        realitiesAmount.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 17)
        realitiesAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
            
        followersAmount.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 17)
        followersAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        followersAmount.setTitle("\(FollowersProvider.get().count)", for: .normal)
            
        followingAmount.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 17)
        followingAmount.tintColor = UIColor(red: 0.2, green: 0.196, blue: 0.239, alpha: 1)
        followingAmount.setTitle("\(FollowersProvider.get().count)", for: .normal)
            
        realitiesLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)
        realitiesLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
            
        followersLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)
        followersLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
            
        followingLabel.font = UIFont(name: "AvenirNext-Medium", size: 15)
        followingLabel.tintColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1)
            
        fullNameLabel.font = UIFont(name: "AvenirNext-DemiBold", size: 16)
        fullNameLabel.tintColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
            
        descriptionText.font = UIFont(name: "AvenirNext-Regular", size: 14)
        descriptionText.tintColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
          
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        accountActionsButton.tintColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        
        isFollower(flag)
            
        messageButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
        messageButton.setTitleColor(UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1), for: .normal)
        messageButton.layer.borderColor = UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 0.41).cgColor
        
        createRealityButton.titleLabel?.font = UIFont(name: "AvenirNext-DemiBold", size: 18)
        createRealityButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        createRealityButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        createRealityButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
            
        if collectionViewDatasource.count > 0 && tableViewDatasource.count > 0 {
            storiesCollectionView.isHidden = false
            accountTableView.isHidden = false
            noDataImage.isHidden = true
            noDataText.isHidden = true
            createRealityButton.isHidden = true
        } else {
            storiesCollectionView.isHidden = true
            accountTableView.isHidden = true
            noDataImage.isHidden = false
            noDataText.isHidden = false
            createRealityButton.isHidden = false
        }
        
        title = nickName
        // Do any additional setup after loading the view.
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "accountFollowersSegue" {
          
             let followersViewController: FollowersViewController = segue.destination as! FollowersViewController
             followersViewController.followersSegmentCalled = true
             followersViewController.isProfile = false
             followersViewController.title = title
         } else if segue.identifier == "accountFollowingSegue" {
        
             let followersViewController: FollowersViewController = segue.destination as! FollowersViewController
             followersViewController.followersSegmentCalled = false
             followersViewController.isProfile = false
             followersViewController.title = title
         } 
    }
    
   private func isFollower(_ followingMode: Bool) {
        if followingMode {
            followButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            followButton.setTitleColor(UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1), for: .normal)
            followButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
            followButton.setTitle("Following", for: .normal)
        } else {
            followButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            followButton.setTitleColor(UIColor(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
            followButton.layer.borderColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1).cgColor
            followButton.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
            followButton.setTitle("Follow", for: .normal)
        }
    }
}

extension AccountViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
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

extension AccountViewController: UITableViewDataSource, UITableViewDelegate {
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
           cell?.accountName.text = fullNameLabel.text
           cell?.accountPhoto.image = accountImage.image
           cell?.update(post: post.photo, time: post.time)
           return cell!
    }
    
    
}
