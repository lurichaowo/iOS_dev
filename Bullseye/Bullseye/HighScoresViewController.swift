//
//  HighScoresViewController.swift
//  Bullseye
//
//  Created by Jason Chen on 9/16/20.
//  Copyright © 2020 Jason Chen. All rights reserved.
//

import UIKit

class HighScoresViewController: UITableViewController {
    // tableView splits up delegate duties into 2 helpers:
        // UITableviewDataSource: for putting rows into tables
        // UITableViewDelegate for handling taps on rows and other tasks
    // to use table view in the UIViewController
        // need to connect both manually while TableView does it automatically
    

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    // MARK: - Table view data source
    // _ tableView: UITableView parameter is the TableView obj that is invoked for these methids
        // so we dont need to use @IBOutlet
    // numberofRowsInSection parameter is section #
    // cellForRowAt and didSelectRowAt parameters is the indexPath
    
    // _ tableView -> obj name
        // _ is for when no external name is needed
    // :UITableView -> parameter type
    // numberOfRowsInSection -> external parameter name (the method called)
    // section -> local parameter name
        // data type is Int
    
    // tableView(_:numberOfRowsInSection)
        // = tableview._.numberOfRowsInSection in C or Java
    // if there is a -> then there is a return value
        // if no -> then not	
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
    
    // MARK:- Table View Delegate
    // didSelectRowAt is a tableview delegate method
        // cllaed when user taps on a cell
        // turns grey only when tapped on before turning back
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
