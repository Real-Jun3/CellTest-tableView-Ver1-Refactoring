//
//  DetailViewController.swift
//  CellTest
//
//  Created by JUN? on 2021/05/30.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cellLabel:UILabel!
    
    
    let viewModel = DetailViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }
    
    func updateUI() {        
        if let cellInfo = viewModel.cellInfo {
            imgView.image = cellInfo.image
            nameLabel.text = cellInfo.name
            cellLabel.text = "\(cellInfo.cell)"
        }

    }
    
    @IBAction func close(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }

}

class DetailViewModel {
    var cellInfo:CellInfo?
    
    func update(model: CellInfo?) {
        cellInfo = model
    }
    
}
