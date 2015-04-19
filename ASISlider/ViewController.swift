//
//  ViewController.swift
//  ASISlider
//
//  Created by 井上 龍一 on 2015/04/19.
//  Copyright (c) 2015年 井上 龍一. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        testSlider()
        initSlider()
        
        // Do any additional setup after loading the view.
    }
    
    func initSlider(){
        var screen=UIScreen.mainScreen().bounds
        var slider=ArrowStyleIndicatorSlider(frame: CGRectMake(0, 0, screen.width-60, 50))
        
        slider.maximumValue=13
        slider.minimumValue=0
        slider.value=13/2
        
        slider.backgroundColor=UIColor.redColor()
        slider.thumbTintColor=UIColor.whiteColor()
        slider.maximumTrackTintColor=UIColor.whiteColor()
        slider.minimumTrackTintColor=UIColor.whiteColor()
        
        slider.indicatorView.label.text="PM 2:00"
        slider.indicatorView.backgroundColor=UIColor.lightGrayColor()
        
        slider.center=self.view.center
        slider.frame.origin.y += 100
        self.view.addSubview(slider)
        slider.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
    
    func testSlider(){
        var screen=UIScreen.mainScreen().bounds
        var slider=ArrowStyleIndicatorSlider(frame: CGRectMake(0, 0, screen.width-60, 50))
        slider.maximumValue=13
        slider.minimumValue=0
        slider.value=13/2
        slider.center=self.view.center
        self.view.addSubview(slider)
    }
    
    func valueChanged(sender:ArrowStyleIndicatorSlider){
        var thumb=sender.subviews[3] as! UIView
        sender.indicatorView.center.x = thumb.center.x
        
        var value=Int(roundf(sender.value))
        var str = (value < 4) ? "AM \(value+9):00" : "PM \(value-4):00"
        sender.indicatorView.label.text=str
    }


}

