//
//  ArrowStyleLabelView.swift
//  Flamingo
//
//  Created by 井上 龍一 on 2015/04/19.
//  Copyright (c) 2015年 井上 龍一. All rights reserved.
//

import UIKit

class ArrowStyleLabelView: UIView {

    var arrowHeight:CGFloat=10.0
    var cornerRadii:CGFloat=3.0
    var label:UILabel!
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor=UIColor.cyanColor()
        self.clipsToBounds=true
        setMaskLayer()
        
        label=UILabel(frame: CGRectMake(4, 0, frame.width-8, frame.height-arrowHeight))
        label.textAlignment=NSTextAlignment.Center
        self.addSubview(label)
    }
    
    init(frame: CGRect, cornerRadii:CGFloat, arrowHeight:CGFloat) {
        super.init(frame: frame)
        self.cornerRadii=cornerRadii
        self.arrowHeight=arrowHeight
    }
    
    func initMaskPath() ->UIBezierPath {
        var maskSize=self.bounds
        maskSize.size.height -= arrowHeight
        
        var maskPath=UIBezierPath(roundedRect: maskSize, byRoundingCorners:UIRectCorner.AllCorners, cornerRadii: CGSizeMake(cornerRadii, cornerRadii))
        
        maskPath.moveToPoint(CGPointMake(cornerRadii, frame.height-arrowHeight))
        maskPath.addLineToPoint(CGPointMake(frame.width/2, frame.height))
        maskPath.addLineToPoint(CGPointMake(frame.width - cornerRadii, frame.height-arrowHeight))
        
        return maskPath
    }
    
    func setMaskLayer(){
        var maskLayer=CAShapeLayer()
        maskLayer.frame=self.bounds
        maskLayer.path=initMaskPath().CGPath
        self.layer.mask=maskLayer
    }
}
