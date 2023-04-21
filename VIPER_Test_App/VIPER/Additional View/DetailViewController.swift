//
//  DetailViewController.swift
//  VIPER_Test_App
//
//  Created by YUSUF KESKİN on 21.04.2023.
//

import UIKit

class DetailViewController: UIViewController {
    
    var cat : CatInfo? = nil
    
    let headerView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let breedLbl : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 30)
        label.textAlignment = .center
        label.textColor = .systemGreen
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    let insideView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    private let countryLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let originLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let coatLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    
    private let patternLabel : UILabel = {
        let label = UILabel()
        label.font = UIFont(name: "Avenir", size: 20)
        label.textAlignment = .left
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 0
        return label
    }()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addSubViews()
        setupLabels()
        view.backgroundColor = .white
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        headerView.topAnchor.constraint(equalTo: view.topAnchor, constant: 20).isActive = true
        headerView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        headerView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        headerView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        headerView.layer.cornerRadius = 20
        headerView.layer.borderWidth = 1
        headerView.layer.borderColor = UIColor.purple.cgColor
        
        breedLbl.topAnchor.constraint(equalTo: headerView.topAnchor, constant: 10).isActive = true
        breedLbl.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        breedLbl.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true

        
        insideView.topAnchor.constraint(equalTo: breedLbl.bottomAnchor, constant:20).isActive = true
        insideView.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 10).isActive = true
        insideView.trailingAnchor.constraint(equalTo: headerView.trailingAnchor, constant: -10).isActive = true
        insideView.bottomAnchor.constraint(equalTo: headerView.bottomAnchor, constant: -10).isActive = true
        insideView.layer.cornerRadius = 20
        insideView.layer.borderWidth = 1
        insideView.layer.borderColor = UIColor.red.cgColor

        countryLabel.topAnchor.constraint(equalTo: insideView.topAnchor, constant: 10).isActive = true
        countryLabel.leadingAnchor.constraint(equalTo: insideView.leadingAnchor, constant: 10).isActive = true
        countryLabel.trailingAnchor.constraint(equalTo: insideView.trailingAnchor, constant: -10).isActive = true

        originLabel.topAnchor.constraint(equalTo: countryLabel.bottomAnchor, constant: 10).isActive = true
        originLabel.leadingAnchor.constraint(equalTo: insideView.leadingAnchor, constant: 10).isActive = true
        originLabel.trailingAnchor.constraint(equalTo: insideView.trailingAnchor, constant: -10).isActive = true

        coatLabel.topAnchor.constraint(equalTo: originLabel.bottomAnchor, constant: 10).isActive = true
        coatLabel.leadingAnchor.constraint(equalTo: insideView.leadingAnchor, constant: 10).isActive = true
        coatLabel.trailingAnchor.constraint(equalTo: insideView.trailingAnchor, constant: -10).isActive = true

        patternLabel.topAnchor.constraint(equalTo: coatLabel.bottomAnchor, constant: 10).isActive = true
        patternLabel.leadingAnchor.constraint(equalTo: insideView.leadingAnchor, constant: 10).isActive = true
        patternLabel.trailingAnchor.constraint(equalTo: insideView.trailingAnchor, constant: -10).isActive = true

        
    }
    
    func addSubViews(){
        view.addSubview(headerView)
        headerView.addSubview(breedLbl)
        
        headerView.addSubview(insideView)
        insideView.addSubview(countryLabel)
        insideView.addSubview(originLabel)
        insideView.addSubview(coatLabel)
        insideView.addSubview(patternLabel)
    }
    
    func setupLabels() {
        breedLbl.text = cat?.breed
        countryLabel.text = "Country: \(cat?.country ?? "")"
        originLabel.text = "Origin: \(cat?.origin ?? "")"
        coatLabel.text = "Coat: \(cat?.coat ?? "")"
        patternLabel.text = "Pattern: \(cat?.pattern ?? "")"
        view.reloadInputViews()
    }


}
