//
//  ViewController.swift
//  Egg Timer
//
//  Created by Dave Schumaker on 12/14/16.
//  Copyright © 2016 Schumaker. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLeftLabel: UILabel!
    var eggTimer = Timer()  // Initialize the Timer class.
    var timerActive = false // Prevents multiple timers from firing.
    var timeLeft = 210

    func stopTimer() {
        timerActive = false
        eggTimer.invalidate()
    }
    
    func processTimer() {
        if timeLeft <= 0 {
            stopTimer()
            return
        }
        
        timeLeft = timeLeft - 1;
        timeLeftLabel.text = String(timeLeft)
    }
    
    
    @IBAction func startTimerButton(_ sender: Any) {
        if !timerActive {
            timerActive = true
            eggTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.processTimer), userInfo: nil, repeats: true)
        }
    }
    
    
    @IBAction func pauseTimerButton(_ sender: Any) {
        stopTimer()
    }
    
    
    @IBAction func subtractTime(_ sender: Any) {
        if timeLeft > 10 {
            timeLeft = timeLeft - 10
            timeLeftLabel.text = String(timeLeft)
        }
    }
    
    
    @IBAction func resetTimer(_ sender: Any) {
        timeLeft = 210
        timeLeftLabel.text = String(timeLeft)
    }
    
    
    @IBAction func addTime(_ sender: Any) {
        timeLeft = timeLeft + 10
        timeLeftLabel.text = String(timeLeft)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

