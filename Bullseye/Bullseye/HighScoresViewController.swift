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
    
    var row0item: HighScoreItem?
        // instead of row0item = HighScoreItem()
            // is initializer method creating new empty instance with default values defined in class
        // so use type annotation instead just to indicate type
            // won't have a value yet
    var row1item: HighScoreItem?
    var row2item: HighScoreItem?
    var row3item: HighScoreItem?
    var row4item: HighScoreItem?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        row0item?.name = "The reader of this book"
        row0item?.score = 50000
        row1item?.name = "Manda"
        row1item?.score = 10000
        row2item?.name = "Joey"
        row2item?.score = 5000
        row3item?.name = "Adam"
        row3item?.score = 1000
        row4item?.name = "Eli"
        row4item?.score = 500
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
            nameLabel.text = row0item?.name
            scoreLabel.text = String(row0item?.score)
        }
        else if indexPath.row == 1{
            nameLabel.text = row1item?.name
            scoreLabel.text = init?(String(row1item?.score))
        }
        else if indexPath.row == 2{
            nameLabel.text = row2item.name
            scoreLabel.text = String(row2item.score)
        }
        else if indexPath.row == 3{
            nameLabel.text = row3item.name
            scoreLabel.text = String(row3item.score)
        }
        else if indexPath.row == 4{
            nameLabel.text = row4item.name
            scoreLabel.text = String(row4item.score)
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
