import UIKit
import CoreData

class ApprovalMatrixService {
    
    static let shared = ApprovalMatrixService()
    
    private var matrices: [ApprovalMatrix] = []
    
    private init() {}
    
    func getAll() -> [ApprovalMatrix] {
        return matrices
    }
    
    func getById(id: Int) -> ApprovalMatrix{
        return matrices[id]
    }
    
    func add(approvalMatrix: ApprovalMatrix) {
        matrices.append(approvalMatrix)
    }
    
    func update(approvalMatrix: ApprovalMatrix, id: Int) {
        matrices[id] = approvalMatrix
    }
    
    func delete(approvalMatrix: ApprovalMatrix) {
        deleteById(id: matrices.firstIndex(where: {$0 === approvalMatrix})!)
    }
    
    func deleteById(id: Int) {
        matrices.remove(at: id)
    }
}
