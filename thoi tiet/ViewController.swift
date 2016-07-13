//
//  ViewController.swift
//  thoi tiet
//
//  Created by Thang Le on 7/12/16.
//  Copyright © 2016 Thang Le. All rights reserved.
//  check xem da tinh xong chua neu chua tinh xong thi tra lai 


import UIKit

class ViewController: UIViewController
{
    
    @IBOutlet weak var cityLabel: UILabel!
    
    @IBOutlet weak var quoteLabel: UILabel!
    
    @IBAction func tempButton(sender: UIButton)
    {
//        print(tempOutlet.titleLabel!)
        let randomNumber = Double((tempOutlet.titleLabel?.text)!)
        if( degreeFC == true)
            
        {
            fahrCelLabel.text = "F"
            degreeFC = false
            let   doF = randomNumber! * 1.8 + 32
           tempOutlet.setTitle(String(doF), forState: .Normal)
            print(doF)
        }
        else
        {
        fahrCelLabel.text = "C"
            let doC = (randomNumber! - 32)/1.8
            tempOutlet.setTitle(String(doC), forState: .Normal)
            
            degreeFC = true
            print(doC)
        }
        tempOutlet.enabled = false
        NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "enaDisaButton", userInfo: nil, repeats: false)
    }

    @IBOutlet weak var degreeOutlet: UILabel!
    
    
    @IBOutlet weak var tempOutlet: UIButton!
   
    
    @IBOutlet weak var backgroundOutlet: UIImageView!

    @IBAction func refreshButton(sender: UIButton) {
        
        let cityIndex = Int(arc4random_uniform(UInt32(city.count)))
        cityLabel.text = city[cityIndex]
        
        let quoteIndex = Int(arc4random_uniform(UInt32(quotes.count)))
        quoteLabel.text = quotes[quoteIndex]
        
        let backgroundIndex = Int(arc4random_uniform(UInt32(background.count)))
        backgroundOutlet.image = UIImage.init(named: background[backgroundIndex])
        
        if backgroundIndex == 0 || backgroundIndex == 1
        {
            tempOutlet.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            fahrCelLabel.textColor = UIColor.whiteColor()
            degreeOutlet.textColor = UIColor.whiteColor()
        }
        else
        {
            tempOutlet.setTitleColor(UIColor.blackColor(), forState: .Normal)
            fahrCelLabel.textColor = UIColor.blackColor()
            degreeOutlet.textColor = UIColor.blackColor()
        }
        getTemp()
    }
    
    @IBOutlet weak var fahrCelLabel: UILabel!
    var quotes = ["Stay in the present.", " Mastery is what at first difficult become progressively easier through practise.", "Every success need a long term commitment"]
    
    var city = ["HaNoi","Da Nang","Thanh Pho Ho Chi Minh"]
    
    var background = ["Blood.png","Moon.png","Sun.png"]
    
    var degreeFC: Bool!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        degreeFC = true
        let randomNumber = String(format: "%2.1f", tempRandom())
        tempOutlet.setTitle(randomNumber, forState: UIControlState.Normal)
    }
    
    func getTemp()
    {
        let backgroundIndex = Int(arc4random_uniform(UInt32(background.count)))
        let randomNumber = String(format: "%2.1f", tempRandom())
        tempOutlet.setTitle(randomNumber, forState: UIControlState.Normal)
    }
    
    func tempRandom () -> Double
    {
        return Double(arc4random_uniform(18) + 14) + Double(arc4random()) / Double(INT32_MAX)
    }
    func enaDisaButton()
    {
        tempOutlet.enabled = true
    }
    
}


