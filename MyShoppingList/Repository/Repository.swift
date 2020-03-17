
import Foundation

protocol Repository {
    associatedtype T
    func save(object: T)
    func fetch(completion: @escaping(([T]) -> Void))
    func delete(object: T)
}
