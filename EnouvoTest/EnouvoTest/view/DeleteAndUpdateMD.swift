//
//  DeleteAndUpdateMD.swift
//  EnouvoTest
//
//  Created by Monsieur Charcuter on 11/05/2023.
//

import UIKit
import DropDown
class DeleteAndUpdateMD: UIViewController {
    
 
    @IBOutlet weak var inputMatrixName: UITextField!
    @IBOutlet weak var SF: UIButton!
    @IBOutlet weak var inputTextMin: UITextField!
    @IBOutlet weak var inputTextMax: UITextField!
    @IBOutlet weak var inputNumberApproval: UITextField!
    @IBOutlet weak var resetButton: UIButton!
    @IBOutlet weak var updateButton: UIButton!
    @IBOutlet weak var deleteButton: UIButton!
    private let service = ApprovalMatrixService.shared
    var id: Int?
    
    let dropDown = DropDown()
    func padding() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 18, height: inputMatrixName.frame.height))
    }
    
    func bigPadding() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 50, height: inputMatrixName.frame.height))
    }
    
    override class func awakeFromNib() {
        print("Here")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //border button
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.cornerRadius = 16.0
        resetButton.layer.borderColor = UIColor.white.cgColor
        deleteButton.layer.borderWidth = 1.0
        deleteButton.layer.borderColor = UIColor.white.cgColor
        deleteButton.layer.cornerRadius = 16.0
        updateButton.layer.borderWidth = 1.0
        updateButton.layer.borderColor = UIColor.white.cgColor
        updateButton.layer.cornerRadius = 16.0
        
        
        
//        //inputname
        inputMatrixName.text = service.getById(id: id!).approvalMatrixAlias
        inputMatrixName.textColor = .black
        inputMatrixName.layer.borderWidth = 1.0
        inputMatrixName.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputMatrixName.layer.cornerRadius = 14.0
        inputMatrixName.leftView = padding()
        inputMatrixName.leftViewMode = .always
//
//
//        //select Feature
        
        dropDown.dataSource = ["Tranfer Online", "Transfer Offline"]
        SF.layer.borderWidth = 1.0
        SF.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        SF.layer.cornerRadius = 14.0
        for i in 0..<dropDown.dataSource.count {
            print(dropDown.dataSource[i].elementsEqual(service.getById(id: id!).featureAM))
            if(dropDown.dataSource[i].elementsEqual(service.getById(id: id!).featureAM)) {
                dropDown.selectRow(at: i)
                SF.setTitle(service.getById(id: id!).featureAM, for: .normal)
                SF.setTitleColor(.black, for: .normal)
            }
        }
       
//        dropDown.selectRow(at: <#T##Index?#>)
//        dropDown.selectedItem = service.getById(id: id!).featureAM
//
//        //min
        inputTextMin.text = String(service.getById(id: id!).rangeMin)
        inputTextMin.textColor = .black
        inputTextMin.layer.borderWidth = 1.0
        inputTextMin.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputTextMin.layer.cornerRadius = 14.0
        inputTextMin.leftView = bigPadding()
        inputTextMin.leftViewMode = .always
//
//        //max
        
        inputTextMax.text = String(service.getById(id: id!).rangeMax)
        inputTextMax.textColor = .black
        inputTextMax.layer.borderWidth = 1.0
        inputTextMax.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputTextMax.layer.cornerRadius = 14.0
        inputTextMax.leftView = bigPadding()
        inputTextMax.leftViewMode = .always
//
//        //numApproval
        inputNumberApproval.text = String( service.getById(id: id!).numOfApproval)
        inputNumberApproval.textColor = .black
        inputNumberApproval.layer.borderWidth = 1.0
        inputNumberApproval.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputNumberApproval.layer.cornerRadius = 14.0
        inputNumberApproval.leftView = padding()
        inputNumberApproval.leftViewMode = .always
    }

    
   
    @IBAction func selectFeature(_ sender: UIButton) {
        
        dropDown.anchorView = sender //5
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropDown.show() //7
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal) //9
        sender.setTitleColor(.black, for: .normal)
        }
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        service.deleteById(id: id!)
        navigationController?.popViewController(animated: true)
        print(service.getAll())
        ViewController.shared?.collectionView.reloadData()
    }
    

    @IBAction func updateAction(_ sender: Any) {
        let approvalMatrixAlias = inputMatrixName.text!
        
        let featureAM = dropDown.selectedItem!
        
    
        let numOfApproval = Int16(inputNumberApproval.text!) ?? 0
        let rangeMin = Float(inputTextMin.text!) ?? 0
        let rangeMax = Float(inputTextMax.text!) ?? 0
        
        let newAM =
        ApprovalMatrix(approvalMatrixAlias:  approvalMatrixAlias, featureAM: featureAM , numOfApproval: numOfApproval, rangeMin: rangeMin, rangeMax: rangeMax)
        
        service.update(approvalMatrix: newAM, id: id!)
        navigationController?.popViewController(animated: true)
        print(service.getAll())
        ViewController.shared?.collectionView.reloadData()
    }
    @IBAction func resetAction(_ sender: Any) {
        inputMatrixName.text = ""
        inputMatrixName.textColor = .lightGray
        inputTextMin.text = "0"
        inputTextMin.textColor = .lightGray
        inputTextMax.text = "0"
        inputTextMax.textColor = .lightGray
        inputNumberApproval.text = "0"
        inputNumberApproval.textColor = .lightGray
        dropDown.clearSelection()
        SF.setTitle("Select Feature", for: .normal)
        SF.setTitleColor(UIColor.lightGray, for: .normal)
        dropDown.selectRow(at: 0)
    }
    
}
