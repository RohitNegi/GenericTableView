//
//  HeaderView2.swift
//  GenericTableView
//
//  Created by Chetu on 8/6/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
class HeaderView2: GenericHeaderView{
    var label1: UILabel = {
        let label = UILabel()
        label.backgroundColor = UIColor.green
        label.numberOfLines = 0
        label.lineBreakMode = .byWordWrapping
        label.text = "header title123"
        return label
    }()

    override func initView() {
        self.clipsToBounds = true
        addSubview(label1)
    }

    override func layoutSubviews() {
        super.layoutSubviews()
        self.addVisualConstraints(constraints: ["H:|[label1]|", "V:|[label1]|"], subViews: ["label1": label1])
    }
    override func updateHeader() {
        self.label1.text = data
        layoutIfNeeded()
    }
}
