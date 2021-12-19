//
//  CellInfo.swift
//  CellTest
//
//  Created by JUN? on 2021/08/12.
//

import UIKit

struct CellInfo {
    let name:String
    let cell:Int
    
    var image:UIImage?{
        return UIImage(named: "\(name).jpg")
    }
    
    init(name:String, cell:Int) {
        self.name = name
        self.cell = cell
    }
}
