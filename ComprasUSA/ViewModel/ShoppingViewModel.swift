
import Foundation

class ShoppingViewModel: ViewModel {
    
    let productRepository = ProductRepository()
    var products = [Product]()
    
    var productsNumberOfRows: Int {
        get { return products.count }
    }
    
    required init() {
        getProducts()
    }
    
    private func getProducts() {
        productRepository.fetch { [weak self] result in
            self?.products = result
        }
    }
}
