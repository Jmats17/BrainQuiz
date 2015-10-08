//
//  EndViewController.swift
//  BrainQuiz
//
//  Created by Justin Matsnev on 10/7/15.
//  Copyright © 2015 Justin Matsnev. All rights reserved.
//

import UIKit
import Foundation

class EndViewController: UIViewController {

    @IBOutlet var myScoreLabel : UILabel!
    @IBOutlet var highScoreLabel : UILabel!
    @IBOutlet var button : UIButton!
    var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    override func viewDidLoad() {
        button.layer.cornerRadius = 5.0
        let highscore = defaults.valueForKey("highscore") as! Int
        let myScore = defaults.valueForKey("myScore") as! Int
        
        myScoreLabel.text = "\(myScore)"
        highScoreLabel.text = "\(highscore)"
    }
    
    @IBAction func restart(sender : AnyObject) {
        self.performSegueWithIdentifier("endToQuiz", sender: self)
    }
    
}
