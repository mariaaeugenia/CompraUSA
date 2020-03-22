
import Foundation
import UIKit

class NewProductViewModel: ViewModel {
    
    var states = [State]()
    var selectedState = State()
    
    var statesNumberOfRows: Int {
        get { return states.count }
    }
    
    required init() {
        getState()
    }
    
    func save(product: Product, completion: (() -> Void)) {
        let manager = ProductRepository()
        let newProduct = product
        newProduct.state = selectedState
        manager.save(object: newProduct)
        completion()
    }
    
    private func getState() {
        let manager = StateReposioty()
        manager.fetch { [weak self] result in
            self?.states = result
        }
    }
    
    func didSelectState(at index: Int) {
        if states.count > 0 && index < states.count{
            selectedState = states[index]
        }
    }
    
    func getStateNameSelected() -> String {
        return selectedState.name
    }
    
}
