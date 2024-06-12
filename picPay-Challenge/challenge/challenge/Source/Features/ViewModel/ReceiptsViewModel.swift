//
//  ReceiptsViewModel.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

protocol ReceiptsViewModelProtocol {
    func fetchReceipts(completion: @escaping(Result<DataModel, ApiError>) -> Void)
    
}

final class ReceiptsViewModel {
    
    private let apiService: ApiServiceProtocol
    
    init(apiService: ApiServiceProtocol = ApiService()) {
        self.apiService = apiService
    }
    
//    var onDataFetched: ((DataModel?) -> Void)?
    
}

extension ReceiptsViewModel: ReceiptsViewModelProtocol {
    
    func fetchReceipts(completion: @escaping(Result<DataModel, ApiError>) -> Void) {
        apiService.fetchData() { result in
            switch result {
            case .success(let dataModel):
//                self?.onDataFetched?(dataModel)
                completion(.success(dataModel))
            case .failure(let error):
//                print(error.localizedDescription)
                completion(.failure(.requestFailed(error: error)))
            }
        }
    }
}
