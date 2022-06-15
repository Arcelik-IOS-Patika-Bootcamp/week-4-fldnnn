//
//  Model.swift
//  assignment_4


import Foundation
  
protocol ModelDelegate: AnyObject {
    func didDataFetch(_ data: [Crypto])

}

class Model {
     
    private let coinApiURL = "https://rest.coinapi.io/v1/assets/?apikey=668C0F2D-345E-417B-91EC-ED3C991B522D"
    private let coinIconURL = "https://rest.coinapi.io/v1/assets/icons/55/?apikey=668C0F2D-345E-417B-91EC-ED3C991B522D"
    public var icons: [Icon] = []
     
    weak var delegate: ModelDelegate?
//    private var icons: [Icon] = []
    
    func fetchData(completion: @escaping (([Crypto]) -> ())) {
        if let url = URL.init(string: coinApiURL) {
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                guard let self = self else { return }
                do {
                    guard let data = data else {
                        return
                    }
                    let object = try JSONDecoder().decode([Crypto].self
                                                          , from: data)
                    
//                    let object = objects.sorted { first, second in
//                        return first.price_usd ?? 0 > second.price_usd ?? 0
//                    }
                    DispatchQueue.main.async {
                        completion(object)
                    }
//                    self.delegate?.didDataFetch(object)
                } catch {
                    print(error)
                }
            }
            task.resume()
        }
    }
     
    func getAllIcons() {
                if let url = URL(string: coinIconURL){
                    let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
                        guard let self = self else { return }
                        do {
                            guard let data = data else {
                                return
                            }
                            let icons = try JSONDecoder().decode([Icon].self
                                                                  , from: data)
    
//                            DispatchQueue.main.async {
                                self.icons = icons
//                            }
//                            self.delegate?.didIconFetch(icons)
                        } catch {
                            print(error)
                        }
                    }
                    task.resume()
                }
            }
}
 

