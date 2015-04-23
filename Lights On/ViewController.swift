//
//  ViewController.swift
//  Lights On
//
//  Created by student on 4/21/15.
//  Copyright (c) 2015 student. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet var WinLabel: UILabel!
    @IBOutlet var ClickLabel: UILabel!
    @IBOutlet var Lights: [UIButton]!
    
    var clickCount = 0;
    
    @IBAction func ResetGame(sender: AnyObject) {
        WinLabel.text = ""
        for (var i = 0; i < 9; i++)
        {
            Lights[i].enabled = true;
            ClickLabel.text = "Move Count: 0";
            clickCount = 0;
            randomizeBoard();
        }
    }
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
        
        clickCount++;
        ClickLabel.text = "Move Count: " + String(clickCount);
        
        if (checkForWin() == true)
        {
            WinLabel.text = "You Win!"
            for (var i = 0; i < 9; i++)
            {
                Lights[i].enabled = false;
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeBoard();
        for (var i = 0; i < 9; i++)
        {
            Lights[i].layer.borderWidth = 3.0
            Lights[i].layer.borderColor = UIColor.blackColor().CGColor
        }
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
    
    func checkForWin () -> Bool {
        var win = true
        for (var i = 0; i < 9; i++)
        {
            if (Lights[i].backgroundColor != UIColor.whiteColor())
            {
                win = false
            }
        }
        return win
    }
    
    func randomizeBoard () {
        for (var i = 0; i < 9; i++)
        {
            if(Int(arc4random_uniform(2)) == 1)
            {
                Lights[i].backgroundColor = UIColor.whiteColor()
            }
            else
            {
                Lights[i].backgroundColor = UIColor.blackColor()
            }
        }

    }
}

