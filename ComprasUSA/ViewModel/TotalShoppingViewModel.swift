
import Foundation

protocol TotalShoppingPresentable: class {
    func presentTotalDolar(total: String)
    func presentTotalReal(total: String)
}

class TotalShoppingViewModel: ViewModel {
    
    let productRepository = ProductRepository()
    
    var presenter: TotalShoppingPresentable?
    
    required init() {}
    
    private func getAllProducts() {
        productRepository.fetch { [weak self] result in
            self?.getTotalDollar(for: result)
            self?.getTotalReal(for: result)
        }
    }
    
    func getTotalDollar(for products: [Product]) {
        var totalDollar = 0.0
        for prod in products {
            totalDollar = totalDollar + prod.value
        }
    }
    
    func getTotalReal(for products: [Product]) {
        var totalReal = 0.0
        for prod in products {
            totalReal = totalReal + prod.value
        }
    }
    
}
