//
//  MenuTableViewCell.swift
//  Nippon
//
//  Created by Moshe on 10/19/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import UIKit

class MenuTableViewCell: UITableViewCell {

    @IBOutlet weak var primaryLabel: UILabel?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        self.primaryLabel?.sizeToFit()
        
        if let bounds = self.primaryLabel?.bounds {
            self.primaryLabel?.layer.cornerRadius = CGRectGetHeight(bounds) / 2.0
        }
        self.primaryLabel?.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if animated {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.setTapped(selected)
            })
        }
        else
        {
            self.setTapped(selected)
        }
    }
    
    override func setHighlighted(highlighted: Bool, animated: Bool) {
        if animated {
            UIView.animateWithDuration(0.3, animations: { () -> Void in
                self.setTapped(highlighted)
            })
        }
        else
        {
            self.setTapped(highlighted)
        }
    }
    
    func setTapped(tapped: Bool) {
        
        var backgroundColor = UIColor.clearColor()
        var titleColor = UIColor.whiteColor()
        var subtitleColor = UIColor.lightGrayColor()
        var labelBackgrounColor = UIColor.clearColor()
        
        if tapped {
            labelBackgrounColor = UIColor(white: 0.885, alpha: 0.6)
            subtitleColor = titleColor.colorWithAlphaComponent(0.5)
        }
        
        self.backgroundColor = backgroundColor

        self.primaryLabel?.textColor = titleColor
        self.primaryLabel?.backgroundColor = labelBackgrounColor;
        
    }
}
