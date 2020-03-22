
import UIKit

class ShoppingTableViewController: TableViewController<ShoppingViewModel> {
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        vm.getProducts()
    }
    
    override func configureViews() {
        vm.presenter = self
        configureNavigation()
        let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped(_:)))
        self.navigationItem.rightBarButtonItem = addButton
        configureTableView()
    }
    
    func configureNavigation() {
        self.navigationItem.title = "Lista de Compras"
    }
    
    func configureTableView() {
        tableView.register(ProductTableViewCell.self, forCellReuseIdentifier: "CELL")
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 110
    }

    @objc func addButtonTapped(_ sender: UIBarButtonItem) {
        self.navigationController?.pushViewController(NewProductViewController(), animated: true)
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return vm.productsNumberOfRows
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return vm.cellForRow(tableView: tableView, at: indexPath)
    }

}

extension ShoppingTableViewController: ProductPresentable {
    
    func relodTableView() {
        tableView.reloadData()
    }
}
