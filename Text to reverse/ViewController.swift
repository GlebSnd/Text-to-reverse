//
//  ViewController.swift
//  Text to reverse
//
//  Created by Глеб Данилов on 12/11/2022.
//

import UIKit

class ViewController: UIViewController{

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var resultButton: UIButton!
    @IBOutlet weak var reversedLabel: UILabel!
    
    var storage = Storage.initial
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.delegate = self
    }

    @IBAction func resultButtonAction(_ sender: Any) {
        var splitedText = storage.text.split(separator: " ")
        for item in 0..<splitedText.count{
            splitedText[item] = Substring(splitedText[item].reversed())
        }
        let finalString = splitedText.joined(separator: " ")
        reversedLabel.text = finalString
      //  print(type(of: splitedText))
    }
    
}

extension ViewController: UITextFieldDelegate{
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        storage.text = textField.text!
        self.view.endEditing(true)
            return true
    }
}

struct Storage {
    var text = ""
    static let initial = Storage()
}
