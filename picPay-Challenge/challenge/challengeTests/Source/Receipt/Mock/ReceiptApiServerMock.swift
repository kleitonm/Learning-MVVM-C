//
//  ReceiptApiServerMock.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

@testable import challenge

class ReceiptApiServerSuccessMock: ApiServiceProtocol {
    
    func fetchData(completion: @escaping (Result<challenge.DataModel, any Error>) -> Void) {
        completion(.success(DataModel(data: ReceiptModel(receipts: [ReceiptListModelMock.ReceiptMock.receipt], pagination: ReceiptListModelMock.PaginationMock.pagination))))
    }
}

class ReceiptApiServerFailedMock: ApiServiceProtocol {
    
    func fetchData(completion: @escaping (Result<challenge.DataModel, any Error>) -> Void) {
        completion(.failure(ApiError.decodeError))
    }
}
