class ApprovalMatrix {
    
    init(approvalMatrixAlias: String = "", featureAM : String, numOfApproval : Int16 = 0, rangeMin : Float = 0,  rangeMax : Float = 50) {
        
        self.approvalMatrixAlias = approvalMatrixAlias
        self.featureAM = featureAM
        self.numOfApproval = numOfApproval
        self.rangeMin = rangeMin
        self.rangeMax = rangeMax
    }
    
    
    let approvalMatrixAlias: String
    let featureAM : String
    let numOfApproval : Int16
    let rangeMax : Float
    let rangeMin : Float
}
