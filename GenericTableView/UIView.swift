//
//  UIView.swift
//  GenericTableView
//
//  Created by Rohit on 7/26/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

extension UIView{
    func addVisualConstraints( constraints: [String], subViews: [String: UIView]){
        addVisualConstraints(constraints: constraints, metrics: nil, subViews: subViews)
    }
    
    func addVisualConstraints(constraints: [String], metrics: [String: Any]?, subViews: [String: UIView]){
        //disable autorizing mask
        for subview in subViews.values{
            if subview.responds(to: #selector(setter: self.translatesAutoresizingMaskIntoConstraints)){
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
        }
        //apply all constraints
        for constraint in constraints{
            addConstraints(NSLayoutConstraint.constraints(withVisualFormat: constraint, options: [], metrics: metrics, views: subViews))
        }
    }

    func addFixedLeadingTrailingAnchorConstraints(views:[UIView], constant: CGFloat){
        //disable autorizing mask
        disableAutorizingMask(views: views)
        for view in views{
            NSLayoutConstraint.activate([view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: constant)])
        }
    }
    
    func addConstraintToFillSuperview() {
        superview?.addVisualConstraints(constraints: ["H:|[self]|", "V:|[self]|"], subViews: ["self": self])
    }
    
    func disableAutorizingMask(views: [UIView]) {
        for subview in views{
            if subview.responds(to: #selector(setter: self.translatesAutoresizingMaskIntoConstraints)){
                subview.translatesAutoresizingMaskIntoConstraints = false
            }
        }
    }
}
