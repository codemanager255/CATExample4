//
//  UserDetailsViewController.swift
//  CATExample4
//
//  Created by MAC on 11/11/21.
//

import UIKit

protocol UpdateUserProtocol:AnyObject {
    func updateSelectedName(selectedName:String)
}


class UserDetailsViewController: UIViewController {

    var user:User?
    weak var delegate:UpdateUserProtocol?
    var completionBlock:((String)-> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //self.dismiss(animated: true, completion: nil)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    @IBAction func ButtonOneTapped(_ sender: Any) {
        
        let name = (sender as! UIButton).titleLabel?.text
        
        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
        
//        delegate?.updateSelectedName(selectedName:name ?? "")
        
        self.navigationController?.popViewController(animated: true)
        
    }
    @IBAction func buttonTwoTapped(_ sender: Any) {
        
        let name = (sender as! UIButton).titleLabel?.text
              
        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
        
        let settinViewController = SettingViewController()
        
        self.navigationController?.pushViewController(settinViewController, animated: true)
        

    }
    
    @IBAction func buttonThreeTapped(_ sender: Any) {
        let name = (sender as! UIButton).titleLabel?.text
        
        
       // delegate?.updateSelectedName(selectedName:name ?? "")

        if let _completionBlock = completionBlock {
            _completionBlock(name ?? "")
        }
      self.navigationController?.popViewController(animated: true)
        
    }
}
