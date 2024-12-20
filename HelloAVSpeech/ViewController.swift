//
//  ViewController.swift
//  HelloAVSpeech
//
//  Created by Willy Hsu on 2024/12/19.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    let syntesizer = AVSpeechSynthesizer()
    var currentRate: Float = 0.5
    @IBOutlet weak var rateSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        syntesizer.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func sayHello(_ sender: Any) {
        syntesizer.stopSpeaking(at: .immediate)
        let utterance = AVSpeechUtterance(string: "大家好")
        utterance.rate = currentRate
//        utterance.rate = rateSlider.value
        syntesizer.speak(utterance)
    }
    
    @IBAction func sayThisisabook(_ sender: Any) {
        let utterance = AVSpeechUtterance(string: "This is a book.")
        utterance.rate = currentRate
        utterance.voice = AVSpeechSynthesisVoice(language: "en-us")
        syntesizer.speak(utterance)
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        syntesizer.stopSpeaking(at: .immediate)
    }
    @IBAction func synRate(_ sender: UISlider) {
        currentRate = sender.value
    }
    
  
}
extension ViewController:AVSpeechSynthesizerDelegate{
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didStart utterance: AVSpeechUtterance) {
        print("start")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didFinish utterance: AVSpeechUtterance) {
        print("finish")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didPause utterance: AVSpeechUtterance) {
        print("stop")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didContinue utterance: AVSpeechUtterance) {
        print("continue")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, didCancel utterance: AVSpeechUtterance) {
        print("Cancel")
    }
    func speechSynthesizer(_ synthesizer: AVSpeechSynthesizer, willSpeakRangeOfSpeechString characterRange: NSRange, utterance: AVSpeechUtterance) {
        print("SpeakRangeOfSpeech")
    }
}
