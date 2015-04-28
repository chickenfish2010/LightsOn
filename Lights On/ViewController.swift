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
    @IBOutlet var RecordLabel: UILabel!
    @IBOutlet var GamesWonLabel: UILabel!
    @IBOutlet var GamesSkippedLabel: UILabel!
    @IBOutlet var Lights: [UIButton]!
    
    var clickCount = 0;
    var clickRecord = 10000;
    var randomControl = 0;
    var gamesWon = 0;
    var gamesSkipped = 0;
    
    @IBAction func ResetGame(sender: AnyObject) {
        WinLabel.text = ""
        if (Lights[0].enabled == true)
        {
            gamesSkipped++;
            GamesSkippedLabel.text = "Games Skipped: " + String(gamesSkipped);
        }
        for (var i = 0; i < 9; i++)
        {
            Lights[i].enabled = true;
            ClickLabel.text = "Move Count: ";
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
            WinLabel.text = "You Win!";
            gamesWon++;
            GamesWonLabel.text = "Games Won: " + String(gamesWon);
            for (var i = 0; i < 9; i++)
            {
                Lights[i].enabled = false;
                setRecordClick();
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        randomizeBoard();
        for (var i = 0; i < 9; i++)
        {
            Lights[i].layer.borderWidth = 3.0;
            Lights[i].layer.borderColor = UIColor.blackColor().CGColor;
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func LightSwitch(button: UIButton) {
        if(button.backgroundColor == UIColor.yellowColor())
        {
            button.backgroundColor = UIColor.blackColor();
        }
        else
        {
            button.backgroundColor = UIColor.yellowColor();
        }
    }
    
    func checkForWin () -> Bool {
        var win = true;
        for (var i = 0; i < 9; i++)
        {
            if (Lights[i].backgroundColor != UIColor.yellowColor())
            {
                win = false;
            }
        }
        return win
    }
    
    func randomizeBoard () {
        for (var i = 0; i < 9; i++)
        {
            if(Int(arc4random_uniform(2)) == 1)
            {
                Lights[i].backgroundColor = UIColor.yellowColor();
                randomControl++;
            }
            else
            {
                Lights[i].backgroundColor = UIColor.blackColor();
            }
            
            if (randomControl == 9)
            {
                randomControl = 0;
                randomizeBoard();
            }
        }

    }
    
    func setRecordClick () {
        if (clickCount != 0 && clickCount < clickRecord)
        {
            clickRecord = clickCount;
            RecordLabel.text = "Record Count: " + String(clickRecord);

        }
    }
}

