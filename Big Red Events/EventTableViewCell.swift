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
        savedButton.tintColor = .systemRed
        savedButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
        contentView.addSubview(savedButton)
        
        titleLabel.textAlignment = .left
        titleLabel.font = UIFont.systemFont(ofSize: 25, weight: .bold)
        titleLabel.textColor = .systemRed
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(titleLabel)
        
        locationLabel.font = UIFont.systemFont(ofSize: 20)
        locationLabel.textColor = .black
        locationLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(locationLabel)
        
        dateLabel.font = UIFont.systemFont(ofSize: 20)
        dateLabel.textColor = .black
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(dateLabel)
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
            contentView.bottomAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 70)
        ])
        
        NSLayoutConstraint.activate([
            locationLabel.leadingAnchor.constraint(equalTo: locationImage.trailingAnchor, constant: 2),
            locationLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8)
        ])
        
        NSLayoutConstraint.activate([
            dateLabel.leadingAnchor.constraint(equalTo: calendarImage.trailingAnchor, constant: 4),
            dateLabel.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: 7)
        ])
        
        NSLayoutConstraint.activate([
            savedButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            savedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20)
        ])
    }
    
    @objc func buttonPressed(){
        if savedButton.currentImage == UIImage(systemName: "heart")!{
            savedButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        else{
            savedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        }
    }
    
    func configure(eventObject: Event) {
        titleLabel.text = eventObject.title
        locationLabel.text = eventObject.location
        dateLabel.text = eventObject.date
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
