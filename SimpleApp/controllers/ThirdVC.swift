//
//  ThirdVC.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 12.01.2021.
//

import UIKit


class ThirdVC: UIViewController{
    
    @IBOutlet weak var tableViewThird: UITableView!
    @IBOutlet weak var clearItem: UIBarButtonItem!
    let addVC = AddItemVC()
    
    
    var arrThird = [ToDoItem]()
    var count = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.configureTableView()
        tableViewThird.reloadData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableViewThird.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "addItemVC" {
            let addItemVC = segue.destination as! AddItemVC
            addItemVC.delegate = self
        }
    }
    
    func configureTableView(){
        tableViewThird.delegate = self
        tableViewThird.dataSource = self
        tableViewThird.tableFooterView = UIView()
    }
    
    @IBAction func clearItemFunc(_ sender: Any) {
        count = 1
        arrThird.removeAll()
        tableViewThird.reloadData()
    }
    
    
}
extension ThirdVC: PassArrDataDelegate {
    func passDataArr(id: Int, title: String, subtitle: String, deadline: String) {
        arrThird.append(ToDoItem(id: id, title: title, subtitle: subtitle, deadline: deadline))
    }

}

extension ThirdVC: PassArrEditDelegate {
    func passArrEdit(id: Int, title: String, subtitle: String, deadline: String) {
        arrThird.append(ToDoItem(id: id, title: title, subtitle: subtitle, deadline: deadline))
    
    }
}

extension ThirdVC: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let array = arrThird[indexPath.row]
        let vc = self.storyboard?.instantiateViewController(identifier: "EditVC") as! EditVC
        
        vc.titleText = array.title
        vc.subtitleText = array.subtitle
        vc.deadlineText = array.deadline
        vc.delegate = self
        
        self.arrThird.remove(at: indexPath.row)
        self.navigationController?.pushViewController(vc, animated: true)
            
    }
    
    
    func tableView(_ tableView: UITableView,  numberOfRowsInSection section: Int) -> Int {
        return arrThird.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyTableViewCell
        let array = arrThird[indexPath.row]
        cell.titleLabel?.text = "\(String(array.title!)) \n \(String(array.subtitle!)) \n \(String(array.deadline!))"
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath)
            -> UISwipeActionsConfiguration? {
        let deleteAction = UIContextualAction (style: .destructive, title: nil) {
            [self] (_,_,completionHandler) in
            self.arrThird.remove(at: indexPath.row)
            self.tableViewThird.reloadData()
            completionHandler(true)
        }
        deleteAction.image = UIImage(systemName: "trash")
        deleteAction.backgroundColor = .systemRed
        let configuration = UISwipeActionsConfiguration(actions: [deleteAction])
        return configuration
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
}
