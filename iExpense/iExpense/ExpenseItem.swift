//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Sandeep Hegde on 25/09/23.
//

import Foundation


struct ExpenseItem: Identifiable {
    let id = UUID()
    let name: String
    let type: String
    let amount: Int
}
