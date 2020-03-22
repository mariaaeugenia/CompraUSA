
import Foundation
import UIKit

protocol ProductPresentable: class {
    func relodTableView()
}

class ShoppingViewModel: ViewModel {
    
    let productRepository = ProductRepository()
    var products = [Product]()
    
    var presenter: ProductPresentable?
    
    var productsNumberOfRows: Int {
        get { return products.count }
    }
    
    required init() {
        getProducts()
    }
    
    func viewModelLoad() {
        getProducts()
    }
    
    private func getProducts() {
        productRepository.fetch { [weak self] result in
            self?.products = result
            self?.presenter?.relodTableView()
        }
    }
    
    //MARK: -
    //MARK: - TABLE VIEW
    func cellForRow(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? ProductTableViewCell else { return UITableViewCell() }
        let prod = products[indexPath.row]
        cell.consigureCell(prod: prod)
        return cell
    }
    
    func didSelect(at index: Int) -> Product {
        return products[index]
    }
}
