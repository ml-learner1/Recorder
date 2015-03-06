//
//  PlaySoundViewController.swift
//  Recorder
//
//  Created by Garg, Smith on 3/3/15.
//  Copyright (c) 2015 Garg, Smith. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundViewController: UIViewController {
    
    
    var recievedAudio: RecordedAudio!
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: recievedAudio.filePathUrl, error: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func playSoundSlowly(sender: UIButton) {
        
        commonAudioFunction(0.5, typeOfChange: "rate")
        
    }

    
    @IBAction func playSoundFast(sender: UIButton) {
        
        commonAudioFunction(1.5, typeOfChange: "rate")
        
    }
    
    
   @IBAction func stopAudio(sender: UIButton) {
    //Stop the recorder
    audioEngine.stop()
    audioEngine.reset()
    
    }
    
    
    @IBAction func PlayChipmunkAction(sender: UIButton) {
        commonAudioFunction(1000, typeOfChange: "pitch")
    }
    
    
    @IBAction func PlayDarthVaderAction(sender: UIButton) {
        commonAudioFunction(-1000, typeOfChange: "pitch")
    }
    
    func commonAudioFunction(audioChangeNumber: Float, typeOfChange: String){
        
        var audioPlayerNode = AVAudioPlayerNode()
        
        audioPlayerNode.stop()
        audioEngine.stop()
        audioEngine.reset()
        
        
        audioEngine.attachNode(audioPlayerNode)
        
        var changeAudioUnitTime = AVAudioUnitTimePitch()
        
        if (typeOfChange == "rate") {
            
            changeAudioUnitTime.rate = audioChangeNumber
            
        } else {
            changeAudioUnitTime.pitch = audioChangeNumber
        }
        audioEngine.attachNode(changeAudioUnitTime)
        audioEngine.connect(audioPlayerNode, to: changeAudioUnitTime, format: nil)
        audioEngine.connect(changeAudioUnitTime, to: audioEngine.outputNode, format: nil)
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        
        audioPlayerNode.play()
        
    }
    

}
