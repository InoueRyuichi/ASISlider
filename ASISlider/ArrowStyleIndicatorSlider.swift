//
//  ArrowStyleIndicatorSlider.swift
//  Flamingo
//
//  Created by 井上 龍一 on 2015/04/19.
//  Copyright (c) 2015年 井上 龍一. All rights reserved.
//

import UIKit

class ArrowStyleIndicatorSlider: UISlider {
    
    var indicatorView:ArrowStyleLabelView!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonSetting()
        
        indicatorView=ArrowStyleLabelView(frame: CGRectMake(0, -48, 88, 55))
        indicatorView.center.x=self.center.x
        self.addSubview(indicatorView)
    }
    
    init(frame: CGRect, indicatorSize:CGSize, indicatorRadii:CGFloat, arrowHeight:CGFloat) {
        super.init(frame: frame)
        commonSetting()
        
        indicatorView=ArrowStyleLabelView(frame: CGRectMake(0, self.center.y-indicatorSize.height-18, indicatorSize.width, indicatorSize.height), cornerRadii: indicatorRadii, arrowHeight: arrowHeight)
        indicatorView.center.x=self.center.x
        self.addSubview(indicatorView)
    }
    
    func commonSetting(){
        self.clipsToBounds=false
        self.addTarget(self, action: "valueChanged:", forControlEvents: UIControlEvents.ValueChanged)
    }
   
    func valueChanged(sender:UISlider){
        var thumb=self.subviews[3] as! UIView
        indicatorView.center.x = thumb.center.x
        indicatorView.label.text="\(value)"
    }
}
