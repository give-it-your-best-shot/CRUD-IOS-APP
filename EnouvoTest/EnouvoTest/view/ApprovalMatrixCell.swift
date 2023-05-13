//
//  ApprovalMatrixCell.swift
//  EnouvoTest
//
//  Created by Monsieur Charcuter on 10/05/2023.
//

import UIKit

class ApprovalMatrixCell: UICollectionViewCell {
    private let service = ApprovalMatrixService.shared

    @IBOutlet weak var minIDR: UILabel!
    @IBOutlet weak var maxIDR: UILabel!
    @IBOutlet weak var numberApproval: UILabel!
    @IBOutlet weak var collectionAMCell: UICollectionView!
    @IBOutlet var backgroundViewCell: UIView!
    var am: ApprovalMatrix?
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        backgroundViewCell.layer.borderWidth = 1
        backgroundViewCell.layer.borderColor = UIColor.systemGray5.cgColor
        backgroundViewCell.layer.cornerRadius = 21
        
        let cell = UINib(nibName: "ApproverCell", bundle: .main)
        collectionAMCell.register(cell, forCellWithReuseIdentifier: "ApproverCell")
                updateCollectionViewLayout()
        
        }
        required init?(coder: NSCoder) {
            super.init(coder: coder)
        }
        
        func formatNumWithComma(num: Float) -> String{
            let numberFormatter = NumberFormatter()
            numberFormatter.numberStyle = .decimal
            numberFormatter.maximumFractionDigits = 3
            
            let formattedNumber = numberFormatter.string(from: NSNumber(value: num * 1000))
            let finalNumber = formattedNumber?.replacingOccurrences(of: ".", with: ",")
                
            return finalNumber ?? ""
        }
        
        func setAM(am: ApprovalMatrix) {
            self.am = am
            minIDR.text = formatNumWithComma(num: am.rangeMin)
            maxIDR.text = formatNumWithComma(num: am.rangeMax)
            numberApproval.text = String(am.numOfApproval)
        }
}


extension ApprovalMatrixCell: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApproverCell", for: indexPath) as! ApproverCell
        
        cell.indexApprover.text = "Approver \(indexPath.row + 1)"
        collectionView.reloadData()
        return cell
    }
    
     //number of item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        collectionView.reloadData()
        return Int(am!.numOfApproval)
        
    }
    // set size
    // Declare a variable to store the calculated cell heights

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        
        print("Current indexPath.row: \(indexPath.row)")
        
        print("Number of elements in service.getAll(): \(Int(am!.numOfApproval))")
    
        return CGSize(width: 288, height: 40)
        
    }

    // Call this method to update the collection view layout after making changes
    func updateCollectionViewLayout() {
        ViewController.shared?.collectionView.reloadData()
    }
    
}

