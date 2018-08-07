//
//  GenericHeaderView.swift
//  GenericTableView
//
//  Created by Chetu on 8/6/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit
class GenericHeaderView: UITableViewHeaderFooterView {
    
    var data: String?{
        didSet{
           updateHeader()
        }
    }
    override init(reuseIdentifier: String?) {
        super.init(reuseIdentifier: reuseIdentifier)
        initView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
    }
    func initView(){
        
    }
    func updateHeader(){}
}
