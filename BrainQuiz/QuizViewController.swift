//
//  QuizViewController.swift
//  BrainQuiz
//
//  Created by Justin Matsnev on 9/30/15.
//  Copyright © 2015 Justin Matsnev. All rights reserved.
//

import Foundation
import UIKit
import AVFoundation

class QuizViewController : UIViewController, UITextFieldDelegate {
    @IBOutlet var answerField : UITextField!
    @IBOutlet var questionField : UITextView!
    @IBOutlet var startButton : UIButton!
    @IBOutlet var correctIncorrect : UILabel!
    @IBOutlet var correctIncorrectField : UILabel!
    @IBOutlet var points : UILabel!
    var pointsNum : Int = 0
    var newDict : Dictionary = [String:String]()
    var correctSound = AVAudioPlayer()

    var defaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
    var vocabDict : Dictionary = ["brain":"an organ of soft nervous tissue contained in the skull of vertebrates, functioning as the coordinating center of sensation and intellectual and nervous activity.","nuerotransmitter":"a chemical substance that is released at the end of a nerve fiber by the arrival of a nerve impulse and, by diffusing across the synapse or junction, causes the transfer of the impulse to another nerve fiber, a muscle fiber, or some other structure.","fMRI":"(functional MRI)combo of MRI and pet scan","Phrenology":"history of the mind","Franz Gill":"scientist in 1800's; suggested that bumps on the skull represented mental abilities. His theory was not valid but proposed that different mental abilities were modular.","neuron":"a nerve cell that consists of many different parts","Cell Body":"cell's life support center","Dendrites":"bushy, branching extensions that receive messages from other cells","Axon":"passes messages away from the cell body to other neurons, muscles, or glands","Neural Impulse":"electrical signal traveling down the axon","Terminal branches":"form junctions with other cells","Myelin Sheath":"covers axons of some neurons and helps speed neural impulses","sensory neurons":"run from the various types of stimulus receptors including touch, odor, taste, sound, vision","interneurons":"found exclusively within spinal chord and brain","motor neurons":"transmit impulses ( send messages from the central nervous system to muscles and glands)","glial cells":"hold neurons together, supports and serves as a protector of neurons, removes waste, allows them to work more efficiently. There are more of these than neurons.","Action Potential":"a brief electrical charge that travels down an Axon and generated by the movement of positively charged atoms in and out of channels in the axons membrane","Ions":"exchange of electrically charged plus & minus atoms","reflex":"simplest form of neural transmission; efferent and afferent nerve fibers fire messages to your spinal cord and brain to kick for example","synapse":"a junction between the axon tip of the sending neuron and the dendrite or cell body of the receiving neuron.","Refractory Period":"after a neuron fires an action potential it pauses for a short period to recharge itself to fire again.","Sodium-potassium pump":"pump positive ions out from the inside of the neuron, making them ready for another action potential.","Acetylcholine (ACb)":"enables muscle action, learning, and memory","Dopamine":"influences movement, learning, attention, and emotion","Serotonin":"affects mood, hunger, sleep, and arousal.","norepinephrine":"helps control alertness and arousal.","Gaba":"Name of the major inhibitory neurotransmitter","Glutamate":"major excitatory neurotransmitter involved in memory","reuptake":"in this process , neurotransmitters in the synapse are reabsorbed into the sending process. This applies the breaks on neurotransmitter action","Brainstem":"oldest part of the brain, where the spinal cord swells and enters the skull. Responsible for automatic survival functions","Thalamus":"the brains sensory switchboard located on the top of the brain stem. If directs messages to the sensory areas in the cortex and transmits replies to the cerebellum and medulla","Cerebellum":"the little brain attached to the rear of the Brainstem","Limbic System":"doughnut shaped system of neural structures at the border of the Brainstem and cerebellum, associated with emotions such as fear, aggression, and drives for food and sex","Medulla":"base of the Brainstem that controls heartbeat and breathing","Reticular formation":"nerve network in Brainstem that plays an important role in controlling arousal","Amygdala":"consists of two almond shaped neural clusters linked to fear and anger","Hypothalamus":"lies below the thalamus. Directs several maintenance activities like eating, drinking, body temp, and control of emotions. Helps govern the endocrine system via the pituitary gland.","Nervous System":"consists of all the nerve cells. It is the bodies speedy electrochemical communication system","Central Nervous System (CNS)":"brain and spinal cord", "Peripheral Nervous System (PNS)":"the sensory and motor neurons that connect the central nervous system to the rest of the body"]
    
    override func viewDidLoad() {
        startButton.layer.cornerRadius = 5.0
        answerField.delegate = self
        textFieldDidBeginEditing(answerField)
        textFieldDidEndEditing(answerField)

        answerField.hidden = true
        correctIncorrectField.hidden = true
        correctIncorrect.hidden = true
        questionField.hidden = true
        textFieldShouldReturn(answerField)
        
    }
    
