//
//  ViewController.swift
//  EnouvoTest
//
//  Created by Monsieur Charcuter on 10/05/2023.
//

import UIKit
import DropDown
class ViewController: UIViewController {
    
    static var shared: ViewController? = nil

    @IBOutlet weak var transferLabel: UILabel!
    @IBOutlet weak var defaultLabel: UILabel!
    @IBOutlet weak var borderedBottom: UIView!
    @IBOutlet weak var tambahAddButton: UIButton!
    @IBOutlet weak var collectionView: UICollectionView!
    
    @IBOutlet weak var defaultDropdown: UIButton!
    @IBOutlet weak var transferDropdown: UIButton!
    
    var matrices: [ApprovalMatrix] = []
   
    let dropdownD = DropDown()
    let dropdownT = DropDown()
    private let service = ApprovalMatrixService.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()

        matrices = service.getAll()
        self.navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: UIBarButtonItem.Style.plain, target: nil, action: nil)

        dropdownT.dataSource = ["Transfer Online", "Transfer Offline"]
        ViewController.shared = self
        
        borderedBottom.layer.borderWidth = 1
        borderedBottom.layer.borderColor = UIColor.white.cgColor
        borderedBottom.layer.cornerRadius = 21
        borderedBottom.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        //tambah add
        tambahAddButton.backgroundColor = UIColor(red: 23/255, green: 28/255, blue: 143/255, alpha: 1)
        tambahAddButton.layer.cornerRadius = 10
        
        //title label for tambah button
        let tambahLabel = UILabel()
                tambahLabel.text = "Tambah New Matrix"
                tambahLabel.textColor = .white
                tambahLabel.font = UIFont.systemFont(ofSize: 12.0)
      
        //dropdown part
        defaultDropdown.layer.borderWidth = 1.0
        defaultDropdown.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        defaultDropdown.layer.cornerRadius = 18.0
        transferDropdown.layer.borderWidth = 1.0
        transferDropdown.layer.borderColor = UIColor(red: 227/255, green: 227/255, blue: 228/255, alpha: 1).cgColor
        transferDropdown.layer.cornerRadius = 18.0
        dropdownT.selectRow(at: 0)
        
        
        // icon plus
        let iconTambah = UIImageView(image: UIImage(systemName: "plus.circle.fill")?.withTintColor(.white, renderingMode: .alwaysOriginal))
        
        
        // adding icon to tambah button
        tambahAddButton.addSubview(tambahLabel)
        tambahAddButton.addSubview(iconTambah)
        tambahLabel.translatesAutoresizingMaskIntoConstraints = false
        iconTambah.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tambahLabel.leadingAnchor.constraint(equalTo: iconTambah.trailingAnchor, constant: 2),
            tambahLabel.centerYAnchor.constraint(equalTo: tambahAddButton.centerYAnchor),
            
            iconTambah.leadingAnchor.constraint(equalTo: tambahAddButton.leadingAnchor, constant: 5),
            iconTambah.centerYAnchor.constraint(equalTo: tambahAddButton.centerYAnchor),
            iconTambah.widthAnchor.constraint(equalToConstant: 27),
            iconTambah.heightAnchor.constraint(equalToConstant: 27)
        ])
        
        //dang ki
        let cell = UINib(nibName: "ApprovalMatrixCell", bundle: .main)
        collectionView.register(cell, forCellWithReuseIdentifier: "ApprovalMatrixCell")
        
        collectionView.reloadData()
    }
    
    func reload() {
//        print(dropdownT.selectedItem)
        if(dropdownT.selectedItem == nil) {
            print("aa")
            matrices = service.getAll()
        } else
        if(dropdownT.selectedItem!.elementsEqual("Transfer Online")) {
            matrices = service.getAll().filter {$0.featureAM.elementsEqual("Tranfer Online")}
        } else
        if(dropdownT.selectedItem!.elementsEqual("Transfer Offline")) {
            matrices = service.getAll().filter {$0.featureAM.elementsEqual("Tranfer Offline")}
        }
        else {
            matrices = []
        }
        collectionView.reloadData()
    }
    
    @IBAction func defaultDropdownAction(_ sender: UIButton) {
        dropdownD.dataSource = ["Default"]//4
        dropdownD.anchorView = sender //5
        dropdownD.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height) //6
        dropdownD.show() //7
        dropdownD.selectionAction = { [weak self] (index: Int, item: String) in //8
          guard let _ = self else { return }
       
          sender.setTitle(item, for: .normal) //9
            
        }
    }
    
    
    @IBAction func transferDropdownButton(_ sender: UIButton) {
        
        dropdownT.anchorView = sender
        dropdownT.bottomOffset = CGPoint(x: 0, y: sender.frame.size.height)
        dropdownT.show()
        dropdownT.selectionAction = { [weak self] (index: Int, item: String) in
          guard let _ = self else { return }
          sender.setTitle(item, for: .normal)
//            self?.reload()
            self?.transferLabel.text = item
        }
    }
}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ApprovalMatrixCell", for: indexPath) as! ApprovalMatrixCell
        cell.setAM(am: service.getById(id: indexPath.row))
        return cell
    }
    
    // number of item
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        service.getAll().count
    }
    
    // set size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellHeight = 43 * Int(service.getById(id: indexPath.row).numOfApproval)
//        collectionView.collectionViewLayout.invalidateLayout()
        return CGSize(width: 315, height: (132 + cellHeight))
    
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let DAUCV = UIStoryboard(name: "Main", bundle: .main)
        let deleteAndUpdateVC = DAUCV.instantiateViewController(withIdentifier: "DeleteAndUpdateMD") as! DeleteAndUpdateMD

        deleteAndUpdateVC.id = indexPath.row
        print("clicked")
        print("IndexPath.row: \(indexPath.row)")

        navigationController?.pushViewController(deleteAndUpdateVC, animated: true)
        
    }
}
