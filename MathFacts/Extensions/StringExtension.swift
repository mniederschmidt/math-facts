import Foundation

extension String {

    func trimWhiteSpace() -> String {
        return self.trimmingCharacters(in: CharacterSet(charactersIn: " "))
    }
    
}
