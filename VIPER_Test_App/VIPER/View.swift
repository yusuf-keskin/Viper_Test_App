//
//  View.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import UIKit
//Talks to presenter -  Gets data from presenter
//Class, protocol
//View Controller

protocol AnyView {
    var presenter : AnyPresenter? { get set }
    func update(with catList: [CatInfo])
    func update(with error: CatError)
}

class CatViewController: UIViewController, AnyView {
    var presenter : AnyPresenter?
    
    private var cats = [CatInfo]()
    
    func update(with catList: [CatInfo]) {
        DispatchQueue.main.async {
            self.cats = catList
            self.messageLabel.text = "Here some cat information for no reason whatsoever UwU"
            self.tableView.reloadData()
            self.tableView.isHidden = false
        }
    }
    
    func update(with error: CatError) {
        
    }
    
    private let tableView : UITableView = {
        let tableView = UITableView()
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.isHidden = true
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    private let messageLabel : UILabel = {
        let label = UILabel()
        label.text = "...downloading..."
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .center
        label.textColor = .systemBlue
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        view.addSubview(messageLabel)
        view.addSubview(tableView)
        
        view.backgroundColor = .white
        
        //overrideUserInterfaceStyle = .light
        
         
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        messageLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 40).isActive = true
        messageLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        messageLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        
        tableView.topAnchor.constraint(equalTo: messageLabel.bottomAnchor, constant: 20).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
    }
    
}

extension CatViewController : UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cats.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        var content = cell.defaultContentConfiguration()
        let cat = cats[indexPath.row]
        content.text = cat.breed
        content.secondaryText = cat.origin
        cell.contentConfiguration = content
        return cell
    }

}

extension CatViewController : UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cat = cats[indexPath.row]
        let vc = DetailViewController()
        vc.cat = cat
        present(vc, animated: true)
    }
}
