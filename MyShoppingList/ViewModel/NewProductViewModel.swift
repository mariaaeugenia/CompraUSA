
import Foundation

class NewProductViewModel: MSLViewModel {
    
    var states = [States]()
    var selectedState = States()
    
    var statesNumberOfRows: Int {
        get { return states.count }
    }
    
    required init() {}
    
    func save(product: Product, completion: (() -> Void)) {
        let manager = ProductRepository()
        let newProduct = product
        newProduct.state = selectedState
        manager.save(object: newProduct)
    }
    
    func getState() {
        let manager = StateReposioty()
        manager.fetch { [weak self] result in
            self?.states = result
        }
    }
    
    func didSelectState(at index: Int) {
        selectedState = states[index]
    }
    
}
