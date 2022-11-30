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
        
        calendarImage.image = UIImage(systemName: "calendar")
        locationImage.translatesAutoresizingMaskIntoConstraints = false
        
        savedButton.setImage(UIImage(systemName: "heart"), for: .normal)
        savedButton.translatesAutoresizingMaskIntoConstraints = false
    }
    func setupConstraints(){
        
    }
    
    func configure(eventObject: Event) {
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
