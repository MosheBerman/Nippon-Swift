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
        
        image = UIImageView(image: UIImage(named: "SushiBanner")!.withRenderingMode(.alwaysTemplate))
        image.tintColor = UIColor.white
        image.contentMode = UIViewContentMode.scaleAspectFit
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.text = "Nippon"
        titleLabel.textColor = UIColor.white
        titleLabel.font = UIFont(name: "Avenir-Light", size: 36.0)
        
        super.init(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 168))
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        image = UIImageView(image: UIImage(named: "SushiBanner")!.withRenderingMode(.alwaysTemplate))
        image.tintColor = UIColor.white
        image.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel = UILabel()
        titleLabel.textAlignment = .center
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.font = UIFont(name: "Avenir-Light", size: 36.0)
        
        super.init(coder: aDecoder)
    }
    
    convenience init() {
        self.init(frame: CGRect.zero)
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
        
        let imageCenterConstraint = NSLayoutConstraint(item: self.image, attribute: .centerX, relatedBy: .equal, toItem: self, attribute: .centerX, multiplier: 1, constant: 0)
        let imageTop = NSLayoutConstraint(item: self.image, attribute: .top, equalToItem: self.titleLabel, attribute: .bottom, constant: margin)
        let imageWidthConstraint = NSLayoutConstraint(item: self.image, attribute: .width, equalToItem: self, attribute: .width, constant: -80.0)
        
        /**
        *   Constraints for the label - uses our class extension.
        */
        
        let labelCenterConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .centerX, equalToItem: self, attribute: .centerX, constant: 0)
        let labelHeightConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .height, relatedBy: .equal , toItem: self.image, attribute: .height, multiplier: 0.8, constant: 1)
        let labelTopConstraint = NSLayoutConstraint(item: self.titleLabel, attribute: .top, equalToItem: self, attribute: .top, constant: 16)
        
        /**
        *   A constraint for the height of the view.
        */
        
        let imageHeight = self.image.frame.height
        
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
            view.translatesAutoresizingMaskIntoConstraints = false
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
