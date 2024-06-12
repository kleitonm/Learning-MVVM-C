//
//  ApiService.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

import Foundation

protocol ApiServiceProtocol {
    func fetchData(completion: @escaping (Result<DataModel, Error>) -> Void)
}

final class ApiService: ApiServiceProtocol {

    func fetchData(completion: @escaping (Result<DataModel, Error>) -> Void) {
           guard let receiptUrl = Bundle.main.url(forResource: "receipt", withExtension: "json") else {
               completion(.failure(ApiError.invalidURL))
               return
           }
           
           do {
               let jsonData = try Data(contentsOf: receiptUrl)
               let data = try JSONDecoder().decode(DataModel.self, from: jsonData)
               completion(.success(data))
           } catch {
               completion(.failure(ApiError.decodeError))
           }
       }
   }
