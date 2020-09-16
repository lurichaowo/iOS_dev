//
//  ViewController.swift
//  Bullseye
//
//  Created by Jason Chen on 9/2/20.
//  Copyright © 2020 Jason Chen. All rights reserved.
//

// NOTES:
// @IB- Action or Outlet = can connect to UI objects
    // normal funcs can't
// var = variable declaration
// let = constant value; unable to change
// lroundf = round to nearest int
// present = show on screen

import UIKit

var currentValue: Int = 50

class ViewController: UIViewController {
    // outlet = slider instance variable
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var roundLabel: UILabel!
    var targetValue = 0
    var currentValue: Int = 0
    var score = 0
    var round = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startNewGame()
        let thumbImageNormal = UIImage(named: "SliderThumb-Normal")!
        slider.setThumbImage(thumbImageNormal, for: .normal)
        
        let thumbImageHighlighted = UIImage(named: "SliderThumb-Highlighted")!
        slider.setThumbImage(thumbImageHighlighted, for: .highlighted)
        
        let insets = UIEdgeInsets(top: 0, left: 14, bottom: 0, right: 14)
        
        let trackLeftImage = UIImage(named: "SliderTrackLeft")!
        let trackLeftResizable = trackLeftImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackLeftResizable, for: .normal)
        
        let trackRightImage = UIImage(named: "SliderTrackRight")!   
        let trackRightResizable = trackRightImage.resizableImage(withCapInsets: insets)
        slider.setMinimumTrackImage(trackRightResizable, for: .normal)
    }

    @IBAction func showAlert(){
        let diff = abs(targetValue - currentValue)
        var points = 100 - diff
        // objs comminicate with by passing messages to each other
        // UIButton sends a message to view controller, which will msg more objs
        // iOS apps are event driven, different from top-to-bottom scripts like php, python, etc
        // if nothing happens, it will just sit there
        // chart on pg 506 from textbook
        
        // alert parameters
        //let msg = "The value of the slider is: \(currentValue)" + "\nThe target value is: \(targetValue)"®
        let title: String
        var bonus: Int = 0
        let msg: String
        // even tough title is a contant rn
        // b/c we haven't actually set it to any thing (ie- let title = "")
        // we are still able to set it to a value down here
        // try to use constants where ever possible
        if diff == 0{
            points += 100
            bonus = 100
            title = "Perfect!"
        }
        else if diff < 5 {
            points += 50
            bonus = 50
            title = "So Close!"
        }
        else if diff < 10 {
            title = "Not Bad!"
        }
        else{
            title = "Not Even Close"
        }
        
        score += points // or score = score + points
        if bonus > 0{
            msg = "Bonus " + String(bonus) + " Points!" +     "\nYou scored \(points) points"
        }
        else{
            msg = "You scord \(points) points"
        }

        let alert = UIAlertController(title: title, message: msg, preferredStyle: .alert)
        // proerties of buttom under alert
        // start new round starts only after the OK has been pressed aka "closure"
        let action = UIAlertAction(title: "Ok", style: .default, handler: { _ in self.startNewRound()} )
        // add button onto alert
        alert.addAction(action)
        // show it on button click
        // asynchornous - meaning startNewRound() will run even if player hasn't hit the OK button in the alert
        present(alert, animated: true, completion: nil)
        //startNewRound()
    }
    
    @IBAction func sliderMoved(_ slider: UISlider){
        //print("The value of the slider is now: \(slider.value)")
        currentValue = lroundf(slider.value)
    }
    
    @IBAction func startOver(){
        startNewGame()
    }
    	
    func startNewRound(){
        round += 1
        targetValue = Int.random(in: 1...100)
        currentValue = 50
        slider.value = Float(currentValue)
        updateLabels() // update labels after values determined
    }
    
    func updateLabels(){
        targetLabel.text = String(targetValue)
        scoreLabel.text = String(score)
        roundLabel.text = String(round)
        // "\(targetValue) also works"
    }

    func startNewGame(){
        score = 0
        round = 0
        startNewRound()
    }
}

