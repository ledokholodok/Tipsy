import Foundation

struct CalculatorBrain {
    var totalBill : Double?
    var bill: Double?
    var numberOfPeople = 2.0
    var tip = 0.1
    var tipTitle = "10%"
    
    mutating func setBill(_ bill: Double) {
        self.bill = bill
    }
    
    mutating func setNumberOfPeople(_ numberOfPeople: Double){
        self.numberOfPeople = numberOfPeople
    }
    
    mutating func setTip(_ tipTitle: String) {
        self.tipTitle = tipTitle
        let tipTitleWithoutPercent = String(tipTitle.dropLast())
        self.tip = Double(tipTitleWithoutPercent)! / 100
    }
    
    mutating func calculateTotalBill () {
        totalBill = (bill! + bill! * tip) / numberOfPeople
    }
    
    func getTotalBill() -> String {
        return(String(format: "%.2f", totalBill!))
    }
    
    func getNumberOfPeople() -> String {
        return(String(format: "%.0f", numberOfPeople))
    }
    
    func getTip() -> String {
        return tipTitle
    }
}
