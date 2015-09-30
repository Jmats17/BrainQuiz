//
//  ViewController.swift
//  BrainQuiz
//
//  Created by Justin Matsnev on 9/30/15.
//  Copyright © 2015 Justin Matsnev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var playButton : UIButton!
    @IBOutlet var videoButton : UIButton!
    @IBOutlet var leaderboardButton : UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        buttonProperties(playButton)
        buttonProperties(videoButton)
        buttonProperties(leaderboardButton)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func buttonProperties(button : UIButton) {
        button.layer.borderWidth = 2.0
        button.layer.borderColor = UIColor.whiteColor().CGColor
        button.layer.cornerRadius = 5.0
    }


}

