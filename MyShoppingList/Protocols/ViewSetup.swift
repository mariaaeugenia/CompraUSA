//
//  ViewControllerSetup.swift
//  MyShoppingList
//
//  Created by Maria Eugênia Pereira Teixeira on 03/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

protocol ViewSetup: class {
    func setup()
    func prepareViews()
    func addViewHierarchy()
    func setupConstraints()
    func configureViews()
    func configureBindings()
}

extension ViewSetup {
    func setup() {
        prepareViews()
        addViewHierarchy()
        setupConstraints()
        configureViews()
        configureBindings()
    }
}
