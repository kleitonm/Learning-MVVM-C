//
//  ReceiptModelMock.swift
//  challengeTests
//
//  Created by Kleiton Mendes on 26/03/24.
//

import Foundation
@testable import challenge

enum ReceiptListModelMock {
    
    struct DataModelMock {
        static let data = ReceiptModelMock()
    }
    
    struct ReceiptModelMock {
        static let receipts = [ReceiptMock.receipt]
        
        static let pagination = PaginationMock.pagination
    }
    
    struct ReceiptMock {
        static let receipt = Receipt(title: "Transferência", receiptId: "4321", name: "Débora dos Santos", receiverName: "Maria do Bairro", amount: "R$ 100,00", control: "HOGD32137821378", date: "qua, 28 de abril de 2022")
    }
    
    struct PaginationMock {
        static let pagination = Pagination(page: 10, pageSize: 10, totalElements: 50, totalPages: 3)
    }
}
