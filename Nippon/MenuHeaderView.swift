//
//  MenuHeaderView.swift
//  Nippon
//
//  Created by Moshe on 10/19/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    
    var icon: UIImageView
    
    override init(frame: CGRect) {
        icon = UIImageView(image: UIImage(named: "Icon"))
        icon.setTranslatesAutoresizingMaskIntoConstraints(false)
        icon.clipsToBounds = true
        icon.layer.cornerRadius = 10.0/57.0*100.0

        
        super.init(frame: CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), 100))
    }
    
    required init(coder aDecoder: NSCoder) {
        icon = UIImageView(image: UIImage(named: "Icon"))
        icon.layer.cornerRadius = 10.0/57.0*100.0
        icon.clipsToBounds = true
        
        super.init(coder: aDecoder)
    }
    
    override convenience init() {
        self.init(frame: CGRectZero)
    }
    
    /*
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.addSubview(self.icon)

        
        /**
        *
        */
        
        let heightConstraint = NSLayoutConstraint(item: self.icon, attribute: .Width, relatedBy: .Equal, toItem: self.icon, attribute: .Height, multiplier: 1, constant: 0)
        let widthConstraint = NSLayoutConstraint(item: self.icon, attribute: .Height, relatedBy: .Equal, toItem: nil, attribute: .NotAnAttribute, multiplier: 1, constant: CGRectGetHeight(self.frame)*4/5)
        let centerHorizontalConstraint = NSLayoutConstraint(item: self.icon, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let centerVerticalConstraint = NSLayoutConstraint(item: self.icon, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        
        /**
        *
        */
        
        self.addConstraint(heightConstraint)
        self.addConstraint(widthConstraint)
        self.addConstraint(centerHorizontalConstraint)
        self.addConstraint(centerVerticalConstraint)
        
    }
}
