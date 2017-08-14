//
//  NewMessageControllerTableViewController.swift
//  CHATAPP
//
//  Created by Vijayanadk on 8/12/17.
//  Copyright © 2017 Vijayanadk. All rights reserved.
//

import UIKit

class NewMessageController: UITableViewController {

    let cellId = "cellId"
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Cancel", style: .plain, target: self, action: #selector(handleCancel))

            }
    
    func handleCancel() {
       dismiss(animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //let use a hack for now
        
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: cellId)
        cell.textLabel?.text = "Dummy LALALAA"
        return cell
    }

}
