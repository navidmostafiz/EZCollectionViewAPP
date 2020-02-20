//
//  ViewController.swift
//  EZUICollectionAPP
//
//  Created by Navid on 2/20/20.
//  Copyright © 2020 UnitedStar. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, DataPass {

    var users:[User] = []
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //Load UICollectionView cells with dummy user list
        users = getDummyUsers()
        
        //Call API to fetch online user data asynchronously, then reload CV
        let userAPICaller = UserAPICaller()
        userAPICaller.delegate = self
        userAPICaller.getAllUsersFromURL_ASYNC()
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let theUser = users[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "userCell", for: indexPath) as! UserCell
        cell.userLabel.text = theUser.userName
        return cell
    }
    
    func showResultWith(userList: [User]) -> Void {
        users = userList
        collectionView.reloadData()
    }
    
    func getDummyUsers() -> [User] {
        var onlineUsers:[User] = []
        onlineUsers.append(User(userName: "James"))
        onlineUsers.append(User(userName: "Jimmy"))
        onlineUsers.append(User(userName: "Kim"))
        onlineUsers.append(User(userName: "Josh"))
        onlineUsers.append(User(userName: "Cloe"))
        return onlineUsers
    }

}

