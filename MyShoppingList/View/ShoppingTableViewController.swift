//
//  ShoppingTableViewController.swift
//  MyShoppingList
//
//  Created by Maria Eugênia Pereira Teixeira on 03/03/20.
//  Copyright © 2020 Maria Eugênia Pereira Teixeira. All rights reserved.
//

import UIKit

class ShoppingTableViewController: UITableViewController {
    

    override func viewDidLoad() {
        super.viewDidLoad()
        configureNavigation()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = addButton
    }
    
    func configureNavigation() {
        self.navigationItem.title = "Lista de Compras"
    }

    @objc func addButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(NewProductViewController(), animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 0
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

}
