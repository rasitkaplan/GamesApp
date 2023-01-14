//
//  GamesViewController.swift
//  GamesApp
//
//  Created by rasit on 15.01.2023.
//

import UIKit

class GamesViewController: UIViewController {

    //MARK: Outlets
    @IBOutlet private weak var tableView: UITableView!
    @IBOutlet private weak var searchBar: UISearchBar!
    
    private var tableAdapter: GamesTableViewAdapter!
    private let viewModel = GamesViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
    }

    func setupUI() {
        tableAdapter = .init(tableView: tableView, viewModel: viewModel)
    }

    @IBAction func filterButtonClicked(_ sender: Any) {
    }
}
