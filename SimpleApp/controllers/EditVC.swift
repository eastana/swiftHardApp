//
//  EditVC.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 20.01.2021.
//

import UIKit


protocol PassArrEditDelegate: AnyObject {
    func passArrEdit(id: Int, title: String, subtitle: String, deadline: String)
}

class EditVC: UIViewController {


    @IBOutlet weak var titleEdit: UITextField!
    
    @IBOutlet weak var subtitleEdit: UITextField!
    
    @IBOutlet weak var deadlineEdit: UITextField!
    
    weak var delegate: PassArrEditDelegate?
    
    var titleText: String?
    var subtitleText: String?
    var deadlineText: String?
    var count = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        titleEdit.text = titleText
        subtitleEdit.text = subtitleText
        deadlineEdit.text = deadlineText
    }
    
    @IBAction func edit(_ sender: Any) {
        guard let titleTextField = titleEdit.text else {return }
        guard let subtitleTextField = subtitleEdit.text else {return}
        guard let deadlineTextField = deadlineEdit.text else {return}

        titleText = titleTextField
        subtitleText = subtitleTextField
        deadlineText = deadlineTextField
        
        
        self.delegate?.passArrEdit(id: count, title: titleTextField, subtitle: subtitleTextField, deadline: deadlineTextField)
        count += 1
        
        navigationController?.popViewController(animated: true)
    }
}

