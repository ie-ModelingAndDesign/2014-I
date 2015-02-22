//
//  SetTime.swift
//  modelingtest1
//
//  Created by 135751E on 2015/02/20.
//  Copyright (c) 2015年 yuta touyama. All rights reserved.
//
import UIKit

class SetTime: UIViewController {
    var CountSegue: Int = 0
    var cnt : Int = 0

    var NowTimeUpdate : NSTimer! //現在時刻更新用の変数
    
    var CountUpPoint : Int = 0
    
    @IBOutlet weak var SetButton: UIButton!
    
    @IBOutlet weak var MyDatePicker: UIDatePicker!
    
    @IBOutlet weak var TimeNow: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //UIButtonの設定
        SetButton.addTarget(self, action: "SetButton:", forControlEvents: UIControlEvents.TouchUpInside)
        
        //値が変わった際のイベントの実装
        MyDatePicker.addTarget(self, action: "onDidChangeDatePicker:", forControlEvents: .ValueChanged)
        
        //DatePickerの表示モード設定
        MyDatePicker.datePickerMode = UIDatePickerMode.DateAndTime
        
        let date = NSDateFormatter()
        date.dateFormat = "yyyy/MM/dd hh:mm"
        
        //現在時刻更新用
        NowTimeUpdate = NSTimer.scheduledTimerWithTimeInterval(1/60, target: self, selector: "UpdateTime", userInfo: nil, repeats: true)
      }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //subSetTime.swiftに値を渡す操作
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
        if (segue.identifier == "TimeSegue") {
            let next: subSetTime = segue.destinationViewController as subSetTime
            next.CountUpPoint = CountUpPoint
            next.CountSegue = CountSegue
        }
    }
    
    func UpdateTime(){
        var nowDate = NSDate()
        
        //現在時刻の出力(JPロケール)
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "yyyy/MM/dd hh:mm"
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP")
        dateFormatter.timeStyle = .ShortStyle
        dateFormatter.dateStyle = .ShortStyle
        //テキストとして出力
        TimeNow.text = "\(dateFormatter.stringFromDate(nowDate))"
        
        //中央寄せ
        TimeNow.textAlignment = NSTextAlignment.Center
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
        
        var Days = resultDay * 216000
        var Hours = resultHour * 3600
        var Minutes = resultMinutes * 60
        CountUpPoint = Days + Hours + Minutes
    }
    
    
    @IBAction func SetButton(sender: UIButton) {
        
            }
}
