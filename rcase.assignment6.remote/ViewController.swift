//
//  ViewController.swift
//  rcase.assignment4.remote
//
//  Created by Reid Case on 2/7/18.
//  Copyright © 2018 DePaul University CSC471. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let channelHighLimit:Int = 99
    let channelLowLimit:Int = 01
    let favs = ["ABC":"07", "CBS":"02", "NBC":"04", "PBS":"24"]

    var tempCh:String?
    
    @IBOutlet weak var powerIndicator: UILabel!
    @IBOutlet weak var volume: UILabel!
    @IBOutlet weak var channel: UILabel!
    
    @IBOutlet var controls: [UIControl]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let pwr = powerIndicator {
            if pwr.text == "Off" {
                controls(enabled: false)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func switchToggled(_ sender: UISwitch) {
        if let ch = channel {
            if(ch.text?.count)! < 2 {
                ch.text = tempCh
                ch.isHighlighted = false
            }
        }
        if let pwrInd = powerIndicator {
            if sender.isOn {
                pwrInd.text = "On"
                controls(enabled: true)
            }else{
                pwrInd.text = "Off"
                controls(enabled: false)
            }
        }
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        if let ch = channel {
            if(ch.text?.count)! < 2 {
                ch.text = tempCh
                ch.isHighlighted = false
            }
        }
        if let vol = volume {
            vol.text = String(Int(sender.value))
        }
    }
    
    @IBAction func channelIncreased(_ sender: UIButton) {
        if let ch = channel {
            if(ch.text?.count)! < 2 {
                ch.text = tempCh
                ch.isHighlighted = false
            }else{
                if Int(ch.text!)! < channelHighLimit {
                    ch.text = String(Int(ch.text!)!+1)
                    if (ch.text?.count)! < 2 {
                        ch.text = "0"+ch.text!
                    }
                }
            }
        }
    }
    
    @IBAction func channelDecreased(_ sender: UIButton) {
        if let ch = channel {
            if (ch.text?.count)! < 2 {
                ch.text = tempCh
                ch.isHighlighted = false
            }else{
                if Int(ch.text!)! > channelLowLimit {
                    ch.text = String(Int(ch.text!)!-1)
                    if (ch.text?.count)! < 2 {
                        ch.text = "0"+ch.text!
                    }
                }
            }
        }
    }
    
    @IBAction func favoriteSelected(_ sender: UISegmentedControl) {
        if let ch = channel {
            ch.isHighlighted = true
            tempCh = favs[sender.titleForSegment(at: sender.selectedSegmentIndex)!]! as String
            ch.text = favs[sender.titleForSegment(at: sender.selectedSegmentIndex)!]! as String
            ch.isHighlighted = false
        }
        
    }
    
    @IBAction func numberPressed(_ sender: UIButton) {
        if let lastCh = channel{
            let lenTxt:Int = (lastCh.text?.count)!
            if lenTxt == 2 {
                tempCh = lastCh.text!
                lastCh.isHighlighted = true
                lastCh.text = sender.currentTitle
            }else if lenTxt == 1 {
                let senderVal:Int = Int(sender.currentTitle!)!
                let curVal:Int = Int(lastCh.text!)!
                if senderVal > 0 || curVal > 0 {
                    lastCh.text = lastCh.text!+sender.currentTitle!
                    lastCh.isHighlighted = false
                    tempCh = nil
                }
            }else{
                lastCh.text = lastCh.text!+sender.currentTitle!
                lastCh.isHighlighted = false
                tempCh = nil
            }
        }
    }
    
    func controls(enabled:Bool){
        if let cntrls = controls {
            for ctrl in cntrls {
                ctrl.isEnabled = enabled
            }
        }
    }
}

