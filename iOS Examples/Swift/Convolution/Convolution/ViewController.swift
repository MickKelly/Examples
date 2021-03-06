//
//  ViewController.swift
//  Convolution
//
//  Created by Aurelius Prochazka on 2/16/15.
//  Copyright (c) 2015 Aurelius Prochazka. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var dryWetBalanceSlider: UISlider!
    
    let conv = ConvolutionInstrument()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        AKOrchestra.addInstrument(conv)
        AKOrchestra.start()
        
        updateSliders()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func updateSliders()->Void{
        AKTools.setSlider(dryWetBalanceSlider, withProperty: conv.dryWetBalance)
    }
    
    @IBAction func start(sender: AnyObject) {
        conv.play()
    }
    
    @IBAction func stop(sender: AnyObject) {
        conv.stop()
    }
    
    @IBAction func changeDryWet(sender: UISlider) {
        AKTools.setProperty(conv.dryWetBalance, withSlider: sender)
    }
    
    @IBAction func changeDishWell(sender: UISlider) {
        AKTools.setProperty(conv.dishWellBalance, withSlider: sender)
    }
}