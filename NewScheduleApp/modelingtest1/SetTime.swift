//
//  SetTime.swift
//  modelingtest1
//
//  Created by 135751E on 2015/02/20.
//  Copyright (c) 2015年 yuta touyama. All rights reserved.
//

import UIKit

class SetTime: UIViewController {
    
    var cnt : Int = 0
    var timer : NSTimer!
    var CountUpPoint : Int = 0
    
    
    @IBOutlet weak var BakckButton: UIButton!
    
    @IBOutlet weak var MyDatePicker: UIDatePicker!
    
    @IBOutlet weak var TimeNow: UILabel!
    
    @IBOutlet weak var SetTimeButton: UIButton!
    
    @IBOutlet weak var HowToGetUp: UIButton!
    
    override func viewDidLoad() {
        
        BakckButton.setTitle("戻る", forState: UIControlState.Normal)
        HowToGetUp.setTitle("BGMを選ぶ", forState: UIControlState.Normal)
        var nowDate = NSDate()
        
        //現在時刻の出力(JPロケール)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .ShortStyle
        println("3")
        //値が変わった際のイベントの実装
        MyDatePicker.addTarget(self, action: "onDidChangeDatePicker:", forControlEvents: .ValueChanged)
        //テキストとして出力
        TimeNow.text = "\(dateFormatter.stringFromDate(nowDate))"
        
        //中央寄せ
        TimeNow.textAlignment = NSTextAlignment.Center
        
        //DatePickerの表示モード設定
        MyDatePicker.datePickerMode = UIDatePickerMode.DateAndTime
        
        let date = NSDateFormatter()
        date.dateFormat = "yyyy/MM/dd hh:mm"
        
        //UIButtonの設定
        SetTimeButton.addTarget(self, action: "SettingTime:", forControlEvents: UIControlEvents.TouchUpInside)
        //タイマーの作成
        timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
        //勝手にタイマーがカウントしないように設定
        timer.invalidate()
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func onDidChangeDatePicker(sender: UIDatePicker){
        //Countしなければならない値のフォーマット
        CountUpPoint = 0
        //選択した日時の分の文字列の取得
        let dfaMinutes = NSDateFormatter()
        dfaMinutes.dateFormat = "mm"
        var dfaMinutesString = dfaMinutes.stringFromDate(sender.date)
        
        //現在時刻の分の文字列の取得
        var nowMinutes = NSDate()
        let formatter1 = NSDateFormatter()
        formatter1.dateFormat = "mm"
        let nowMinutesString = formatter1.stringFromDate(nowMinutes)
        
        //現在時刻と選択した分の数値化
        var IntNowMinutes:Int = nowMinutesString.toInt()!
        var IntSelectMinutes:Int = dfaMinutesString.toInt()!
        var resultMinutes = IntSelectMinutes - IntNowMinutes
        println(resultMinutes)
        
        //選択した日時の時の文字列の取得
        let dfaHour = NSDateFormatter()
        dfaHour.dateFormat = "HH"
        var dfaHourString = dfaHour.stringFromDate(sender.date)
        
        //現在時刻の時の文字列の取得
        var nowHour = NSDate()
        let formatter2 = NSDateFormatter()
        formatter2.dateFormat = "HH"
        let nowHourString = formatter2.stringFromDate(nowHour)
        
        //現在時刻と選択した時の数値化
        var IntNowHour:Int = nowHourString.toInt()!
        var IntSelectHour:Int = dfaHourString.toInt()!
        var resultHour = IntSelectHour - IntNowHour
        println(resultHour)
        
        //選択した日時の日の文字列の取得
        let dfaDay = NSDateFormatter()
        dfaDay.dateFormat = "dd"
        var dfaDayString = dfaDay.stringFromDate(sender.date)
        
        //現在時刻の日の文字列の取得
        var nowDay = NSDate()
        let formatter3 = NSDateFormatter()
        formatter3.dateFormat = "dd"
        let nowDayString = formatter3.stringFromDate(nowDay)
        
        //現在時刻と選択した日の数値化
        var IntNowDay:Int = nowDayString.toInt()!
        var IntSelectDay:Int = dfaDayString.toInt()!
        var resultDay = IntSelectDay - IntNowDay
        println(resultDay)
        
        /*    //選択した日時の月の文字列の取得
        let dfaMonth = NSDateFormatter()
        dfaDay.dateFormat = "MM"
        var dfaMonthString = dfaMonth.stringFromDate(sender.date)
        
        //現在時刻の月の文字列の取得
        var nowMonth = NSDate()
        let formatter4 = NSDateFormatter()
        formatter4.dateFormat = "MM"
        let nowMonthString = formatter3.stringFromDate(nowMonth)
        
        //現在時刻と選択した月の数値化
        var IntNowMonth:Int = nowMonthString.toInt()!
        var IntSelectMonth:Int = dfaMonthString.toInt()!
        var resultMonth = IntSelectMonth - IntNowMonth
        println(resultMonth)
        */
        
        var Days = resultDay * 216000
        var Hours = resultHour * 3600
        var Minutes = resultMinutes * 60
        CountUpPoint = Days + Hours + Minutes
    }
    
    @IBAction func SettingTime(sender: UIButton) {
        //timerが動いてるなら.
        if timer.valid == true {
            
            //timerを破棄する.
            timer.invalidate()
            
            //ボタンのタイトル変更.
            sender.setTitle("設定する。", forState: UIControlState.Normal)
        }
        else{
            //timerを生成する.
            timer = NSTimer.scheduledTimerWithTimeInterval(1, target: self, selector: "onUpdate:", userInfo: nil, repeats: true)
            
            //ボタンのタイトル変更.
            sender.setTitle("目覚ましを止める", forState: UIControlState.Normal)
        }
        
    }
        func onUpdate(timer : NSTimer){
            cnt += 1
            var Count = CountUpPoint - cnt
            println(Count)
            if Count <= 0{
                timer.invalidate()
                println("時間ですよ！")
            }
            //桁数を指定して文字列を作る.
            let str = "Time".stringByAppendingFormat("%d",cnt)
            println(str)
        }
    @IBAction func returnMenu(segue: UIStoryboardSegue){
    }
}
