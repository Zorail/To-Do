//
//  ItemDetailViewController.swift
//  To-Do
//
//  Created by Rohan on 6/30/17.
//  Copyright © 2017 Rohan. All rights reserved.
//

import UIKit

protocol ItemDetailViewControllerDelegate : class{
    func ItemDetailViewControllerDidCancel(_ controller: ItemDetailViewController)
    func ItemDetailViewController(_ controller: ItemDetailViewController,didFinishEditing item: ChecklistItem)
    func ItemDetailViewController(_ controller: ItemDetailViewController,didFinishAdding item: ChecklistItem)
}

class ItemDetailViewController: UITableViewController,UITextFieldDelegate {
    
    var itemToEdit: ChecklistItem?
    
    @IBOutlet weak var doneBarButton: UIBarButtonItem!
    @IBOutlet weak var textField: UITextField!
    weak var delegate: ItemDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let item = itemToEdit {
            title = "Edit Item"
            textField.text = item.text
            doneBarButton.isEnabled = true
        }
    }
    
    @IBAction func cancel(){
        delegate?.ItemDetailViewControllerDidCancel(self)
    }
    @IBAction func done(){
        if let item = itemToEdit {
            item.text = textField.text!
            delegate?.ItemDetailViewController(self, didFinishEditing: item)
        }else {
        let item = ChecklistItem()
        item.text = textField.text!
        item.checked = false
        
        delegate?.ItemDetailViewController(self, didFinishAdding: item)
        }
    }
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        textField.becomeFirstResponder()
    }
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let oldText = textField.text! as NSString
        let newText = oldText.replacingCharacters(in: range, with: string) as NSString
        doneBarButton.isEnabled = newText.length > 0
        return true
    }
}
