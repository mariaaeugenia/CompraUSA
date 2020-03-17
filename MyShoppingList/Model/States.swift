
import RealmSwift

class States: Object {
    @objc dynamic var id = ""
    @objc dynamic var name = ""
    @objc dynamic var tax: Double = 0.0
    
    override static func primaryKey() -> String? {
        return "id"
    }
}
