//
//  BMITrackingTableViewController.swift
//  BMI Calculator App
//
//  Created by Reda Mehali on 12/11/20.
//

import UIKit
import CoreData

class BMITrackingTableViewController : UITableViewController {
    
    var bmis = [bmi]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        retrieveData()
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier = "BMITableCell"
        guard let cell = super.tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? BMITableCell else {
            fatalError("The dequeued cell is not an instance of BMITableCell.")
        }
        
        return cell
    }
}

extension UITableViewController {
    func retrieveData()  {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            let fetchRequest = NSFetchRequest<BMIDataEntity>(entityName: "BMIDataEntity")
            
            var bmis = [bmi]()
            var i = 0
            
            do {
                let results = try context.fetch(fetchRequest)
                for result in results {
//                    if let weight = result.weight {
//                        bmis[i].weight = weight
//                    }
                }
                
//                if let nameR = result.name {
//                    name.text = nameR
//                }
                print("**********************************")
            } catch {
                print("Could not retrieve...")
            }
        }
    }
}
