//
//  EventTableViewCell.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import Kingfisher

class EventTableViewCell: UITableViewCell {

    static let identifier = "EventTableViewCell"
    
    fileprivate let eventImage = UIImageView()
    fileprivate let eventDate = UILabel()
    fileprivate let eventTitle = UILabel()
    fileprivate let eventPlace = UILabel()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var event: Event! {
        didSet {
            eventImage.kf.setImage(with: URL(string: event.image))
            eventDate.text = event.date
            eventTitle.text = event.title
            eventPlace.text = "Porto Alegre - Redenção"
        }
    }
    
    func setupViews() {
        eventImage.translatesAutoresizingMaskIntoConstraints = false
        eventDate.translatesAutoresizingMaskIntoConstraints = false
        eventTitle.translatesAutoresizingMaskIntoConstraints = false
        eventPlace.translatesAutoresizingMaskIntoConstraints = false
        
        contentView.addSubview(eventImage)
        contentView.addSubview(eventDate)
        contentView.addSubview(eventTitle)
        contentView.addSubview(eventPlace)
        
        eventImage.contentMode = .scaleToFill
        eventTitle.font = .boldSystemFont(ofSize: 16.0)
        eventTitle.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
        eventTitle.numberOfLines = 0
        eventDate.font = .systemFont(ofSize: 14)
        eventDate.textColor = .red
        eventPlace.font = .systemFont(ofSize: 14)
        eventPlace.textColor = .gray
        eventPlace.numberOfLines = 0
        
        let marginGuide = contentView.layoutMarginsGuide
        NSLayoutConstraint.activate([
            eventTitle.topAnchor.constraint(equalTo: marginGuide.topAnchor, constant: 8),
            eventTitle.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            eventTitle.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor),
        ])
        
        NSLayoutConstraint.activate([
            eventImage.widthAnchor.constraint(equalToConstant: 110),
            eventImage.heightAnchor.constraint(equalToConstant: 60),
            eventImage.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 8),
            eventImage.leadingAnchor.constraint(equalTo: marginGuide.leadingAnchor),
            eventImage.bottomAnchor.constraint(lessThanOrEqualTo: marginGuide.bottomAnchor),
        ])
        
        NSLayoutConstraint.activate([
            eventDate.topAnchor.constraint(equalTo: eventTitle.bottomAnchor, constant: 8),
            eventDate.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 8),
        ])
        
        
        
        NSLayoutConstraint.activate([
            eventPlace.topAnchor.constraint(equalTo: eventDate.bottomAnchor, constant: 8),
            eventPlace.leadingAnchor.constraint(equalTo: eventImage.trailingAnchor, constant: 8),
            eventPlace.trailingAnchor.constraint(equalTo: marginGuide.trailingAnchor)
        ])
    }
}
