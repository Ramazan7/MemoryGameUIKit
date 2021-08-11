//
//  SettingViewController.swift
//  MemoryGameUIKit
//
//  Created by Admin on 10.08.2021.
//

import UIKit

class SettingView: UIViewController {
    let labelLevel = UILabel()
    let labelEmodjiSelect = UILabel()
    var stepperLevelValue : Int = 1
    var nameStyleEmodji : String = "Животные"
    override func viewDidLoad() {
        view.backgroundColor = .black
        super.viewDidLoad()
        designSettingView()
        // Do any additional setup after loading the view.
        
    }
    
    func designSettingView(){
       
        loadSetting()
        let labelTextSelectEmodji = UILabel()
        labelTextSelectEmodji.text = "Выберите стиль эмодзи"
        labelTextSelectEmodji.font = labelLevel.font.withSize(CGFloat(30))
        labelTextSelectEmodji.textColor = .orange
        view.addSubview(labelTextSelectEmodji)
        
        labelTextSelectEmodji.translatesAutoresizingMaskIntoConstraints = false
        labelTextSelectEmodji.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTextSelectEmodji.topAnchor.constraint(equalTo: view.topAnchor, constant: 150).isActive = true
        
        labelEmodjiSelect.text = nameStyleEmodji
        labelEmodjiSelect.font = labelLevel.font.withSize(CGFloat(40))
        labelEmodjiSelect.textColor = .orange
        view.addSubview(labelEmodjiSelect)
        
        labelEmodjiSelect.translatesAutoresizingMaskIntoConstraints = false
        labelEmodjiSelect.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelEmodjiSelect.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
       
 
        let emodjiOne = UIButton()
        emodjiOne.setTitle("🐶", for: .normal)
        emodjiOne.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        emodjiOne.addTarget(self, action: #selector(emodjiTap(sender:)), for: .touchUpInside)
        view.addSubview(emodjiOne)
        
        emodjiOne.translatesAutoresizingMaskIntoConstraints = false
        emodjiOne.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        emodjiOne.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        let emodjiTwo = UIButton()
        emodjiTwo.setTitle("😀", for: .normal)
        emodjiTwo.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        emodjiTwo.addTarget(self, action: #selector(emodjiTap(sender:)), for: .touchUpInside)
        view.addSubview(emodjiTwo)
        
        emodjiTwo.translatesAutoresizingMaskIntoConstraints = false
        emodjiTwo.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        emodjiTwo.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        let emodjiThree = UIButton()
        emodjiThree.setTitle("🍏", for: .normal)
        emodjiThree.titleLabel?.font = UIFont.systemFont(ofSize: 50)
        emodjiThree.addTarget(self, action: #selector(emodjiTap(sender:)), for: .touchUpInside)
        view.addSubview(emodjiThree)
        
        emodjiThree.translatesAutoresizingMaskIntoConstraints = false
        emodjiThree.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        emodjiThree.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        
        labelLevel.text = "Уровень сложности: \(String(stepperLevelValue))"
        labelLevel.font = labelLevel.font.withSize(CGFloat(27))
        labelLevel.textColor = .orange
  
        view.addSubview(labelLevel)
        
        labelLevel.translatesAutoresizingMaskIntoConstraints = false
        labelLevel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
        labelLevel.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        let stepperLevel = UIStepper()
        stepperLevel.minimumValue = 1
        stepperLevel.maximumValue = 3
        stepperLevel.backgroundColor = .orange
        stepperLevel.value = Double(stepperLevelValue)
        stepperLevel.addTarget(self, action: #selector(changeStepper(sender:)), for: .valueChanged)
        view.addSubview(stepperLevel)
        
        stepperLevel.translatesAutoresizingMaskIntoConstraints = false
        stepperLevel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 5).isActive = true
        stepperLevel.topAnchor.constraint(equalTo: view.topAnchor, constant: 450).isActive = true
        
        let buttonSave = UIButton()
        buttonSave.setTitle("Сохранить", for: .normal)
        buttonSave.titleLabel?.font = UIFont.systemFont(ofSize: 40, weight: .bold)
        buttonSave.setTitleColor(.orange, for: .normal)
        buttonSave.addTarget(self, action: #selector(saveSetting), for: .touchUpInside)

        view.addSubview(buttonSave)
        
        buttonSave.translatesAutoresizingMaskIntoConstraints = false
        buttonSave.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSave.topAnchor.constraint(equalTo: view.topAnchor, constant: 650).isActive = true
        
    }
    
    
    
    @objc func emodjiTap(sender: UIButton)
    {
        let emodji = sender.titleLabel!.text
        
        switch emodji {
        case "🐶":
            labelEmodjiSelect.text = "Животные"
            nameStyleEmodji = "Животные"
        case "😀":
            labelEmodjiSelect.text = "Эмоции"
            nameStyleEmodji = "Эмоции"
        case "🍏":
            labelEmodjiSelect.text = "Еда"
            nameStyleEmodji = "Еда"
        default:
            nameStyleEmodji = "Животные"
            labelEmodjiSelect.text = "Животные"
        }
    }
    
    @objc func changeStepper(sender: UIStepper){
        stepperLevelValue = Int(sender.value)
        labelLevel.text = "Уровень сложности: \(stepperLevelValue)"
        
    }
    
    @objc func saveSetting(){
        UserDefaults.standard.set(stepperLevelValue, forKey: "levelValue")
        UserDefaults.standard.setValue(nameStyleEmodji, forKey: "styleEmodji")
        UserDefaults.standard.synchronize()
        dismiss(animated: true, completion: nil)
    }

    func loadSetting(){
        let data = UserDefaults.standard.object(forKey: "levelValue")
        if data != nil {
            stepperLevelValue = data as! Int
        }
        else{
            stepperLevelValue = 1
        }
        
        let style = UserDefaults.standard.object(forKey: "styleEmodji")
        if style != nil {
            nameStyleEmodji = style as! String
        }
        else{
            nameStyleEmodji = "Животные"
        }
    }
}
