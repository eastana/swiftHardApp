//
//  addItemVC.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 15.01.2021.
//

import UIKit

protocol PassArrDataDelegate: AnyObject {
    func passDataArr(id: Int, title: String, subtitle: String, deadline: String)
}

class AddItemVC: UIViewController {
    
    @IBOutlet weak var titleField: UITextField!
    @IBOutlet weak var subtitleField: UITextField!
    @IBOutlet weak var deadlineField: UITextField!
    weak var delegate: PassArrDataDelegate?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
    }
    
    var count = 1
    var arr: [ToDoItem] = []
    
    
    @IBAction func addItemFunc(_ sender: Any) {
        guard let titleText = titleField.text else {return }
        guard let subtitleText = subtitleField.text else {return}
        guard let deadlineText = deadlineField.text else {return}
        self.delegate?.passDataArr(id: count, title: titleText, subtitle: subtitleText, deadline: deadlineText)
        count += 1
        navigationController?.popViewController(animated: true)
    }
    

}


