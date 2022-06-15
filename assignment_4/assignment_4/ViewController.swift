//
//  ViewController.swift
//  assignment_4


import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
      
    private var viewModels = ViewModel()
    private var tableViewCellHelper: TableViewCellHelper!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupUI()
        viewModels.viewDidLoad()
    }
    private func setupUI() {
        tableViewCellHelper = .init(with: tableView, viewModel: viewModels)
         
        viewModels.delegate = self
    }

}
extension ViewController: ViewModelDelegate {

    func didDataFetch(_ items: [CryptoTableViewCellModel]) {
        tableViewCellHelper.setItems(items)
    }
    
}
