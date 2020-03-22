
import Foundation
import UIKit

protocol AdjustPresentable: class {
    func deleteRow(at index: Int)
    func reloadTableView()
}

class AdjustsViewModel: ViewModel {
    
    let stateRepository = StateReposioty()
    var states = [State]()
    
    var statesNumberOfRows: Int {
        get { return states.count }
    }
    
    var presenter: AdjustPresentable?
    
    required init() {
        getStates()
    }
    
    //MARK: -
    //MARK: - REQUEST
    private func getStates() {
        stateRepository.fetch { [weak self] result in
            self?.states = result
            self?.presenter?.reloadTableView()
        }
    }
    
    func saveState(state: String, tax: String) {
        let stateObj = State()
        stateObj.name = state
        stateObj.tax = tax.getDoubleValue()
        stateRepository.save(object: stateObj)
        getStates()
    }
    
    func deleteState(at index: Int) {
        let state = states[index]
        states.remove(at: index)
        presenter?.deleteRow(at: index)
        stateRepository.delete(object: state)
    }
    
    //MARK: -
    //MARK: - TABLE VIEW
    func cellForRow(tableView: UITableView, at indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CELL", for: indexPath) as? StateTableViewCell else { return UITableViewCell() }
        let state = states[indexPath.row]
        cell.consigureCell(state: state)
        return cell
    }
}
