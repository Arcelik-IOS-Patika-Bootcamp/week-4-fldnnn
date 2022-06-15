//
//  TableViewCellHelper.swift
//  assignment_4


import Foundation
import UIKit
 
class TableViewCellHelper: NSObject {
     
    private var cellModel: [CryptoTableViewCellModel] = []
    
    weak var tableView: UITableView!
    weak var viewModel: ViewModel?
      
    weak var model: Model?
    
    init(with tableView: UITableView, viewModel: ViewModel) {
        super.init()
         
        self.tableView = tableView
        self.viewModel = viewModel
         
        self.tableView.delegate = self
        self.tableView.dataSource = self
         
        registerCell()
    }

    private func registerCell() {
        tableView.register(.init(nibName: "CustomTableViewCell", bundle: nil), forCellReuseIdentifier: "CustomTableViewCell")
    }
    func setItems(_ items: [CryptoTableViewCellModel]) {
        self.cellModel = items
        
        tableView?.reloadData()
    }
}
 
extension TableViewCellHelper: UITableViewDelegate {
    
}
 
extension TableViewCellHelper: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "CustomTableViewCell", for: indexPath) as! CustomTableViewCell
        let rowItem = cellModel[indexPath.row]
        cell.nameLabel.text = rowItem.name
        cell.iconLabel.text = rowItem.shortName
        cell.priceLabel.text = rowItem.price
       
        if let url = rowItem.iconUrl {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, errror in
                if let data = data {
                    DispatchQueue.main.async {
                        cell.iconImageView.image = UIImage(data: data)
                    }
                }
            }
            task.resume()
        }
        cell.iconImageView.contentMode = .scaleAspectFit
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70
    }
}