    @IBAction func start(sender : AnyObject) {
        answerField.hidden = false
        questionField.hidden = false
        startButton.hidden = true

        let index: Int = Int(arc4random_uniform(UInt32(vocabDict.count)))
        let key = Array(vocabDict.keys)[index]
        let value = vocabDict[key]!
        questionField.text = "\(value)"
        correctIncorrectField.text = "\(key)"
        self.newDict[key] = value
        self.vocabDict.removeValueForKey(key)
        print(self.vocabDict.count)
        print(self.newDict.count)
        makeSpecialColors(questionField)

    }
    
    func makeSpecialColors(textfield1 : UITextView) {
        textfield1.textColor = UIColor.whiteColor()
        textfield1.font = UIFont(name: "Chalkduster", size: 17)
        
    }
    
    
    
    func pauseAndDoStuff() {
        let time = dispatch_time(dispatch_time_t(DISPATCH_TIME_NOW), 1 * Int64(NSEC_PER_SEC))
        dispatch_after(time, dispatch_get_main_queue()) {
            
            self.answerField.hidden = false
            self.correctIncorrect.hidden = true
            let index: Int = Int(arc4random_uniform(UInt32(self.vocabDict.count)))
            let key = Array(self.vocabDict.keys)[index]
            let value = self.vocabDict[key]!
          
            self.questionField.text = "\(value)"
            self.correctIncorrectField.text = key
            self.newDict[key] = value
            self.vocabDict.removeValueForKey(key)
            if self.vocabDict.count == 0 {
                
            }
            print(self.vocabDict.count)
            print(self.newDict.count)
            self.makeSpecialColors(self.questionField)
        }
    }
    
//    func playCorrectSound() {
////        let soundURL: NSURL = NSBundle.mainBundle().URLForResource("correct", withExtension: "m4a")!
////        correctSound = try! AVAudioPlayer(contentsOfURL: soundURL)
////        correctSound.play()
////        
//        // Set the sound file name & extension
//        let alertSound = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("correct", ofType: "m4a")!)
//        
//        // Preperation
//        try! AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback, withOptions: [])
//        try! AVAudioSession.sharedInstance().setActive(true)
//        
//        // Play the sound
//        do {
//            try correctSound = AVAudioPlayer(contentsOfURL: alertSound)
//            correctSound.prepareToPlay()
//            correctSound.play()
//        } catch {
//            print("there is \(error)")
//        }
//
//    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        if correctIncorrectField.text == answerField.text && correctIncorrectField.text != "" && answerField.text != "" {
            pointsNum = pointsNum + 10
            points.text = "\(pointsNum)"
            textField.text = ""
            textField.hidden = true
            correctIncorrect.hidden = false
            correctIncorrect.textColor = UIColor.greenColor()
            correctIncorrect.text = "Correct!"
            pauseAndDoStuff()
          //  playCorrectSound()

        }
        if correctIncorrectField.text != answerField.text && correctIncorrectField.text != "" && answerField.text != "" {
            pointsNum = pointsNum - 5
            points.text = "\(pointsNum)"
            textField.text = ""
            textField.hidden = true
            correctIncorrect.hidden = false
            correctIncorrect.textColor = UIColor.redColor()
            correctIncorrect.text = "Incorrect!"
            pauseAndDoStuff()
        }
        textField.resignFirstResponder()
        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        //move textfields back down
        UIView.beginAnimations( "animateView", context: nil)
        var frame : CGRect = self.view.frame
        frame.origin.y = 0
        self.view.frame = frame
        UIView.commitAnimations()
        
    }
    
    func textFieldDidBeginEditing(textField: UITextField) {
        //move textfields up
        let myScreenRect: CGRect = UIScreen.mainScreen().bounds
        let keyboardHeight : CGFloat = 216
        
        UIView.beginAnimations( "animateView", context: nil)
        var needToMove: CGFloat = 0
        
        var frame : CGRect = self.view.frame
        if (textField.frame.origin.y + textField.frame.size.height + /*self.navigationController.navigationBar.frame.size.height + */UIApplication.sharedApplication().statusBarFrame.size.height > (myScreenRect.size.height - keyboardHeight)) {
            needToMove = (textField.frame.origin.y + textField.frame.size.height + /*self.navigationController.navigationBar.frame.size.height +*/ UIApplication.sharedApplication().statusBarFrame.size.height) - (myScreenRect.size.height - keyboardHeight);
        }
        
        frame.origin.y = -needToMove
        self.view.frame = frame
        UIView.commitAnimations()
        
    }
    
    
}