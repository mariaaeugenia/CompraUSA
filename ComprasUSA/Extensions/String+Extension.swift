
import Foundation

extension String {
    func getDoubleValue() -> Double {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.minimumFractionDigits = 2
        formatter.maximumFractionDigits = 2
        if let number = formatter.number(from: self), let double = Double(exactly: number) {
            return double
        }
        return 0
    }
}
