//
//  SecondViewController.swift
//  SimpleApp
//
//  Created by Kuanyshbay Ibragim on 06.01.2021.
//

import UIKit

private let cellId = "cellId"

class SecondViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    var arr = [ToDoItem]()
    var count = 1

    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Cities"
        self.config()
    }
    
    func config() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(TableViewCell.self, forCellReuseIdentifier: cellId)
        tableView.tableFooterView = UIView()
    }

    
    @IBAction func addItemFunc(_ sender: Any) {
        let countString = String(count)
        arr.append(ToDoItem(id: count,title: "\("Assignment")\(countString)", deadline: "\(countString)\("-01-21")"))
        count+=1
        tableView.reloadData()
    }
}

extension SecondViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell
        let array = arr[indexPath.row]
        cell.titleLabel?.text = "Id: \(String(array.id!)), title: \(String(array.title!)), deadline: \(String(array.deadline!))"
        return cell
    }
}
