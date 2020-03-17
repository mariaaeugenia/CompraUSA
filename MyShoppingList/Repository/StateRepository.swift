
import Foundation
import RealmSwift

struct StateReposioty: Repository {
    
    typealias T = States
    let realm = try! Realm()
    
    func save(object: States) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func fetch(completion: @escaping (([States]) -> Void)) {
        let result = realm.objects(States.self).toArray(type: States.self)
        let sortedByName = result.sorted { $0.name.lowercased() < $1.name.lowercased() }
        completion(sortedByName)
    }
    
    func delete(object: States) {
        try! realm.write {
            realm.delete(object)
        }
    }
}
