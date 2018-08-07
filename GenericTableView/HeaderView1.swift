//
//  HeaderView1.swift
//  GenericTableView
//
//  Created by Chetu on 8/6/18.
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
        addVisualConstraints(constraints: ["V:|-5-[label1]-5-[label2]-5-[label3]-5-|", "H:|-10-[label1]-10-|", "H:|-10-[label2]-10-|", "H:|-10-[label3]-10-|"], subViews: ["label1" : label1, "label2": label2, "label3": label3])
    }
    override func updateHeader() {
        label1.text = data
        label2.text = "Second Label Header"
        label3.text = "Third Label Header"
        layoutIfNeeded()
    }
}
