
import Foundation
import RealmSwift

struct ProductRepository: Repository {
    
    typealias T = Product
    let realm = try! Realm()
    
    func save(object: Product) {
        try! realm.write {
            realm.add(object)
        }
    }
    
    func fetch(completion: @escaping (([Product]) -> Void)) {
        let result = realm.objects(Product.self).toArray(type: Product.self)
        completion(result)
    }
    
    func delete(object: Product) {
        realm.delete(object)
    }
    
    func update(object: Product) {
        try! realm.write {
            realm.add(object, update: .modified)
        }
    }
}
