//
//  ViewController.swift
//  Aquarium
//
//  Created by Yukinaga Azuma on 2014/09/20.
//  Copyright (c) 2014年 Yukinaga Azuma. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let sEManager: SEManager = SEManager()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func fishTapped(sender:UIButton) {
        var transform:CGAffineTransform
        var duration:Double
        var sEName:String
        
        switch sender.tag{
        //マンボウの動き
        case 1:
            //変形を指定（この場合は回転）
            transform = CGAffineTransformMakeRotation(CGFloat(0.25*M_PI))
            //アニメーションの所要時間を指定
            duration = 1.0
            //再生する音声ファイルの指定
            sEName = "1.mp3"
        //ハリセンボンの動き
        case 2:
            transform = CGAffineTransformMakeScale(1.5, 1.5)
            duration = 1.2
            sEName = "2.mp3"
        //アカネハナダイの動き
        case 3:
            transform = CGAffineTransformMakeTranslation(0, -50)
            duration = 0.6
            sEName = "3.mp3"
        //シュモクザメの動き
        default:
            transform = CGAffineTransformMakeScale(0.75, 0.75)
            duration = 0.8
            sEName = "4.mp3"
        }
        
        UIView.animateWithDuration(duration, animations: { () -> Void in
            sender.transform = transform
        })
        { (Bool) -> Void in
            UIView.animateWithDuration(duration, animations: { () -> Void in
                sender.transform = CGAffineTransformIdentity
                })
                { (Bool) -> Void in
                    
            }
        }
        
        sEManager.play(soundName: sEName)
    }
}

