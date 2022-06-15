//
//  ViewModel.swift
//  assignment_4


import Foundation
 
protocol ViewModelDelegate: AnyObject {
    func didDataFetch(_ items: [CryptoTableViewCellModel])

}
 
class ViewModel {
      
    let numberFormatter: NumberFormatter = {
       let formatter = NumberFormatter()
       formatter.locale = .current
       formatter.numberStyle = NumberFormatter.Style.currency
       formatter.allowsFloats = true
       formatter.formatterBehavior = .default
       formatter.currencyCode = "USD"

       return formatter
   }()
    
    private var model = Model()
    private var viewModels = [CryptoTableViewCellModel]()
    
    weak var delegate: ViewModelDelegate?
     
    func viewDidLoad() {
        fetchData()      

    }
    
    private func fetchData() {
        model.getAllIcons()
         
        model.fetchData { [weak self] data in
            guard let self = self else { return }
                       
            let items = data.map { model in
                
                CryptoTableViewCellModel.init(name: model.name ?? "N/A", shortName: model.asset_id ?? "b", price: self.priceFormat(_price: model.price_usd ?? 0) ?? "N/A", iconUrl: URL(string: self.model.icons.filter({
                    icon in icon.asset_id == model.asset_id
            }).first?.url ?? ""))
            }

            self.delegate?.didDataFetch(items)
        }
    }
}

private extension ViewModel {
    func priceFormat(_price: Float) -> String {
//        let price = model.price_usd ?? 0
        let formatter = self.numberFormatter
        let priceString: String = formatter.string(from: NSNumber(value: _price)) ?? "N/A"
         
        return priceString
    }
}
