//
//  ViewController.swift
//  BMI Calculator App
//
//  Created by Reda Mehali on 12/11/20.
//

import UIKit
import CoreData

class ViewController: UIViewController {

    @IBOutlet weak var BMISwitch: UISwitch!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var weightTextField: UITextField!
    @IBOutlet weak var resultText: UITextField!
    
    @IBOutlet weak var nameText: UITextField!
    @IBOutlet weak var ageText: UITextField!
    @IBOutlet weak var genderText: UITextField!
    
    var bmi = "metric"
    var result : Float = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
            swipeRight.direction = .right
            self.view.addGestureRecognizer(swipeRight)
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {

        if let swipeGesture = gesture as? UISwipeGestureRecognizer {

            switch swipeGesture.direction {
            case .right:
                print("Swiped right")
                performSegue(withIdentifier: "bmi_tracking_screen", sender: self)
            default:
                break
            }
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! BMITrackingTableViewController
    }
    
    
    @IBAction func BMISwitchState(_ switchUI: UISwitch) {
        if (switchUI.isOn) {
            heightTextField.text = "in meters"
            weightTextField.text = "in kilos"
            bmi = "metric"
        } else {
            heightTextField.text = "in inches"
            weightTextField.text = "in pounds"
            bmi = "imperial"
        }
        resultText.text = String(0)
    }
    
    
    @IBAction func calculateBMI(_ sender: UIButton) {
        if (bmi == "metric") {
            result = Float(weightTextField.text!)! / (Float(heightTextField.text!)! * Float(heightTextField.text!)!)
            resultText.text = String(result)
        } else if (bmi == "imperial") {
            result = Float(weightTextField.text!)! * 703 / (Float(heightTextField.text!)! * Float(heightTextField.text!)!)
            resultText.text = String(result)
        }
        if (!nameText.text!.isEmpty && !ageText.text!.isEmpty && !genderText.text!.isEmpty) {
            self.saveAllData(nameText.text!, nameText.text!, genderText.text!,
                             Float(heightTextField.text!)!, Float(weightTextField.text!)!)
        }
    }
}

extension UIViewController {
    func saveAllData(_ name: String, _ age: String, _ gender: String, _ height: Float, _ weight: Float) {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let context = appDelegate.persistentContainer.viewContext
            
            guard let entityDescription = NSEntityDescription.entity(forEntityName: "BMIDataEntity", in: context) else {return}
            
            let newValue = NSManagedObject(entity: entityDescription, insertInto: context)
            newValue.setValue(name, forKey: "name")
            newValue.setValue(age, forKey: "age")
            newValue.setValue(gender, forKey: "gender")
            newValue.setValue(height, forKey: "height")
            newValue.setValue(weight, forKey: "weight")
            
            do {
                try context.save()
                print("Data saved")
            } catch {
                print("There was a problem while trying to save")
            }
        }
    }
}

