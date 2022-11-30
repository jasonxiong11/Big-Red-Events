//
//  Event.swift
//  Big Red Events
//
//  Created by Jason Xiong and Tina Sherpa on 11/30/22.
//

import Foundation
import UIKit

class Event {
    var title: String
    var location: String
    var date: String
    var description: String
    var organizer: String
    var major: String

    init(title: String, location: String, date: String, description: String, organizer: String, major: String) {
        self.title = title
        self.location = location
        self.date = date
        self.description = description
        self.organizer = organizer
        self.major = major
    }
}
