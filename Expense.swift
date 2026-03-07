//
//  Created by admin on 06/03/26.
//

import Foundation

print("Smart Wallet Analyzer")

enum ExpenseCategory: String,CaseIterable{
    case food
    case transport
    case entertainment
    case shopping
    case other
}

struct Expense {
    let amount: Double
    let category: ExpenseCategory
}

func parsingData(input: String) -> Double{
    var nums = ""
    var texts = ""

    for char in input {
            if char.isNumber || char == "." {
                nums.append(char)
            } else if char != " "{
                texts.append(char)
        }
    }
    
    guard !nums.isEmpty, let amount = Double(nums) 
        else {
        print("Enter valid input")
        return 0
    }
    return amount
}

var allExpenses: [Expense] = []

for week in 1...4 {
    print("Week \(week) Expenses")
    
    for category in ExpenseCategory.allCases {
        print("Expense For \(category.rawValue):")
    

        while true {
            guard let input = readLine() else {
                continue
            }
            
            if input.lowercased() == "done" {
                break
            }
            let amount = parsingData(input: input)
            
            let expense = Expense(amount: amount, category: category)
            
            allExpenses.append(expense)
        }
    }
}

print("\n This Month's Expense")

for category in ExpenseCategory.allCases{
    var total: Double = 0
    
    for expense in allExpenses {
        if expense.category == category {
            total += expense.amount
        }
    }
    
    print("\(category.rawValue.capitalized): \(total)")
}
