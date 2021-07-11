//
//  ViewController.swift
//  Beers
//
//  Created by Tatiana Rico on 04/07/21.
//  Copyright © 2021 Tatiana Rico. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let controller = BeerViewModel()
    
    @IBOutlet weak var beerTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        getList()
    }
    
    func setupTableView() {
        beerTableView.delegate = self
        beerTableView.dataSource = self
    }
    
    func getList() {
        self.controller.getApi {[weak self] (success) in
            guard let self = self else { return }
            if success {
                self.beerTableView.reloadData()
            }
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRow()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? BeersTableViewCell else { return UITableViewCell() }
        cell.setupCell(model:controller.cellForRow(indexPath: indexPath) )
        return cell
    }
    
        func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
            if let vc  = storyboard?.instantiateViewController(identifier: "BeerDetailViewController") as? BeerDetailViewController {
                vc.model = controller.cellForRow(indexPath: indexPath)
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}
