//
//  ChecklistItem.swift
//  To-Do
//
//  Created by Rohan on 6/30/17.
//  Copyright © 2017 Rohan. All rights reserved.
//

import Foundation

class ChecklistItem: NSObject,NSCoding {
    
    override init() {
        super.init()
    }
    func encode(with aCoder: NSCoder) {
        aCoder.encode(text, forKey: "Text")
        aCoder.encode(checked, forKey: "Checked")
    }
    
    required init?(coder aDecoder: NSCoder) {
        text = aDecoder.decodeObject(forKey: "Text") as! String
        checked = aDecoder.decodeBool(forKey: "Checked")
        super.init()
    }
    
    var text = ""
    var checked = false
    
    func toggleChecked() {
        checked = !checked
    }
}
