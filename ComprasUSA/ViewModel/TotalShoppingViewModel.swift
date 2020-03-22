
import Foundation

protocol TotalShoppingPresentable: class {
    func presentTotalDolar(total: String)
    func presentTotalReal(total: String)
}

class TotalShoppingViewModel: ViewModel {
    
    let productRepository = ProductRepository()
    
    var presenter: TotalShoppingPresentable?
    
    let dollarCurrency = Constants.Settings.dollarCurrency.getDoubleValue()
    let iof = Constants.Settings.iof.getDoubleValue()
    
    required init() {}
    
    func viewModelLoad() {
        getAllProducts()
    }
    
    private func getAllProducts() {
        productRepository.fetch { [weak self] result in
            self?.getTotalDollar(for: result)
            self?.getTotalReal(for: result)
        }
    }
    
    func getTotalDollar(for products: [Product]) {
        var totalDollar = 0.0
        for prod in products {
            let tax = 1 + (prod.state?.tax ?? 0)/100
            totalDollar = totalDollar + prod.value*tax
        }
        let strDollar = totalDollar.getDollarCurrency().replacingOccurrences(of: "$", with: "")
        presenter?.presentTotalDolar(total: strDollar)
    }
    
    func getTotalReal(for products: [Product]) {
        var totalReal = 0.0
        for prod in products {
            let tax = 1 + (prod.state?.tax ?? 0)/100
            let dollar = prod.value*tax
            totalReal = dollar*dollarCurrency
            if prod.isCreditCard {
                totalReal = totalReal*iof
            }
        }
        let strReal = totalReal.getRealCurrency().replacingOccurrences(of: "R$", with: "")
        presenter?.presentTotalReal(total: strReal)
    }
    
}
