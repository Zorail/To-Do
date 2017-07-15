//
//  Checklist.swift
//  To-Do
//
//  Created by Rohan on 7/13/17.
//  Copyright © 2017 Rohan. All rights reserved.
//

import UIKit

class Checklist: NSObject,NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(name, forKey: "Name")
        aCoder.encode(items, forKey: "Items")
    }
    
    required init?(coder aDecoder: NSCoder) {
        name = aDecoder.decodeObject(forKey: "Name") as! String
        items = aDecoder.decodeObject(forKey: "Items") as! [ChecklistItem]
    }
    
    var name = ""
    var items = [ChecklistItem]()
    
    init(name: String) {
        self.name = name
        super.init()
    }

}
