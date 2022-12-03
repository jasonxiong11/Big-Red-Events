//
//  SavedViewController.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class SavedViewController: UIViewController {

    var titleLabel = UILabel()
    var savedTableView = UITableView()
    let postReuseIdentifier = "postReuseIdentifier"
    
    var savedData: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Saved"
        titleLabel.textColor = .systemRed
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
    }

}
