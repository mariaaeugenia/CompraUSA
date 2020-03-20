//
//  MSLTextField.swift
//  MyShoppingList
//
//  Created by Maria Eugênia Pereira Teixeira on 19/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class MSLTextField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup() {
        borderStyle = .roundedRect
        backgroundColor = .white
    }
}
