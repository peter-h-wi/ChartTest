//
//  Transaction.swift
//  ChartTest
//
//  Created by peter wi on 10/30/22.
//

import Foundation

struct Transaction: Identifiable {
    let id = UUID()
    let accum_amount: Double
    let day: Int
    
    init(amount: Double, day: Int) {
        self.accum_amount = amount
        self.day = day
    }
}

extension Transaction {
    static let example: [Transaction] = [
        Transaction(amount: 10.11, day: 1),
        Transaction(amount: 20.11, day: 4),
        Transaction(amount: 25.11, day: 10),
        Transaction(amount: 30.11, day: 15),
        Transaction(amount: 50.11, day: 16),
        Transaction(amount: 60.11, day: 20),
        Transaction(amount: 80.11, day: 31)
    ]
    static let example2: [Transaction] = [
        Transaction(amount: 15.11, day: 1),
        Transaction(amount: 25.11, day: 5),
        Transaction(amount: 28.11, day: 12),
        Transaction(amount: 35.11, day: 17),
        Transaction(amount: 55.11, day: 19),
        Transaction(amount: 59.11, day: 22),
        Transaction(amount: 85.11, day: 23),
        Transaction(amount: 87.11, day: 26)
    ]
}
