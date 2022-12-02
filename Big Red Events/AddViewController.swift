//
//  AddViewController.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class AddViewController: UIViewController {
    
    var scrollView = UIScrollView()
    var contentView = UIView()
    
    var titleLabel = UILabel()
    var titleTextField = UITextField()
    var descriptionTextView = UITextView()
    var locationTextField = UITextField()
    var organizerTextField = UITextField()
    var dateTextField = UITextField()
    var addButton = UIButton()
    
    weak var delegate: CreateEventDelegate?
    weak var myView: UIViewController?
    var tbHeight: CGFloat?

    
    init(delegate: CreateEventDelegate) {
        self.delegate = delegate
        super.init(nibName: nil, bundle: nil)
    }
    
    override func viewDidLoad() {
        tbHeight = tabBarController!.tabBar.frame.height

        super.viewDidLoad()
        view.backgroundColor = .white
        
        setupScrollView()
        setupViews()
        view.layoutIfNeeded()
        
    }
    func setupScrollView(){
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(scrollView)

        scrollView.isScrollEnabled = true
        scrollView.isUserInteractionEnabled = true
        
        NSLayoutConstraint.activate([
            scrollView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            scrollView.widthAnchor.constraint(equalTo: view.widthAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
        ])
    }
    
    func setupViews(){
        titleLabel.text = "Add Event"
        titleLabel.textColor = .systemRed
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(titleLabel)
        
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
        scrollView.addSubview(titleTextField)
        
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
        scrollView.addSubview(descriptionTextView)
        
        locationTextField.placeholder = "  Location of event"
        locationTextField.translatesAutoresizingMaskIntoConstraints = false
        locationTextField.clipsToBounds = true
        locationTextField.layer.cornerRadius = 10
        locationTextField.backgroundColor = .white
        locationTextField.font = .systemFont(ofSize: 20)
        locationTextField.layer.borderWidth = 2.0
        locationTextField.layer.borderColor = color.cgColor
        locationTextField.tintColor = .systemRed
        scrollView.addSubview(locationTextField)
        
        organizerTextField.placeholder = "  Organizer of event"
        organizerTextField.translatesAutoresizingMaskIntoConstraints = false
        organizerTextField.clipsToBounds = true
        organizerTextField.layer.cornerRadius = 10
        organizerTextField.backgroundColor = .white
        organizerTextField.font = .systemFont(ofSize: 20)
        organizerTextField.layer.borderWidth = 2.0
        organizerTextField.layer.borderColor = color.cgColor
        organizerTextField.tintColor = .systemRed
        scrollView.addSubview(organizerTextField)
        
        dateTextField.placeholder = "  Date of event"
        dateTextField.translatesAutoresizingMaskIntoConstraints = false
        dateTextField.clipsToBounds = true
        dateTextField.layer.cornerRadius = 10
        dateTextField.backgroundColor = .white
        dateTextField.font = .systemFont(ofSize: 20)
        dateTextField.layer.borderWidth = 2.0
        dateTextField.layer.borderColor = color.cgColor
        dateTextField.tintColor = .systemRed
        scrollView.addSubview(dateTextField)
        
        addButton.setTitle("Add", for: .normal)
        addButton.translatesAutoresizingMaskIntoConstraints = false
        addButton.backgroundColor = .systemRed
        addButton.layer.cornerRadius = 15
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
        scrollView.addSubview(addButton)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20)
            ])
        NSLayoutConstraint.activate([
            titleTextField.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            titleTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            titleTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            titleTextField.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor)
        ])
        NSLayoutConstraint.activate([
            descriptionTextView.topAnchor.constraint(equalTo: titleTextField.bottomAnchor, constant: 20),
            descriptionTextView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            descriptionTextView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20),
            descriptionTextView.heightAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
        NSLayoutConstraint.activate([
            locationTextField.topAnchor.constraint(equalTo: descriptionTextView.bottomAnchor, constant: 20),
            locationTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            locationTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        NSLayoutConstraint.activate([
            organizerTextField.topAnchor.constraint(equalTo: locationTextField.bottomAnchor, constant: 20),
            organizerTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            organizerTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            dateTextField.topAnchor.constraint(equalTo: organizerTextField.bottomAnchor, constant: 20),
            dateTextField.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 20),
            dateTextField.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -20)
        ])
        
        NSLayoutConstraint.activate([
            addButton.topAnchor.constraint(equalTo: dateTextField.bottomAnchor, constant: 20),
            addButton.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            addButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor, multiplier: 0.5),
            addButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: -tbHeight!)
            
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
