//
//  SettingViewController.swift
//  CATExample4
//
//  Created by MAC on 12/11/21.
//

import UIKit

class SettingViewController: UIViewController {

    let helloLable = UILabel()
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.white
        // Do any additional setup after loading the view.
        
        
        helloLable.text = "Hello Setting"
        helloLable.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(helloLable)
        
        
        NSLayoutConstraint.activate([
            helloLable.leadingAnchor.constraint(equalTo:self.view.leadingAnchor, constant: 10.0),
            
            helloLable.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.0)
        ])
        
        
        self.view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
    

        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5.0),
            
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5.0),

            tableView.topAnchor.constraint(equalTo:helloLable.bottomAnchor, constant: 5.0),
            
            tableView.bottomAnchor.constraint(equalTo:view.bottomAnchor, constant: 5.0)])
        
         tableView.dataSource = self

        tableView.register(SettingTableViewCell.self, forCellReuseIdentifier: "cell")
    }
}

extension SettingViewController:UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
        
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as! SettingTableViewCell
        
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
}
