
import Foundation


class AdjustsViewModel: MSLViewModel {
    
    let stateRepository = StateReposioty()
    
    required init() {}
    
    func saveState(state: String, tax: String) {
        let stateObj = State()
        stateObj.name = state
        stateObj.tax = tax.getDoubleValue()
        stateRepository.save(object: stateObj)
    }
}
