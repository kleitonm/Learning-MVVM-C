//
//  ReceiptModel.swift
//  challenge
//
//  Created by Kleiton Mendes on 25/03/24.
//

struct DataModel: Codable {
    var data: ReceiptModel
}

struct ReceiptModel: Codable {
    var receipts: [Receipt]
    var pagination: Pagination
}

struct Receipt: Codable {
    var title: String
    var receiptId: String
    var name: String
    var receiverName: String
    var amount: String
    var control: String
    var date: String
}

struct Pagination: Codable {
    var page: Int
    var pageSize: Int
    var totalElements: Int
    var totalPages: Int
}
