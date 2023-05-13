//
//  ApproverCell.swift
//  EnouvoTest
//
//  Created by Monsieur Charcuter on 11/05/2023.
//

import UIKit

class ApproverCell: UICollectionViewCell {
    
    
    private let service = ApprovalMatrixService.shared
    
    @IBOutlet weak var indexApprover: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    
}
