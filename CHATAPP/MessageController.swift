//
//  ViewController.swift
//  CHATAPP
//
//  Created by Vijayanadk on 8/11/17.
//  Copyright © 2017 Vijayanadk. All rights reserved.
//

import UIKit
import Firebase

class MessageController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
             view.backgroundColor = UIColor.yellow
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(handleLogout))
        
        let image = UIImage(named: "new_message_icon")
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: image, style: .plain, target: self, action: #selector(handleNewMessage))
        //user is not logged in
        checkIfUserIsLoggedIn()
    }
    func handleNewMessage() {
       let newMessageController = NewMessageController()
        let nav = UINavigationController(rootViewController: newMessageController)
        present(nav, animated: true, completion: nil)
    }
    func checkIfUserIsLoggedIn() {
        if Auth.auth().currentUser?.uid == nil {
            perform(#selector(handleLogout), with: nil, afterDelay: 0)
        }
        else {
           let uid = Auth.auth().currentUser?.uid
            
            Database.database().reference().child("user1").child(uid!).observe(.value, with: { (snapshot) in

                if let dictionary = snapshot.value as? [String:Any] {
                    self.navigationItem.title = dictionary["name"] as? String
                }
                
            }, withCancel: nil)
        }
    }

    func handleLogout() {
        do {
            try Auth.auth().signOut()
        }
            catch let logoutError {
                print(logoutError)
            }
        let loginController = LoginController()
        present(loginController, animated: true, completion: nil)    }
   }
