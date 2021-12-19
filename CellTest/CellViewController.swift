//
//  CellViewController.swift
//  CellTest
//
//  Created by JUN? on 2021/05/30.
//

import UIKit

class CellViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    let viewModel = CellViewModel()
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? DetailViewController
            if let index = sender as? Int {
                let cellInfo = viewModel.cellInfo(at: index)
                vc?.viewModel.update(model: cellInfo)
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return viewModel.numOfCellInfoList
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }

        let cellInfo = viewModel.cellInfo(at: indexPath.row)
        cell.update(info: cellInfo)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
    }    
}

class ListCell:UITableViewCell {
    @IBOutlet weak var imgView:UIImageView!
    @IBOutlet weak var nameLabel:UILabel!
    @IBOutlet weak var cellLabel:UILabel!
    
    func update(info: CellInfo) {
        imgView.image = info.image
        nameLabel.text = info.name
        cellLabel.text = "\(info.cell)"
    }
}

class CellViewModel {
    let cellInfoList:[CellInfo] = [
        CellInfo(name: "advtime", cell: 1),
        CellInfo(name: "apple", cell: 2),
        CellInfo(name: "breast", cell: 3),
        CellInfo(name: "cat", cell: 4),
        CellInfo(name: "flower", cell: 5),
        CellInfo(name: "house", cell: 6),
        CellInfo(name: "iu", cell: 7),
        CellInfo(name: "screen", cell: 8),
    ]
    
    var sortedList: [CellInfo] {
        let sortedList = cellInfoList.sorted { prev, next in
            return prev.cell > next.cell
        }        
        return sortedList
    }
    
    var numOfCellInfoList: Int {
        return cellInfoList.count
    }
    
    func cellInfo(at index: Int) -> CellInfo{
        return sortedList[index]
    }
}
