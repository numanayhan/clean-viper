//
//  RegisterView.swift
//  CleanViper
//
//  Created by nayhan on 19.04.2022.
//

import Foundation
import UIKit

//UI ile tasarım giydirilmesi yapılır.

// ViewController
// Protocotl
// Referance Presenter

protocol RegisterView {
    var presenter:RegisterPresenter? {get set}
    func updateUser(with users:[User])
    func updateUser(with error:String)
}

class UserView : UIViewController, RegisterView{
    private let tableView:UITableView = {
       let tb = UITableView()
        tb.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tb.isHidden = true
        return tb
    }()
    var presenter: RegisterPresenter?
    var users:[User] = []
    private let  labelListStatus : UILabel = {
       let label = UILabel()
        label.textAlignment = .center
        label.isHidden = true
        
        return label
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(labelListStatus)
      
        view.backgroundColor  = .orange
        tableView.frame = view.bounds
        tableView.delegate = self
        tableView.dataSource = self
        view.addSubview(tableView)
        
        
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        tableView.frame = view.bounds
        labelListStatus.frame = CGRect(x: 0, y: 0, width: 200, height: 50)
        
        labelListStatus.center = view.center
        
    }
    func updateUser(with error: String) {
        print("error")
        
        DispatchQueue.main.async {
            self.users = []
            self.labelListStatus.text = error
            self.tableView.isHidden = true
            self.labelListStatus.isHidden = false
        }
    }
    func updateUser(with users: [User]) {
        print("user")
        DispatchQueue.main.async {
            self.users = users
            self.tableView.reloadData()
            self.labelListStatus.isHidden = true
            self.tableView.isHidden = false
        }
    }
}

extension UserView : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell",for: indexPath)
        cell.textLabel?.text = users[indexPath.row].name
        return cell
    }
    
    
}

