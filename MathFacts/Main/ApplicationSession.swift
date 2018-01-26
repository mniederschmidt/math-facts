import Foundation

class ApplicationSession {
    
    let userPersistence: UserPersistence
    let studentPersistence: StudentPersistence
    let mathFactsPersistence: FactsPersistence
    
    init() {
        let coreDataManager = CoreDataManager()
        self.userPersistence = UserPersistence(coreDataManager: coreDataManager)
        self.mathFactsPersistence = FactsPersistence(coreDataManager: coreDataManager)
        self.studentPersistence = StudentPersistence(coreDataManager: coreDataManager)
    }
    
    private var _username: String?
    var username: String? {
        get { return _username}
        set {
            if !isUserLoggedIn { _username = newValue}
        }
    }
    
    private var _isUserLoggedIn: Bool = false
    var isUserLoggedIn: Bool {
        return _isUserLoggedIn
    }
    
    // TODO: Not sure if this code will work
    func attemptLogin(_ complete: (Bool) -> Void) {
        _isUserLoggedIn = true
        complete(isUserLoggedIn)
    }
}
