//
//  RecordGameView.swift
//  MemoryGameUIKit
//
//  Created by Admin on 13.08.2021.
//

import UIKit

class RecordGameView: UIViewController {
    
    let labelTopRecordOneLevel = UILabel()
    let labelTopRecordTwoLevel = UILabel()
    let labelTopRecordThreeLevel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        
        designMenu()
        loadRecordData()
        
        // Do any additional setup after loading the view.
    }
    
    func designMenu(){
        
        labelTopRecordOneLevel.font = labelTopRecordOneLevel.font.withSize(CGFloat(35))
        labelTopRecordOneLevel.textColor = .orange
        labelTopRecordOneLevel.numberOfLines = 0
        view.addSubview(labelTopRecordOneLevel)
        
        labelTopRecordOneLevel.translatesAutoresizingMaskIntoConstraints = false
        labelTopRecordOneLevel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTopRecordOneLevel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
        
        labelTopRecordTwoLevel.font = labelTopRecordTwoLevel.font.withSize(CGFloat(35))
        labelTopRecordTwoLevel.textColor = .orange
        labelTopRecordTwoLevel.numberOfLines = 0
  
        view.addSubview(labelTopRecordTwoLevel)
        
        labelTopRecordTwoLevel.translatesAutoresizingMaskIntoConstraints = false
        labelTopRecordTwoLevel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTopRecordTwoLevel.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        labelTopRecordThreeLevel.font = labelTopRecordThreeLevel.font.withSize(CGFloat(35))
        labelTopRecordThreeLevel.textColor = .orange
        labelTopRecordThreeLevel.numberOfLines = 0
        
        view.addSubview(labelTopRecordThreeLevel)
        
        labelTopRecordThreeLevel.translatesAutoresizingMaskIntoConstraints = false
        labelTopRecordThreeLevel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        labelTopRecordThreeLevel.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
        
        let buttonClose = UIButton()
        buttonClose.setTitle("Назад", for: .normal)
        buttonClose.titleLabel?.font = UIFont.systemFont(ofSize: 45, weight: .bold)
        buttonClose.setTitleColor(.orange, for: .normal)
        buttonClose.addTarget(self, action: #selector(clickBackView), for: .touchUpInside)
        view.addSubview(buttonClose)
        
        
        
        buttonClose.translatesAutoresizingMaskIntoConstraints = false
        buttonClose.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonClose.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -100).isActive = true
    }
    
    @objc func clickBackView(){
        dismiss(animated: true, completion: nil)
    }
    
    func loadRecordData(){
        let topRecordOneLevel = UserDefaults.standard.object(forKey: "topRecordOneLevel")
        if topRecordOneLevel != nil {
            let levelRecord = topRecordOneLevel as! Int
            labelTopRecordOneLevel.text = "Лучший рекорд \n 1 уровня: \(String(levelRecord)) попыток"
        }
        else{
            labelTopRecordOneLevel.text = "Не было выигрыша \n на 1 уровне"
        }
        
        let topRecordTwoLevel = UserDefaults.standard.object(forKey: "topRecordTwoLevel")
        if topRecordTwoLevel != nil {
            let levelRecord = topRecordTwoLevel as! Int
            labelTopRecordTwoLevel.text = "Лучший рекорд \n 2 уровня: \(String(levelRecord)) попыток"
        }
        else{
            labelTopRecordTwoLevel.text = "Не было выигрыша \n на 2 уровне"
        }
        
        let topRecordThreeLevel = UserDefaults.standard.object(forKey: "topRecordThreeLevel")
        if topRecordThreeLevel != nil {
            let levelRecord = topRecordThreeLevel as! Int
            labelTopRecordThreeLevel.text = "Лучший рекорд \n 3 уровня: \(String(levelRecord)) попыток"
        }
        else{
            labelTopRecordThreeLevel.text = "Не было выигрыша \n на 3 уровне"
        }
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

