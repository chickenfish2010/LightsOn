//
//  ViewController.swift
//  Lights On
//
//  Created by student on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var Lights: [UIButton]!
    @IBAction func LightFlipped(sender: UIButton) {
        if(sender == Lights[0])
        {
            LightSwitch(Lights[0]);
            LightSwitch(Lights[1]);
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
        }
        else if(sender == Lights[1])
        {
            LightSwitch(Lights[0]);
            LightSwitch(Lights[1]);
            LightSwitch(Lights[2]);
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
        }
        else if(sender == Lights[2])
        {
            LightSwitch(Lights[1]);
            LightSwitch(Lights[2]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
        }
        else if(sender == Lights[3])
        {
            LightSwitch(Lights[0]);
            LightSwitch(Lights[1]);
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[6]);
            LightSwitch(Lights[7]);
        }
        else if(sender == Lights[4])
        {
            LightSwitch(Lights[0]);
            LightSwitch(Lights[1]);
            LightSwitch(Lights[2]);
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
            LightSwitch(Lights[6]);
            LightSwitch(Lights[7]);
            LightSwitch(Lights[8]);
            
        }
        else if(sender == Lights[5])
        {
            LightSwitch(Lights[1]);
            LightSwitch(Lights[2]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
            LightSwitch(Lights[7]);
            LightSwitch(Lights[8]);
        }
        else if(sender == Lights[6])
        {
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[6]);
            LightSwitch(Lights[7]);
        }
        else if(sender == Lights[7])
        {
            LightSwitch(Lights[3]);
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
            LightSwitch(Lights[6]);
            LightSwitch(Lights[7]);
            LightSwitch(Lights[8]);
        }
        else if(sender == Lights[8])
        {
            LightSwitch(Lights[4]);
            LightSwitch(Lights[5]);
            LightSwitch(Lights[7]);
            LightSwitch(Lights[8]);
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LightSwitch(button: UIButton) {
        if(button.backgroundColor == UIColor.whiteColor())
        {
            button.backgroundColor = UIColor.blackColor()
        }
        else
        {
            button.backgroundColor = UIColor.whiteColor()
        }
    }
}

