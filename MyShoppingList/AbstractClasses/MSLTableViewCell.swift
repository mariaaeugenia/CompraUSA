//
//  MSLTableViewCell.swift
//  MyShoppingList
//
//  Created by Maria Eugênia Pereira Teixeira on 03/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

open class MSLTableViewCell: UITableViewCell, ViewSetup {
    
    override public init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    open func prepareViews() {}
    open func addViewHierarchy() {}
    open func setupConstraints() {}
    open func configureViews() {}
    open func configureBindings() {}
    
}