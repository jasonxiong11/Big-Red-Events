//
//  DiscoverViewController.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import UIKit

class DiscoverViewController: UIViewController {

    var titleLabel = UILabel()
    var eventTableView = UITableView()
    let postReuseIdentifier = "postReuseIdentifier"
    
    var eventData: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        titleLabel.text = "Discover"
        titleLabel.textColor = .systemRed
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(titleLabel)
        
        eventTableView.translatesAutoresizingMaskIntoConstraints = false
        eventTableView.delegate = self
        eventTableView.dataSource = self
        eventTableView.register(EventTableViewCell.self, forCellReuseIdentifier: postReuseIdentifier)
        view.addSubview(eventTableView)
        
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
            ])
        
        NSLayoutConstraint.activate([
            eventTableView.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20),
            eventTableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20),
            eventTableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            eventTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
    }

}
extension DiscoverViewController: UITableViewDelegate{
    
}

extension DiscoverViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: postReuseIdentifier, for: indexPath) as! EventTableViewCell
        let eventObject = eventData[indexPath.row]
        cell.configure(eventObject: eventObject)
        return cell
    }

}

extension DiscoverViewController: CreateEventDelegate {
    
    func createEvent(title: String, location: String, date: String) {
        let newEvent = Event(title: title, location: location, date: date, description: "", organizer: "", major: "")
        self.eventData.append(newEvent)
    }
    
    func reloadTableView() {
        eventTableView.reloadData()
    }
}
