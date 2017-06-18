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
            self.primaryLabel?.layer.cornerRadius = bounds.height / 2.0
        }
        self.primaryLabel?.clipsToBounds = true
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
        
        if animated {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.setTapped(selected)
            })
        }
        else
        {
            self.setTapped(selected)
        }
    }
    
    override func setHighlighted(_ highlighted: Bool, animated: Bool) {
        if animated {
            UIView.animate(withDuration: 0.3, animations: { () -> Void in
                self.setTapped(highlighted)
            })
        }
        else
        {
            self.setTapped(highlighted)
        }
    }
    
    func setTapped(_ tapped: Bool) {
        
        let backgroundColor = UIColor.clear
        let titleColor = UIColor.white
        var subtitleColor = UIColor.lightGray
        var labelBackgrounColor = UIColor.clear
        
        if tapped {
            labelBackgrounColor = UIColor(white: 0.885, alpha: 0.6)
            subtitleColor = titleColor.withAlphaComponent(0.5)
        }
        
        self.backgroundColor = backgroundColor

        self.primaryLabel?.textColor = titleColor
        self.primaryLabel?.backgroundColor = labelBackgrounColor;
        
    }
}
