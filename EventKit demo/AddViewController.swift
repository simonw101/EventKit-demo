//
//  AddViewController.swift
//  EventKit demo
//
//  Created by Simon Wilson on 18/03/2021.
//

import UIKit

class AddViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var titleField: UITextField!
    @IBOutlet var bodyField: UITextField!
    @IBOutlet var datePicker: UIDatePicker!
    
    public var completion: ((String, String, Date) -> Void)?

    override func viewDidLoad() {
        super.viewDidLoad()

        titleField.delegate = self
        bodyField.delegate = self
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Save", style: UIBarButtonItem.Style.done, target: self, action: #selector(didTapSaveButton))
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }

    @objc func didTapSaveButton() {
        
        if let title = titleField.text, !title.isEmpty,
           let body = bodyField.text, !body.isEmpty {
            
            let targetDate = datePicker.date
            
            completion?(title, body, targetDate)
            
        }
            
        
        
    }
    
}
