//
//  ViewController.swift
//  CATExample4
//
//  Created by MAC on 10/11/21.
//

import UIKit
import Combine

// Responsibiliteis of UserViewController

// 1. its connecting to server and getting data
// 2. It has UI code to display users data in tableView
// 3. updating UI data for label
// 4. Navigation


// Research on diffent status code for rest api calls

// 200, 300 , 400 , 500 series


class UserViewController: UIViewController {
    
    @IBOutlet weak var helloLabel: UILabel!
    @IBOutlet weak var tableView: UITableView!
    let userViewModel = UserListViewModel()
    var anyCancable:AnyCancellable?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.dataSource = self
        tableView.delegate = self
        binding()
        userViewModel.getUsers()
    }
    
    func binding() {
       anyCancable = userViewModel.$users.sink { _ in
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    deinit{
        anyCancable?.cancel()
    }
}

extension UserViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userViewModel.numberOfUsers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier:"cell", for: indexPath) as? UsersTableViewCell else {
            return UITableViewCell()
        }
        let userInfo = userViewModel.getUserInfo(index: indexPath.row)
        cell.nameLbl.text = userInfo.name
        cell.emailLbl.text = userInfo.email

        return cell
    }
}

extension UserViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let storyBoard = UIStoryboard(name:"Main", bundle:nil)

        let detailsViewController = storyBoard.instantiateViewController(withIdentifier:"UserDetails") as! UserDetailsViewController
        
//        let user =  users[indexPath.row]
//
//        detailsViewController.user = user
//
//        detailsViewController.delegate = self
//
//        detailsViewController.completionBlock = { name in
//            self.updateSelectedName(selectedName: "\(name) from Closure")
        }
       
        
//        self.navigationController?.pushViewController(detailsViewController, animated: true)
        
    }

//
//extension UserViewController:Netwroking {
//    func upadteUI(users: [User]) {
//        self.users = users
//        DispatchQueue.main.async {
//            self.tableView.reloadData()
//        }
//    }
//}
