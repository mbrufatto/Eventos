//
//  ListEventViewController.swift
//  Events
//
//  Created by Marcio Habigzang Brufatto on 22/04/20.
//  Copyright © 2020 Marcio Habigzang Brufatto. All rights reserved.
//

import UIKit

class ListEventViewController: UIViewController, ViewControllerProtocol {

    var tableView: UITableView!
    var listEventViewModel = ListEventViewModel(networkManagerProtocol: NetworkManager())
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupComponents()
        self.setupConstraints()
        listEventViewModel.loadEvents(completion: {(events) in
            self.tableView.reloadData()
        })
    }
    
    internal func setupComponents() {
        
        self.title = "Eventos"
        
        self.tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(tableView)
        
        tableView.separatorStyle = .none
        tableView.dataSource = self
        
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 50
        tableView.register(EventTableViewCell.self, forCellReuseIdentifier: EventTableViewCell.identifier)
    }
    
    internal func setupConstraints() {
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableView.topAnchor.constraint(equalTo: view.topAnchor),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
}

extension ListEventViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listEventViewModel.numberOfRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: EventTableViewCell.identifier) as! EventTableViewCell
        cell.event = listEventViewModel.eventAt(indexPath.row)
        return cell
    }
}
