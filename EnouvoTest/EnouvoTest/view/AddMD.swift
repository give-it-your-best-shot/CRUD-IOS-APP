
import UIKit
import DropDown
import CoreData
class AddMD: UIViewController {
    @IBOutlet weak var inputNumberApproval: UITextField!
    @IBOutlet weak var inputTextMax: UITextField!
    @IBOutlet weak var inputTextMin: UITextField!
    @IBOutlet weak var backButton: UIBarButtonItem!
    @IBOutlet weak var inputMatrixName: UITextField!
    @IBOutlet weak var SF: UIButton!
    @IBOutlet weak var addButton: UIButton!
    @IBOutlet weak var resetButton: UIButton!
    private let service = ApprovalMatrixService.shared
    let dropDown = DropDown()
    
    func padding() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 18, height: inputMatrixName.frame.height))
    }
    func bigPadding() -> UIView {
        return UIView(frame: CGRect(x: 0, y: 0, width: 50, height: inputMatrixName.frame.height))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        dropDown.dataSource = ["Tranfer Online", "Transfer Offline"]
        //backButton
        let backButton = UIButton(type: .custom)
        backButton.setImage(UIImage(systemName: "chevron.backward"), for: .normal)
        

        // border button
        addButton.layer.borderWidth = 1.0
        addButton.layer.cornerRadius = 16.0
        addButton.layer.borderColor = UIColor.white.cgColor
        resetButton.layer.borderWidth = 1.0
        resetButton.layer.cornerRadius = 16.0
        resetButton.layer.borderColor = UIColor.white.cgColor

        
        
//        //inputname
        inputMatrixName.layer.borderWidth = 1.0
        inputMatrixName.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputMatrixName.layer.cornerRadius = 14.0

        inputMatrixName.leftView = padding()
        inputMatrixName.leftViewMode = .always
//
//
//        //select Feature
        SF.layer.borderWidth = 1.0
        SF.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        SF.layer.cornerRadius = 14.0
        dropDown.selectRow(at: 0)
//
//      min
        
        inputTextMin.layer.borderWidth = 1.0
        inputTextMin.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputTextMin.layer.cornerRadius = 14.0
        inputTextMin.leftView = bigPadding()
        inputTextMin.leftViewMode = .always
//
//        //max
        inputTextMax.layer.borderWidth = 1.0
        inputTextMax.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputTextMax.layer.cornerRadius = 14.0
        inputTextMax.leftView = bigPadding()
        inputTextMax.leftViewMode = .always
//
//        //numApproval
        inputNumberApproval.layer.borderWidth = 1.0
        inputNumberApproval.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        inputNumberApproval.layer.cornerRadius = 14.0
        inputNumberApproval.leftView = padding()
        inputNumberApproval.leftViewMode = .always
    }
    
    @IBAction func selectFeature(_ sender: UIButton) {
        
        
        dropDown.anchorView = sender
        sender.titleLabel!.textColor = .black
        dropDown.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        
        dropDown.show()
        
        dropDown.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
//                sender.select(item)
            
            
            sender.setTitle(item, for: .normal) //9
            sender.setTitleColor(.black, for: .normal)
            
            
        }
    }
    
    @IBAction func addButton(_ sender: UIButton) {
        let approvalMatrixAlias = inputMatrixName.text!
        
        let featureAM = dropDown.selectedItem!
        
    
        let numOfApproval = Int16(inputNumberApproval.text!) ?? 0
        let rangeMin = Float(inputTextMin.text!) ?? 0
        let rangeMax = Float(inputTextMax.text!) ?? 0
        
        let newAM =
        ApprovalMatrix(approvalMatrixAlias:  approvalMatrixAlias, featureAM: featureAM , numOfApproval: numOfApproval, rangeMin: rangeMin, rangeMax: rangeMax)
        
        service.add(approvalMatrix: newAM)
    
        navigationController?.popViewController(animated: true)
        print(service.getAll())
        ViewController.shared?.reload()
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
