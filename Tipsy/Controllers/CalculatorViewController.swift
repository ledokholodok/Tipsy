import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPercentButton: UIButton!
    @IBOutlet weak var tenPercentButton: UIButton!
    @IBOutlet weak var twentyPercentButton: UIButton!
    @IBOutlet weak var splitNumberLabel: UILabel!
    
    var calculatorBrain = CalculatorBrain()
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        zeroPercentButton.isSelected = false
        tenPercentButton.isSelected = false
        twentyPercentButton.isSelected = false
        sender.isSelected = true
        
        let tipTitle = sender.currentTitle!
        calculatorBrain.setTip(tipTitle)
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        let numberOfPeople = sender.value
        calculatorBrain.setNumberOfPeople(numberOfPeople)
        splitNumberLabel.text = String(format: "%.0f", numberOfPeople)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = Double(billTextField.text!) ?? 2500.0
        calculatorBrain.setBill(bill)
        calculatorBrain.calculateTotalBill()
        performSegue(withIdentifier: "goToResult", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destinationVC = segue.destination as! ResultViewController
        destinationVC.total = calculatorBrain.getTotalBill()
        destinationVC.numberOfPeople = calculatorBrain.getNumberOfPeople()
        destinationVC.tip = calculatorBrain.getTip()
    }
}

