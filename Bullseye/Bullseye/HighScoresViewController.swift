//
//  HighScoresViewController.swift
//  Bullseye
//
//  Created by Jason Chen on 9/16/20.
//  Copyright © 2020 Jason Chen. All rights reserved.
//

import UIKit

class HighScoresViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "HighScoreItem", for: indexPath)
        // ask tableViewCell for view with 1000 tag
            // good when not using @IBOutlet
        let nameLabel = cell.viewWithTag(1000) as! UILabel
        let scoreLabel = cell.viewWithTag(2000) as! UILabel
        // indexPath is obj that points to a specific row in the rable
            // use .row to property to find out the row that cell is intended
            // can use .section to between sections like in a phone book with different start letter of a name
        if indexPath.row == 0{
            nameLabel.text = "The reader of this book"
            scoreLabel.text = "50000"
        }
        else if indexPath.row == 1{
            nameLabel.text = "Manda"
            scoreLabel.text = "10000"
        }
        else if indexPath.row == 2{
            nameLabel.text = "Joey"
            scoreLabel.text = "5000"
        }
        else if indexPath.row == 3{
            nameLabel.text = "Adam"
            scoreLabel.text = "1000"
        }
        else if indexPath.row == 4{
            nameLabel.text = "Eli"
            scoreLabel.text = "500"
        }
        
        return cell
    }
}
