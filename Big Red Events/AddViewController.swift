//
//  AddViewController.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class AddViewController: UIViewController {

    var titleLabel = UILabel()
    var titleTextField = UITextField()
    var descriptionTextView = UITextView()
    var locationTextField = UITextField()
    var organizerTextField = UITextField()
    var addButton = UIButton()
    
    weak var delegate: CreateEventDelegate?
    weak var myView: UIViewController?
    
    init(delegate: CreateEventDelegate) {
//        self.myView = delegate
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Add Event"
        titleLabel.textColor = .systemRed
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        let color = UIColor.systemRed
        
        titleTextField.placeholder = "  Title of event"
        titleTextField.translatesAutoresizingMaskIntoConstraints = false
        titleTextField.clipsToBounds = true
        titleTextField.layer.cornerRadius = 10
        titleTextField.backgroundColor = .white
        titleTextField.font = .systemFont(ofSize: 20)
        titleTextField.layer.borderWidth = 2.0
        titleTextField.layer.borderColor = color.cgColor
        titleTextField.tintColor = .systemRed
        view.addSubview(titleTextField)
        
        descriptionTextView.text = "Description of event"
        descriptionTextView.translatesAutoresizingMaskIntoConstraints = false
        descriptionTextView.clipsToBounds = true
        descriptionTextView.layer.cornerRadius = 5
        descriptionTextView.backgroundColor = .systemGray4
        descriptionTextView.font = .systemFont(ofSize: 15)
        descriptionTextView.backgroundColor = .white
        descriptionTextView.layer.borderWidth = 2.0
        descriptionTextView.layer.borderColor = color.cgColor
        descriptionTextView.tintColor = .systemRed
        view.addSubview(descriptionTextView)
        
        locationTextField.placeholder = "  Location of event"
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.clipsToBounds = true
        locationTextField.layer.cornerRadius = 10
        locationTextField.backgroundColor = .white
        locationTextField.font = .systemFont(ofSize: 20)
        locationTextField.layer.borderWidth = 2.0
        locationTextField.layer.borderColor = color.cgColor
        locationTextField.tintColor = .systemRed
        view.addSubview(locationTextField)
        
        organizerTextField.placeholder = "  Organizer of event"
        organizerTextField.translatesAutoresizingMaskIntoConstraints = false
        organizerTextField.clipsToBounds = true
        organizerTextField.layer.cornerRadius = 10
        organizerTextField.backgroundColor = .white
        organizerTextField.font = .systemFont(ofSize: 20)
        organizerTextField.layer.borderWidth = 2.0
        organizerTextField.layer.borderColor = color.cgColor
        organizerTextField.tintColor = .systemRed
        view.addSubview(organizerTextField)
        
        addButton.setTitle("Add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .systemRed
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        view.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalTo: view.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            locationTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            organizerTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
            organizerTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            organizerTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            addButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -20),
            addButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            addButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5)
        ])
    }
    
    @objc func addAction() {
        let title = titleTextField.text!
        delegate?.createEvent(title: title)
        delegate?.reloadTableView()
//        delegate?.reloadInputViews()

    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
protocol CreateEventDelegate: UIViewController {
    func createEvent(title: String)
    func reloadTableView()
}
