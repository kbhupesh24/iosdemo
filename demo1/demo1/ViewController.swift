//
//  ViewController.swift
//  demo1
//
//  Created by Bhupesh on 6/27/17.
//  Copyright © 2017 Bhupesh. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {

    
    
    // Hello World
    @IBOutlet weak var output: UILabel!
    @IBOutlet weak var input: UITextField!
    
    @IBAction func action(_ sender: UIButton) {
        output.text="Hello, " + (input.text)!
    }
    
    // Timer
    var timer = Timer()
    var time = 0
    
    @IBOutlet weak var timerlbl: UILabel!
    
    @IBAction func startTimer(_ sender: UIButton) {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.incrementTimer), userInfo: nil, repeats: true)
    }
    
    @IBAction func pauseTimer(_ sender: UIButton) {
        timer.invalidate()
    }
    
    @IBAction func resetTimer(_ sender: UIButton) {
        timer.invalidate()
        time = 0
    }
    
    func incrementTimer(){
        time += 1
        timerlbl.text = String(time)
    }
    
    
    //Countdown Timer
    var seconds = 30
    var countdownTimer = Timer()
    var audioPlayer = AVAudioPlayer()
    
    @IBOutlet weak var cntDwnTimerLbl: UILabel!
    
    @IBOutlet weak var sliderOutlet: UISlider!
    @IBAction func slider(_ sender: UISlider) {
        seconds = Int(sender.value)
        cntDwnTimerLbl.text = String(seconds) + " Seconds "
    }
    
    
    @IBOutlet weak var startOutlet: UIButton!
    @IBAction func startCounter(_ sender: AnyObject) {
       countdownTimer =  Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.startCounterSelector), userInfo: nil, repeats: true)
        
        sliderOutlet.isHidden = true
        startOutlet.isHidden = true
    }
    
    @IBOutlet weak var stopOutlet: UIButton!
    @IBAction func stopCounter(_ sender: AnyObject) {
        countdownTimer.invalidate()
        seconds = 30
        sliderOutlet.setValue(30, animated: true)
        cntDwnTimerLbl.text = "30"
        
        audioPlayer.stop()
        
        sliderOutlet.isHidden = false
        startOutlet.isHidden = false
    }
    
    func startCounterSelector(){
        seconds -= 1
        cntDwnTimerLbl.text = String(seconds) + " Seconds "
        
        if(seconds == 0){
            countdownTimer.invalidate()
            
            audioPlayer.play()
        }
    }
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        do{
            let audioPath = Bundle.main.path(forResource: "beep1", ofType: ".mp3")
            try audioPlayer = AVAudioPlayer(contentsOf: URL(fileURLWithPath: audioPath!))
        }
        catch{
            // ERROR
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

