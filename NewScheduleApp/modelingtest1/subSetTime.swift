//
//  subSetTime.swift
//  modelingtest1
//
//  Created by 135751E on 2015/02/20.
//  Copyright (c) 2015年 yuta touyama. All rights reserved.
//

import UIKit
import AVFoundation

class subSetTime: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource,AVAudioPlayerDelegate{

    var myAudioPlayer : AVAudioPlayer!
    
    var music :String?
    
    @IBOutlet weak var myimageview: UIImageView!
    
    @IBOutlet weak var mypickerView: UIPickerView!

    @IBOutlet weak var BackButton: UIButton!
    
    var tea_list = ["おはよう","早く起きて！","もう朝だよ！","起きないと怒っちゃうよ！","おっはー!","今日も一緒にがんばろ！"]
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        BackButton.setTitle("戻る", forState: UIControlState.Normal)
        
        mypickerView.dataSource = self
        mypickerView.delegate = self
        myimageview.image = UIImage(named:"2014-08-07 21.07.08.jpg")
        
        // Do any additional setup after loading the view.
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //-- ピッカービューの列数(1列)
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1;
    }
    
    //-- ピッカービューの行数(tea_listの個数)
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return tea_list.count
    }
    
    //--ピッカービューに表示する文字(tea_list配列の値)
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String! {
        return tea_list[row]
    }
    
    //--ピッカービューで選択されたときに行う処理
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        println("選択されたのは、\(row)行目で、\(tea_list[row])です")
        music = tea_list[row]
    }
    
    @IBAction func onClickButton(sender: UIButton) {
        if(music == "おはよう"){
            var path : String = NSBundle.mainBundle().pathForResource("おはよう", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        
        if(music == "早く起きて！"){
            var path : String = NSBundle.mainBundle().pathForResource("オレンジ", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        
        if(music == "もう朝だよ！"){
            var path : String = NSBundle.mainBundle().pathForResource("空も飛べるはず", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        if(music == "起きないと怒っちゃうよ！"){
            var path : String = NSBundle.mainBundle().pathForResource("告白", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        if(music == "おっはー！"){
            var path : String = NSBundle.mainBundle().pathForResource("等身大のラブソング", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }
        if(music == "今日も一緒にがんばろ！"){
            var path : String = NSBundle.mainBundle().pathForResource("チェリー", ofType: "mp3")!
            var url : NSURL = NSURL.fileURLWithPath(path)!
            self.myAudioPlayer = AVAudioPlayer(contentsOfURL: url, error: nil)
            self.myAudioPlayer!.play()
        }        
    }
}
