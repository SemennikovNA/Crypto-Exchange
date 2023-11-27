//
//  SaveTableViewController.swift
//  Crypto Exchange
//
//  Created by Nikita on 26.11.2023.
//

import UIKit

class SaveTableViewController: UITableViewController {
    
    //MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        // Call function's
        setupTableView()
    }
    
    //MARK: - Table view methods
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        1
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SaveCell", for: indexPath) as! SaveTableViewCell
        cell.backgroundColor = .back
        cell.cryptoLabel.text = "Крипта"
        cell.equalLabel.text = "="
        cell.fiatLabel.text = "Валюта"
        return cell
    }
    
    //MARK: - Private methods
    
    func setupTableView() {
        tableView.backgroundColor = .back
        self.tableView.register(SaveTableViewCell.self, forCellReuseIdentifier: "SaveCell")
        navigationItem.title = "Сохраненые пары"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.largeTitleDisplayMode = .always
        navigationController?.navigationBar.topItem?.backButtonTitle = "Назад"
        navigationController?.navigationBar.tintColor = .lightAndDarkMode
    }
}
