//
//  ConvenientConstraints.swift
//  Nippon
//
//  Created by Moshe on 10/20/14.
//  Copyright (c) 2014 Moshe Berman. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    
    /**
    *   A convenience initializer to shorten calls to init.
    *   Assumes a relation of .Equal, a multiplier of 1.0.
    */
    
    convenience init(item view1: AnyObject, attribute attr1: NSLayoutAttribute, equalToItem view2: AnyObject?, attribute attr2: NSLayoutAttribute, constant c: CGFloat) {
        
        self.init(item: view1, attribute: attr1, relatedBy: .Equal, toItem: view2, attribute: attr2, multiplier: 1.0, constant: c);
    }
    
    /**
    *   A convenience initializer to shorten calls to init.
    *   Assumes a relation of .Equal, a multiplier of 1.0,
    *   and a constant of zero.
    */
    
    convenience init(item view1: AnyObject, attribute attr1: NSLayoutAttribute, equalToItem view2: AnyObject?, attribute attr2: NSLayoutAttribute) {
    
        self.init(item: view1, attribute: attr1, relatedBy: .Equal, toItem: view2, attribute: attr2, multiplier: 1.0, constant: 0);
    }
}