//
//  NewProductViewController.swift
//  MyShoppingList
//
//  Created by Maria Eugênia Pereira Teixeira on 03/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class NewProductViewController: MSLViewController {

    private var productTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    //MARK: -
    //MARK: - VIEW CODE LIFE CYCLE
    override func prepareViews() {
        productTextField = .init()
    }
    
    override func addViewHierarchy() {
        view.addSubviews([
            productTextField
        ])
    }
    override func setupConstraints() {}
    override func configureViews() {}
    override func configureBindings() {}
    
}
