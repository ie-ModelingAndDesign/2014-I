//
//  ViewController.swift
//  modelingtest1
//
//  Created by yuta touyama on 2014/11/19.
//  Copyright (c) 2014年 yuta touyama. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController,AVAudioPlayerDelegate{
    var myAudioPlayer : AVAudioPlayer!
    
    var music:String?
    
    var chiida: Int = 0
    
    var timer : NSTimer!
    
    var CountSegue: Int = 0
    
    @IBOutlet weak var myButton: UIButton!
    
    @IBOutlet weak var MyImageView: UIImageView!
    
    @IBOutlet weak var Zatugaku: UILabel!
    
    var zatu = ["ひょっこりひょうたん島は死後の世界","ジャイ子には本名がない","ウナギが黒いのは日焼けのしすぎ","アイスクリームには「賞味期限がない」","サザエさんには２人目の子どもがいる","ボルトは時速約38キロで走れる","ドラミちゃんの職業は大学教授","人間の脳の容量はBDで250枚分","カンチョーは暴行罪","マネキンと結婚した男性がいる"]
    var CountUpPoint: Int = 0
    var cnt: Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //var CountUpPoint: Int = 0
        var chiida = Int(arc4random()) % 3
        
        if chiida == 0 && CountSegue == 0{
            var path : String = NSBundle.mainBundle().pathForResource("chiida1", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        if chiida == 1 && CountSegue == 0{
            var path : String = NSBundle.mainBundle().pathForResource("chiida2", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        if chiida==2 && CountSegue == 0{
            var path : String = NSBundle.mainBundle().pathForResource("chiida3", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        
        //タイマーの作成
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        
        println("CountUpPoint:\(CountUpPoint)")
        
        Zatugaku.textColor = UIColor.blackColor()
        var zp = Int(arc4random()) % 10
        Zatugaku.text = zatu[zp]
        myButton.setTitle("通知したい日時を設定する", forState: UIControlState.Normal)
        MyImageView.image = UIImage(named:"img2.png")
        
        var calenderView:CalenderView = CalenderView(frame: CGRectMake(0, 20,
        UIScreen.mainScreen().bounds.size.width, 500));
        self.view.addSubview(calenderView)
    }
    
   
    @IBAction func TapButton(sender: AnyObject) {
        CountSegue += 1
        println("\(CountSegue)")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
      }
    
    func onUpdate(timer : NSTimer){
        cnt += 1
        var Count = CountUpPoint - cnt
        println(Count)
        
        if(Count <= 0 && CountSegue != 0){
            if(music == nil){
                var path : String = NSBundle.mainBundle().pathForResource("まろ1", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }

            
            if(music == "イケメンボイス1"){
                var path : String = NSBundle.mainBundle().pathForResource("まろ1", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }
            
            if(music == "イケメンボイス2"){
                var path : String = NSBundle.mainBundle().pathForResource("まろ2", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }
            
            if(music == "イケメンボイス3"){
                var path : String = NSBundle.mainBundle().pathForResource("まろ3", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }
            if(music == "イケメンボイス4"){
                var path : String = NSBundle.mainBundle().pathForResource("まろ4", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }
            if(music == "イケメンボイス5"){
                var path : String = NSBundle.mainBundle().pathForResource("まろ5", ofType: "mp3")!
                var url : NSURL = NSURL.fileURLWithPath(path)!
                self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
                self.myAudioPlayer!.play()
            }
        }
        
          if Count <= 0 {
            cnt = 0
            //CountUpPoint = 0
            timer.invalidate()
            if CountSegue != 0 {
            //アラート作成・呼び出し
            var alertController = UIAlertController(
                title: "まろさんからお知らせ",
                message: "約束の時間が来たようだ",
                preferredStyle: UIAlertControllerStyle.Alert)
            
            alertController.addAction(UIAlertAction(
                title: "OK",
                style: .Default,
                handler:{action in self.myOK() } ))
            presentViewController(alertController, animated: true, completion: nil)
            }
            
        }//桁数を指定して文字列を作る.
        let str = "Time".stringByAppendingFormat("%d",cnt)
        println(str)
    }
    
    //OKが選択された時の処理
    func myOK() {
        //self.myAudioPlayer.stop()
        println("ok")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "PointSegueHome") {
            let Next: SetTime = segue.destinationViewController as SetTime
            Next.CountSegue = CountSegue
        }
    }
    
    @IBAction func returnMenu(segue: UIStoryboardSegue){
    }
}

