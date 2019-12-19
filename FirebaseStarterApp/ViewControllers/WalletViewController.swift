//
//  WalletViewController.swift
//  FirebaseStarterApp
//
//  Created by apurva on 18/12/19.
//

import UIKit

class WalletViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var arrayCoupon:[String]?
    var totalCoupounAmount: Int  = 100
    @IBOutlet weak var lblTotalCredit: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib =  UINib(nibName: "CouponCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "couponcell")
        tableView.delegate = self
        tableView.dataSource = self
        self.tableView.tableFooterView = UIView()
        self.title = "Wallet"
        // Do any additional setup after loading the view.
    }

    @IBAction func createCouponCodeClicked(_ sender: Any) {
        
        let alertController = UIAlertController(title: "Create Coupoun", message: "", preferredStyle: .alert)
        alertController.addTextField {(textField : UITextField!) -> Void in
            textField.placeholder = "Enter Amount for the coupoun"
        }
        let saveAction = UIAlertAction(title: "Save", style: .default, handler: {[unowned self]  alert -> Void in
            let amountField = alertController.textFields![0] as UITextField
            if let amount = amountField.text {
                if self.validationCheckForCoupon(amount: amount) {
                    self.addCoupon(amount: amount)
                } else {
                    self.coupounValidationAlert()
                }
            }
        })
        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: {
            (action : UIAlertAction!) -> Void in })
        
        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
    
    func addCoupon(amount: String){
        if arrayCoupon == nil {
            arrayCoupon = [String]()
        }
        arrayCoupon?.append(amount)
        updateTotalCredit(amount: amount)
        tableView.reloadData()
    }
    
    func updateTotalCredit(amount: String){
        totalCoupounAmount = totalCoupounAmount - Int(amount)!
        lblTotalCredit.text = "You have credit of  $ \(totalCoupounAmount)"
    }
    
    func validationCheckForCoupon(amount: String) -> Bool{
        if let amount = Int(amount){
            if amount > totalCoupounAmount {
                coupounValidationAlert()
                return false
            }
        } else {
            return false
        }
        return true
    }
    
    func coupounValidationAlert(){
        let alertController = UIAlertController(title: "Youd don't have enough amount in the wallet", message: "", preferredStyle: .alert)
        let action = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(action)
        self.present(alertController, animated: true, completion: nil)

    }
    
}

extension WalletViewController: UITableViewDelegate{
    
}
//
extension WalletViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayCoupon?.count ?? 0
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "couponcell", for: indexPath) as! CouponCell
        cell.lblCoupAmount.text = "$ \(arrayCoupon![indexPath.row]) coupoun for the partener company"
        return cell
        
    }


}
