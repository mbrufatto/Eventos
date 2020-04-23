//
//  DetailEventViewController.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 23/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit
import Kingfisher
import MapKit

class DetailEventViewController: UIViewController {

    //MARK: - Properties
    
    var event: Event?
    var detailEventViewModel: DetailEventViewModelProtocol
    
    private var eventImage = UIImageView()
    private var eventTitle = UILabel()
    private var eventRoad = UILabel()
    private var eventCityAndState = UILabel()
    private var eventPrice = UILabel()
    private var eventDescription = UILabel()
    private var eventMap = MKMapView()
    
    private lazy var contentViewSize = CGSize(width: self.view.frame.width, height: self.view.frame.height)
    
    //MARK: - Views
    
    lazy var scrollView: UIScrollView = {
        let view = UIScrollView(frame: .zero)
        view.frame = self.view.bounds
        view.contentSize = contentViewSize
        view.autoresizingMask = .flexibleHeight
        view.bounces = true
        view.showsHorizontalScrollIndicator = true
        return view
    }()
    
    lazy var containerView: UIView = {
        let view = UIView()
        view.frame.size = contentViewSize
        return view
    }()
    
    lazy var label: UILabel = {
        let label = UILabel()
        label.text = "Center of container view"
        return label
    }()
    
    //MARK: - View Controller Lifecycle
    
    init(detailEventViewModelProtocol: DetailEventViewModelProtocol? = nil, networkManagerProtocol: NetworkManagerProtocol? = nil) {
        self.detailEventViewModel = detailEventViewModelProtocol ?? DetailEventViewModel(networkManagerProtocol: networkManagerProtocol ?? NetworkManager())
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Detalhes do Evento"
        
        self.view.addSubview(scrollView)
        self.scrollView.addSubview(containerView)
        
        self.setupComponents()
        self.setupConstraints()
        
    }
    
    internal func setupComponents() {
        self.view.addSubview(self.scrollView)
        
        if let event = self.event {
            self.eventImage.kf.setImage(with: URL(string: event.image), placeholder: UIImage(named: "festa"))
            self.containerView.addSubview(self.eventImage)
            self.containerView.addSubview(eventTitle)
            
            self.containerView.addSubview(self.eventRoad)
            self.containerView.addSubview(self.eventCityAndState)
            self.containerView.addSubview(self.eventPrice)
            self.containerView.addSubview(self.eventDescription)
            self.containerView.addSubview(self.eventMap)
            
            self.detailEventViewModel.loadAddress(latitude: event.latitude, longitude: event.longitude, completion: { address in
                self.eventTitle.text = event.title
                self.eventTitle.font = .boldSystemFont(ofSize: 20)
                self.eventTitle.numberOfLines = 0
                
                self.eventRoad.text = address.road
                self.eventRoad.font = .systemFont(ofSize: 16)
                self.eventRoad.numberOfLines = 0
                self.eventRoad.textColor = .gray
                
                self.eventCityAndState.text = "\(address.city) - \(address.state)"
                self.eventCityAndState.numberOfLines = 0
                self.eventCityAndState.font = .systemFont(ofSize: 16)
                self.eventCityAndState.textColor = .gray
                
                self.eventPrice.text = event.price.formatCurrency()
                self.eventPrice.numberOfLines = 0
                self.eventPrice.font = .systemFont(ofSize: 16)
                self.eventPrice.textColor = .gray
                
                self.eventDescription.text = event.description
                self.eventDescription.numberOfLines = 0
                self.eventDescription.font = .systemFont(ofSize: 17)
                
                let latitude =  (event.latitude as NSString).doubleValue
                let longitude = (event.longitude as NSString).doubleValue
                
                self.setCoordinateInMap(latitude: latitude, longitude: longitude, title: event.title)
            })
        }
    }
    
    private func setCoordinateInMap(latitude: CLLocationDegrees, longitude: CLLocationDegrees, title: String) {
        let location = CLLocationCoordinate2D(latitude: latitude, longitude: longitude)
        let region = MKCoordinateRegion(center: location, latitudinalMeters: 200, longitudinalMeters: 200)
        
        self.eventMap.setRegion(region, animated: true)
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = location
        annotation.title = title
        self.eventMap.addAnnotation(annotation)
    }
    
    internal func setupConstraints() {
        self.eventImage.translatesAutoresizingMaskIntoConstraints = false
        self.eventTitle.translatesAutoresizingMaskIntoConstraints = false
        self.eventRoad.translatesAutoresizingMaskIntoConstraints = false
        self.eventCityAndState.translatesAutoresizingMaskIntoConstraints = false
        self.eventPrice.translatesAutoresizingMaskIntoConstraints = false
        self.eventDescription.translatesAutoresizingMaskIntoConstraints = false
        self.eventMap.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.eventImage.topAnchor.constraint(equalTo: containerView.topAnchor),
            self.eventImage.leadingAnchor.constraint(equalTo: containerView.leadingAnchor),
            self.eventImage.trailingAnchor.constraint(equalTo: containerView.trailingAnchor),
            self.eventImage.heightAnchor.constraint(equalToConstant: 320),
            
            self.eventTitle.topAnchor.constraint(equalTo: self.eventImage.bottomAnchor, constant: 8),
            self.eventTitle.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventTitle.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            
            self.eventRoad.topAnchor.constraint(equalTo: self.eventTitle.bottomAnchor, constant: 8),
            self.eventRoad.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventRoad.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            
            self.eventCityAndState.topAnchor.constraint(equalTo: self.eventRoad.bottomAnchor, constant: 8),
            self.eventCityAndState.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventCityAndState.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            
            self.eventPrice.topAnchor.constraint(equalTo: self.eventCityAndState.bottomAnchor, constant: 8),
            self.eventPrice.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventPrice.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            
            self.eventDescription.topAnchor.constraint(equalTo: self.eventPrice.bottomAnchor, constant: 8),
            self.eventDescription.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventDescription.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            
            self.eventMap.topAnchor.constraint(equalTo: self.eventDescription.bottomAnchor, constant: 8),
            self.eventMap.leadingAnchor.constraint(equalTo: self.containerView.leadingAnchor, constant: 8),
            self.eventMap.trailingAnchor.constraint(equalTo: self.containerView.trailingAnchor, constant: 8),
            self.eventMap.heightAnchor.constraint(equalToConstant: 269),
            self.eventMap.bottomAnchor.constraint(equalTo: self.containerView.bottomAnchor, constant: 8)
        ])
    }
}
