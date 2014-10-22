//
//  MenuHeaderView.swift
//  Nippon
//
//  Created by Moshe on 10/19/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import UIKit

class MenuHeaderView : UIView {
    
    var image: UIImageView
    var titleLabel: UILabel
    
    override init(frame: CGRect) {
        
        image = UIImageView(image: UIImage(named: "SushiBanner").imageWithRenderingMode(.AlwaysTemplate))
        image.tintColor = UIColor.whiteColor()
        image.contentMode = UIViewContentMode.ScaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.text = "Nippon"
        titleLabel.textColor = UIColor.whiteColor()
        titleLabel.font = UIFont(name: "Avenir-Light", size: 36.0)
        
        super.init(frame: CGRectMake(0, 0, CGRectGetWidth(UIScreen.mainScreen().bounds), 168))
    }
    
    required init(coder aDecoder: NSCoder) {
        
        image = UIImageView(image: UIImage(named: "SushiBanner").imageWithRenderingMode(.AlwaysTemplate))
        image.tintColor = UIColor.whiteColor()
        image.setTranslatesAutoresizingMaskIntoConstraints(false)
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .Center
        titleLabel.backgroundColor = UIColor.clearColor()
        titleLabel.font = UIFont(name: "Avenir-Light", size: 36.0)
        
        super.init(coder: aDecoder)
    }
    
    override convenience init() {
        self.init(frame: CGRectZero)
    }
    
    /*f
    // Only override drawRect: if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func drawRect(rect: CGRect)
    {
    // Drawing code
    }
    */
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        /**
        *   Define a standard margin.
        */
        
        let margin: CGFloat = 8.0
        
        /**
        *   Constrains for the image
        */
        
        let imageCenterConstraint = NSLayoutConstraint(item: self.image, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        let imageTop = NSLayoutConstraint(item: self.image, attribute: .Top, equalToItem: self.titleLabel, attribute: .Bottom, constant: margin)
        let imageWidthConstraint = NSLayoutConstraint(item: self.image, attribute: .Width, equalToItem: self, attribute: .Width, constant: -80.0)
        
        /**
        *   Constraints for the label - uses our class extension.
        */
        
        let labelCenterConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .CenterX, equalToItem: self, attribute: .CenterX, constant: 0)
        let labelHeightConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .Height, relatedBy: .Equal , toItem: self.image, attribute: .Height, multiplier: 0.8, constant: 1)
        let labelTopConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .Top, equalToItem: self, attribute: .Top, constant: 0)
        
        /**
        *   A constraint for the height of the view.
        */
        
        let imageHeight = CGRectGetHeight(self.image.frame)
        
        /**
        *   Install the views in the hierarchy.
        */
        
        self.addSubview(self.image)
        self.addSubview(self.titleLabel)
        
        /*
        *   Turn off autoresizing-to-layout-constraint conversions.
        */
        
        for view in self.subviews
        {
            view.setTranslatesAutoresizingMaskIntoConstraints(false)
        }
        
        /**
        *   Install the constraints.
        */
        
        let constraintsToAdd = [labelCenterConstraint, labelHeightConstraint, labelTopConstraint, imageTop, imageCenterConstraint, imageWidthConstraint]
        
        for constraint in constraintsToAdd {
            self.addConstraint(constraint)
        }
    }
}
