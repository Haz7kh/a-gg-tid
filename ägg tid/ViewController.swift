//
//  ViewController.swift
//  ägg tid
//
//  Created by Khaled Almelhem on 2022-09-10.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    @IBOutlet weak var firstLabel: UILabel!
    @IBOutlet weak var proBar: UIProgressView!
    // dictionary not array
    let eggsTimer = ["Mjuk" : 300, "Medium" : 420 , "Hård" : 720]
    var totalTime = 0
    var secondPassed = 0
    var timer = Timer()
    var player: AVAudioPlayer!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }


    @IBAction func levelSelected(_ sender: UIButton) {
        
        timer.invalidate()
        let hardness = sender.currentTitle!
        totalTime = eggsTimer[hardness]!
        proBar.progress = 0.0
        secondPassed = 0
        firstLabel.text = hardness
        
      timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
    }
    @objc func updateTimer (){
        
      
        
        if secondPassed < totalTime {
            secondPassed += 1
            proBar.progress = Float(secondPassed) / Float(totalTime)
            
            
            
        }else {
            firstLabel.text = "Done"
            timer.invalidate()
             playSound()
        }

    }
    
    func playSound() {
          let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")
          player = try! AVAudioPlayer(contentsOf: url!)
          player.play()
          
                  
      }
    
    
}


