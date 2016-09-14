//
//  ViewController.swift
//  PlayMP3_Swift
//
//  Created by 张建军 on 16/9/14.
//  Copyright © 2016年 张建军. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {

    
    var timer = NSTimer()
    
    var audioPlayer = AVAudioPlayer()
    
    let gradientLaer = CAGradientLayer()
    
    let SCREEN_WIDTH = UIScreen.mainScreen().bounds.size.width
    let SCREEN_HEIGHT = UIScreen.mainScreen().bounds.size.height

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
            self.view.backgroundColor = UIColor.whiteColor()
        
        UIApplication.sharedApplication().statusBarHidden = true
        self.creatButton()
        
    }
    
    func creatButton()  {
        
        let playBtn = UIButton.init(type: .Custom)
        
        playBtn.frame = CGRectMake((SCREEN_WIDTH - 200)/3, SCREEN_HEIGHT * 0.3, 100, 100)
        playBtn.setImage(UIImage(named: "play"), forState: .Normal)
        
        playBtn.layer.cornerRadius = 10.0
        
        playBtn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        playBtn.tag = 1001
        self.view.addSubview(playBtn)
        
        
        
        let pauseBtn = UIButton.init(type: .Custom)
        pauseBtn.frame = CGRectMake((SCREEN_WIDTH - 200)/3 * 2 + 100, SCREEN_HEIGHT * 0.3, 100, 100)
        
        pauseBtn.setImage(UIImage(named: "pause"), forState: .Normal)
        
        pauseBtn.layer.cornerRadius = 10.0
        
        pauseBtn.addTarget(self, action: #selector(btnClick), forControlEvents: .TouchUpInside)
        
        pauseBtn.tag = 1002
        
        self.view.addSubview(pauseBtn)
        
        
    }
    

    func btnClick(btn: UIButton) {
        
        let bgMusic = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource("bacuse", ofType:
            
            "mp3")!)
        do{
            
            try AVAudioSession.sharedInstance().setCategory(AVAudioSessionCategoryPlayback)
            
            try AVAudioSession.sharedInstance().setActive(true)
            
            try audioPlayer = AVAudioPlayer(contentsOfURL: bgMusic)
            
            if btn.tag == 1001 {
                
                audioPlayer.prepareToPlay()
                audioPlayer.play()
                
                timer = NSTimer.scheduledTimerWithTimeInterval(0.2, target: self, selector: #selector(randomColor), userInfo: nil, repeats: true)
            
            }
            
            if btn.tag == 1002 {
                audioPlayer.pause()
                timer.invalidate()
            }
        }
            catch let audioError as NSError{
            
                print("播放错误",audioError)
                
            }
            
            
        }
        
        
        
    func randomColor()  {
        
        
        let redValue = CGFloat(drand48())
        
        let blueValue = CGFloat(drand48())
        
        let greenValue = CGFloat(drand48())
        
        self.view.backgroundColor = UIColor(red: redValue,green: greenValue,blue: blueValue,alpha: 1.0)
        
        
        
        
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

