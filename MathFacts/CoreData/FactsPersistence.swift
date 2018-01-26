import Foundation
import CoreData

class FactsPersistence {
    let coreDataManager: CoreDataManager
    
    init(coreDataManager: CoreDataManager) {
        self.coreDataManager = coreDataManager
    }
    
    func student(firstName: String, lastName: String) -> Student? {
        let request: NSFetchRequest<Student> = Student.fetchRequest()
        request.predicate = NSPredicate(format: "firstName = %@", firstName)
        request.sortDescriptors = [NSSortDescriptor.init(key: "firstName", ascending: true)]
        
        do {
            let results = try coreDataManager.persistentContainer.viewContext.fetch(request)
            if results.isEmpty {
                return nil
            }
            if results.count > 1 {
                print("More than one deck found for fetch: \(request.predicate!.predicateFormat)")
                return nil
            }
            return results.first
        } catch {
            print(error)
            return nil
        }
    }
    
    func studentFact(factType: String, operand1: Int32, operand2: Int32) -> StudentFact? {
        let request: NSFetchRequest<StudentFact> = StudentFact.fetchRequest()
        // TODO:  Figure out how to write compound predicate
        request.predicate = NSPredicate(format: "operand1 = %@", operand1)
        request.sortDescriptors = [NSSortDescriptor.init(key: "operand1", ascending: true)]
        
        do {
            let results = try coreDataManager.persistentContainer.viewContext.fetch(request)
            if results.isEmpty {
                return nil
            }
            if results.count > 1 {
                print("More than one fact found for fetch: \(request.predicate!.predicateFormat)")
                return nil
            }
            return results.first
        } catch {
            print(error)
            return nil
        }
    }

//    func createMathFact(factType: String, operand1: Int16, operand2: Int16) {
//        // Make sure math fact does not already exist
//        if StudentFact(factType: factType, operand1: operand1, operand2: operand2) != nil {
//            return
//        }
//        // context is like a scratch pad
//        let context = coreDataManager.persistentContainer.viewContext
//        let newFact = StudentFact(context: context)
//        newFact.operation = factType
//        newFact.operand1 = operand1
//        newFact.operand2 = operand2
//        //        print(context.insertedObjects)
//        coreDataManager.saveContext()
//    }
    
//    func getFact() -> MathFact? {
////        let mathFact = MathFact(context: coreDataManager.persistentContainer.viewContext)
////        mathFact.
//    }
}
