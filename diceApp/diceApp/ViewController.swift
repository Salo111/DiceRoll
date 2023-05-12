//
//  ViewController.swift
//  diceApp
//
//  Created by salo khizanishvili on 16.12.22.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    var player: AVAudioPlayer!
    @IBOutlet weak var firstDice: UIImageView!
    @IBOutlet weak var secondDice: UIImageView!
    @IBOutlet weak var diceBtn: UIButton!
    var diceArray = ["dice1", "dice2", "dice3", "dice4", "dice5", "dice6"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    var secondsRemaining = 8
    var timer = Timer()
    @IBAction func diceRollPush(_ sender: Any) {
        timer = Timer.scheduledTimer(timeInterval: 0.15, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        playSound()
    }
    
    func playSound() {
        let url = Bundle.main.url(forResource: "dice", withExtension: "mp3")
        player = try! AVAudioPlayer(contentsOf: url!)
        player.play()
    }
    
    @objc func updateTimer(){
        if secondsRemaining > 0 {
            firstDice.image = UIImage(named: diceArray.randomElement()!)
            secondDice.image = UIImage(named: diceArray.randomElement()!)
            secondsRemaining -= 1
        }
        else {
            timer.invalidate()
            secondsRemaining = 8
        }
    }
   
}

