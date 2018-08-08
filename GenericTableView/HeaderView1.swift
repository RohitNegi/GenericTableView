//
//  HeaderView1.swift
//  GenericTableView
//
//  Created by Rohit on 8/6/18.
//  Copyright © 2018 Admin. All rights reserved.
//


import UIKit
class HeaderView1: GenericHeaderView{
    var label1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "header title"
        return label
    }()
    var label2: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "header title1"
        return label
    }()
    
    var label3: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "header title2"
        return label
    }()
    
    override func initView() {
        addSubview(label1)
        addSubview(label2)
        addSubview(label3)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        addVisualConstraints(constraints: ["V:|[label1][label2][label3]|", "H:|[label1]|", "H:|[label2]|", "H:|[label3]|"], subViews: ["label1" : label1, "label2": label2, "label3": label3])
    }
    override func updateHeader() {
        label1.text = data
        label2.text = "Second Label Header"
        label3.text = "Third Label Header"
        layoutIfNeeded()
    }
}
