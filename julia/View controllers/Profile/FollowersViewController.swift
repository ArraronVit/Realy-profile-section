//
//  FollowersViewController.swift
//  julia
//
//  Created by Vitaly Kozlov on 23.07.2020.
//  Copyright © 2020 Vitaly Kozlov. All rights reserved.
//

import UIKit

class FollowersViewController: UIViewController {

    var followersSegmentCalled: Bool = true
    var isProfile: Bool = true
    private var selectedPerson = Follower(photo: #imageLiteral(resourceName: "Image-12"), nickName: "", fullName: "")
    
    private var followingTableViewDatasource: [Follower] = FollowersProvider.get()
    private var followersTableViewDatasource: [Follower] = FollowersProvider.get()
    private var recommendedDatasource: [Follower] = FollowersProvider.get()
    
    @IBOutlet weak var rightLine: UILabel!
    @IBOutlet weak var leftLine: UILabel!
    
    @IBOutlet weak var followersView: UIView!
    
    @IBOutlet weak var followersTableView: UITableView!
    
    @IBOutlet weak var recommendedLabel: UILabel!
    @IBOutlet weak var recomendationCollectionView: UICollectionView!
    
    @IBOutlet weak var followingView: UIView!
    @IBOutlet weak var followingTableView: UITableView!
    
    @IBOutlet weak var emptyView: UIView!
    @IBOutlet weak var emptyRecommendedLabel: UILabel!
    @IBOutlet weak var emptyCollectionView: UICollectionView!
    @IBOutlet weak var smileButton: UIButton!
    @IBOutlet weak var inviteFriendsButton: UIButton!
    @IBOutlet weak var addContactsIcon: UIButton!
    @IBOutlet weak var addContacts: UIButton!
    @IBOutlet weak var facebookIcon: UIButton!
    @IBOutlet weak var addFriendsFromFacebookButton: UIButton!
    
    
    @IBOutlet weak var accountEmptyView: UIView!
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var backButton: UIBarButtonItem!
    
    @IBAction func categoryChanged(_ sender: Any) {
        switch segmentedControl.selectedSegmentIndex {
        case 0:
            setupSegment(first: true)
        case 1:
            setupSegment(first: false)
        default:
            setupSegment(first: true)
        }
    }
    
    @IBAction func backButtonTapped(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    private var isFollowingActive: Bool {
        !followingView.isHidden && followersView.isHidden
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.tintColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
        segmentedControl.setTitle("\(followersTableViewDatasource.count) Followers", forSegmentAt: 0)
        segmentedControl.setTitle("\(followingTableViewDatasource.count) Following", forSegmentAt: 1)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if followersSegmentCalled {
            setupSegment(first: true)
        } else {
           setupSegment(first: false)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "followerAccountSegue" {
            let accountViewController: AccountViewController = segue.destination as! AccountViewController
            accountViewController.photo = selectedPerson.photo
            accountViewController.fullName = selectedPerson.fullName
            accountViewController.nickName = selectedPerson.nickName
            accountViewController.flag = false
        } else if segue.identifier == "followingAccountSegue" {
            let accountViewController: AccountViewController = segue.destination as! AccountViewController
            accountViewController.photo = selectedPerson.photo
            accountViewController.fullName = selectedPerson.fullName
            accountViewController.nickName = selectedPerson.nickName
            accountViewController.flag = true
        }
    }
    
    private func setupSegment(first: Bool) {
        if isProfile {
           if first {
               if followersTableViewDatasource.count > 0 {
                  setupFollowersSection()
               } else {
                  followersSectionEmpty()
               }
           } else {
               if followingTableViewDatasource.count > 0 {
                   setupFollowingSection()
               } else {
                   followingSectionEmpty()
               }
           }
        } else {
            if first {
                if followersTableViewDatasource.count > 0 {
                   setupFollowersSection()
                } else {
                   accountFollowersSectionEmpty()
                }
            } else {
                if followingTableViewDatasource.count > 0 {
                    setupFollowingSection()
                } else {
                    accountFollowingSectionEmpty()
                }
            }
        }
    }

    private func setupFollowersSection() {
               accountEmptyView.isHidden = true
               emptyView.isHidden = true
               followersView.isHidden = false
               followingView.isHidden = true
                      
               segmentedControl.selectedSegmentTintColor = .white
               segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any], for: .normal)
               segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any], for: .selected)
                   
               leftLine.isHidden = false
               rightLine.isHidden = true
               leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
               rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
                   
