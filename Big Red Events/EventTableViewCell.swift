//
//  EventTableViewCell.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class EventTableViewCell: UITableViewCell {

    var titleLabel = UILabel()
    var locationLabel = UILabel()
    var dateLabel = UILabel()
    var savedButton = UIButton()
    var locationImage = UIImageView()
    var calendarImage = UIImageView()
    
    var stackView = UIStackView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        selectionStyle = .none
        setupViews()
        setupConstraints()
    }
    func setupViews(){
        locationImage.image = UIImage(systemName: "mappin")
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        locationImage.tintColor = .systemRed
        contentView.addSubview(locationImage)
        
        calendarImage.image = UIImage(systemName: "calendar")
        calendarImage.translatesAutoresizingMaskIntoConstraints = false
        calendarImage.tintColor = .systemRed
        contentView.addSubview(calendarImage)
        
        savedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .systemRed
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
//        stackView.translatesAutoresizingMaskIntoConstraints = false
//        stackView.alignment = .leading
//        stackView.distribution = .equalSpacing
//        stackView.axis = .vertical
//
//        stackView.addArrangedSubview(titleLabel)
//        stackView.addArrangedSubview(locationImage)
//        stackView.addArrangedSubview(calendarImage)
//        contentView.addSubview(stackView)
    }
    func setupConstraints(){
        NSLayoutConstraint.activate([
            titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 15)
        ])
        NSLayoutConstraint.activate([
            locationImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            locationImage.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 10)
        ])
        NSLayoutConstraint.activate([
            calendarImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            calendarImage.topAnchor.constraint(equalTo: locationImage.bottomAnchor, constant: 10),
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 68)
        ])
    }
    
    func configure(eventObject: Event) {
        titleLabel.text = eventObject.title
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