               segmentedControl.setTitle("\(followersTableViewDatasource.count) Followers", forSegmentAt: 0)
               segmentedControl.setTitle("\(followingTableViewDatasource.count) Following", forSegmentAt: 1)
                      
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func setupFollowingSection() {
        accountEmptyView.isHidden = true
            emptyView.isHidden = true
            followersView.isHidden = true
            followingView.isHidden = false
        
            segmentedControl.selectedSegmentTintColor = .white
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.478, green: 0.525, blue: 0.604, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any], for: .normal)
            segmentedControl.setTitleTextAttributes([NSAttributedString.Key.backgroundColor: UIColor(red: 0, green: 0, blue: 0, alpha: 0), NSAttributedString.Key.foregroundColor: UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1), NSAttributedString.Key.font: UIFont(name: "AvenirNext-Medium", size: 16) as Any], for: .selected)
         
            leftLine.isHidden = true
            rightLine.isHidden = false
            rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
            leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        
            segmentedControl.setTitle("\(followersTableViewDatasource.count) Followers", forSegmentAt: 0)
            segmentedControl.setTitle("\(followingTableViewDatasource.count) Following", forSegmentAt: 1)
        
            segmentedControl.selectedSegmentIndex = 1
    }
    
    private func followersSectionEmpty() {
            emptyView.isHidden = false
            accountEmptyView.isHidden = true
            followersView.isHidden = true
            followingView.isHidden = true
            emptyRecommendedLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
            emptyRecommendedLabel.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
            inviteFriendsButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            inviteFriendsButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            addContacts.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            addContacts.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            addFriendsFromFacebookButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            addFriendsFromFacebookButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            leftLine.isHidden = false
            rightLine.isHidden = true
            rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
            leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
                       
            segmentedControl.setTitle("0 Followers", forSegmentAt: 0)
        //    segmentedControl.setTitle("0 Following", forSegmentAt: 1)
            segmentedControl.selectedSegmentIndex = 0
    }
    private func followingSectionEmpty() {
            emptyView.isHidden = false
            accountEmptyView.isHidden = true
            followersView.isHidden = true
            followingView.isHidden = true
            emptyRecommendedLabel.font = UIFont(name: "AvenirNext-Medium", size: 16)
            emptyRecommendedLabel.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
            inviteFriendsButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            inviteFriendsButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            addContacts.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            addContacts.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            addFriendsFromFacebookButton.titleLabel?.font = UIFont(name: "AvenirNext-Medium", size: 16)
            addFriendsFromFacebookButton.setTitleColor(UIColor(red: 0, green: 0, blue: 0, alpha: 1), for: .normal)
                       
            leftLine.isHidden = true
            rightLine.isHidden = false
            rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
            leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
                       
          //  segmentedControl.setTitle("0 Followers", forSegmentAt: 0)
            segmentedControl.setTitle("0 Following", forSegmentAt: 1)
            segmentedControl.selectedSegmentIndex = 1
    }
    
    private func accountFollowersSectionEmpty() {
        emptyView.isHidden = true
        accountEmptyView.isHidden = false
        followersView.isHidden = true
        followingView.isHidden = true
        
        leftLine.isHidden = false
        rightLine.isHidden = true
        rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
                   
        segmentedControl.setTitle("0 Followers", forSegmentAt: 0)
       // segmentedControl.setTitle("0 Following", forSegmentAt: 1)
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func accountFollowingSectionEmpty() {
        emptyView.isHidden = true
        accountEmptyView.isHidden = false
        followersView.isHidden = true
        followingView.isHidden = true
            
        leftLine.isHidden = true
        rightLine.isHidden = false
        rightLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
        leftLine.backgroundColor = UIColor(red: 0.992, green: 0.161, blue: 0.353, alpha: 1)
                       
       // segmentedControl.setTitle("0 Followers", forSegmentAt: 0)
        segmentedControl.setTitle("0 Following", forSegmentAt: 1)
        segmentedControl.selectedSegmentIndex = 1
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
extension FollowersViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case followingTableView:
            return followingTableViewDatasource.count
        case followersTableView:
            return  followersTableViewDatasource.count
        default:
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch tableView {
        case followingTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FollowingCell", for: indexPath) as! FollowingTableViewCell
            let follower = followingTableViewDatasource[indexPath.item]
            
            cell.update(avatar: follower.photo, nick: follower.nickName, name: follower.fullName)
            return cell
        case followersTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "FollowersCell", for: indexPath) as! FollowersTableViewCell
            let follower = followersTableViewDatasource[indexPath.item]
            
            cell.update(avatar: follower.photo, nick: follower.nickName, name: follower.fullName)
            return cell
        default:
            return UITableViewCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch tableView {
        case followingTableView:
            let cell = followingTableViewDatasource[indexPath.item]
            selectedPerson = Follower(photo: cell.photo, nickName: cell.nickName, fullName: cell.fullName)
            performSegue(withIdentifier: "followingAccountSegue", sender: nil)
        case followersTableView:
            let cell = followersTableViewDatasource[indexPath.item]
            selectedPerson = Follower(photo: cell.photo, nickName: cell.nickName, fullName: cell.fullName)
             performSegue(withIdentifier: "followerAccountSegue", sender: nil)
        default:
            print("sss")
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 95
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 50))

        let label = UILabel()
        label.frame = CGRect.init(x: 5, y: 5, width: headerView.frame.width-10, height: headerView.frame.height-10)
        switch tableView {
        case followingTableView:
            label.text = "Following"
        case followersTableView:
            label.text = "Followers"
        default:
            label.text = "Followers"
        }
       // label.text = "Followers"
        label.font = UIFont(name: "AvenirNext-Medium", size: 16)
        label.textColor = UIColor(red: 0.126, green: 0.119, blue: 0.16, alpha: 1)
        headerView.addSubview(label)

        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 10.0
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return UIView()
    }
}

extension FollowersViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        recommendedDatasource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = recomendationCollectionView.dequeueReusableCell(withReuseIdentifier: "RecomendationCell", for: indexPath) as? RecomendationCollectionViewCell
        let recomendation = recommendedDatasource[indexPath.item]
        cell?.update(avatar: recomendation.photo, nick: recomendation.nickName, name: recomendation.fullName)
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         let cell = recommendedDatasource[indexPath.item]
         selectedPerson = Follower(photo: cell.photo, nickName: cell.nickName, fullName: cell.fullName)
         performSegue(withIdentifier: "followerAccountSegue", sender: nil)
    }
    
}
