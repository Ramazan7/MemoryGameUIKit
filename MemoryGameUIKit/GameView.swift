//
//  GameView.swift
//  MemoryGameUIKit
//
//  Created by Admin on 10.08.2021.
//

import UIKit

class GameView: UIViewController {
    var countFlip = 0
    var emodji = [String]()
    var emodjiSelect = 0
    var flipBool = false
    var flipBoolDoubleTap = false
    var OneTapMemoryEmodji = ""
    var OneTapMemoryLabel = UILabel()
    let labelInfoTouch = UILabel()
    var stepperLevelValue = 1
    var nameStyleEmodji = "Животные"
    var countFlipCheckWin = 0
    var countTouchCard = 0
    var topRecordOneLevel = 999
    var topRecordTwoLevel = 999
    var topRecordThreeLevel = 999
    var activeDisplayRecord = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .black
        loadSetting()
        selectEmodji(selectEmodji: nameStyleEmodji)
        loadRecordData()
        gameLevelView(level: stepperLevelValue)
        // Do any additional setup after loading the view.
        // gameLevelView(widthCount: 2, heightCount: 2)
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
    
    func gameLevelView(level:Int){
        var widthCount = 0
        var heightCount = 0
        var labelTag = 1
        var distanceLabel = 0
        
        var sizeEmodji = 0
        var topConctrait = 80
        let leadingConstrait = 10
        // - 1 fix array
        switch level {
        case 1:
            widthCount = 4 - 1
            heightCount = 4 - 1
            sizeEmodji = 70
            distanceLabel = 95
            topConctrait = 140
            activeDisplayRecord = topRecordOneLevel
        case 2:
            widthCount = 4 - 1
            heightCount = 6 - 1
            sizeEmodji = 70
            distanceLabel = 95
            topConctrait = 100
            activeDisplayRecord = topRecordTwoLevel
        case 3:
            widthCount = 6 - 1
            heightCount = 8 - 1
            sizeEmodji = 45
            distanceLabel = 60
            activeDisplayRecord = topRecordThreeLevel
        default:
            print("error")
        }
        
        var topConstraitTemp = topConctrait
        for _ in 0...heightCount {
            // reset value leading new elements
            var leadingConstraitWidthTemp = leadingConstrait
            for _ in 0...widthCount {
                let label = UILabel()
                // label.text = emodji[labelTag - 1]
                label.text = "🟧"
                label.font = label.font.withSize(CGFloat(sizeEmodji))
                label.tag = labelTag
                labelTag = labelTag + 1
                label.backgroundColor = .orange
                
                
                let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(_:)))
                tap.numberOfTapsRequired = 1
                label.isUserInteractionEnabled = true
                label.addGestureRecognizer(tap)
                
                view.addSubview(label)
                
                label.translatesAutoresizingMaskIntoConstraints = false
                label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConstraitTemp)).isActive = true
                label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leadingConstraitWidthTemp)).isActive = true
                leadingConstraitWidthTemp = leadingConstraitWidthTemp + distanceLabel
                
            }
            topConstraitTemp = topConstraitTemp + topConctrait
            
            let buttonClose = UIButton()
            buttonClose.setTitle("Сдаться", for: .normal)
            buttonClose.titleLabel?.font = UIFont.systemFont(ofSize: 20, weight: .bold)
            buttonClose.setTitleColor(.orange, for: .normal)
            buttonClose.addTarget(self, action: #selector(closeGameView), for: .touchUpInside)
            view.addSubview(buttonClose)
            
            
            
            buttonClose.translatesAutoresizingMaskIntoConstraints = false
            buttonClose.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            buttonClose.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
            
            
            
            labelInfoTouch.text = "Количество попыток: \(String(countTouchCard))"
            labelInfoTouch.font = labelInfoTouch.font.withSize(CGFloat(20))
            labelInfoTouch.textColor = .orange
      
            view.addSubview(labelInfoTouch)
            
            labelInfoTouch.translatesAutoresizingMaskIntoConstraints = false
            labelInfoTouch.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 5).isActive = true
            labelInfoTouch.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
            
            let labelDisplayRecord = UILabel()
            labelDisplayRecord.text = "Рекорд:\(String(activeDisplayRecord))"
            labelDisplayRecord.font = labelInfoTouch.font.withSize(CGFloat(20))
            labelDisplayRecord.textColor = .orange
            labelDisplayRecord.numberOfLines = 0
      
            view.addSubview(labelDisplayRecord)
            
            labelDisplayRecord.translatesAutoresizingMaskIntoConstraints = false
            labelDisplayRecord.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -5).isActive = true
            labelDisplayRecord.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50).isActive = true
        }
        
       
    }
    
    @objc func closeGameView(){
        dismiss(animated: true, completion: nil)
    }
    
    func selectEmodji( selectEmodji: String)  {
        
        switch selectEmodji {
        case "Животные":
            emodji = ["🐶","🐱","🐶","🐱","🐭","🐹","🐭","🐹","🐰","🦊","🐰","🦊","🐻","🐼","🐻","🐼","🐻‍❄️","🐨","🐻‍❄️","🐨","🐯","🦁","🐯","🦁","🐮","🐷","🐮","🐷","🐸","🐵","🐸","🐵","🙈","🙉","🙈","🙉","🙊","🐒","🙊","🐒","🐔","🐧","🐔","🐧","🐦","🐤","🐦","🐤"]
        case "Эмоции":
            emodji = ["😀","😃","😀","😃","😄","😁","😄","😁","😆","😅","😆","😅","😂","🤣","😂","🤣","🥲","☺️","🥲","☺️","😊","😇","😊","😇","🙂","🙃","🙂","🙃","😉","😌","😉","😌","😍","🥰","😍","🥰","😘","😗","😘","😗","🤪","😚","🤪","😚","😋","😛","😋","😛"]
        case "Еда":
            emodji = ["🍏","🍎","🍏","🍎","🍐","🍊","🍐","🍊","🍋","🍌","🍋","🍌","🍉","🍇","🍉","🍇","🍓","🫐","🍓","🫐","🍈","🍒","🍈","🍒","🍑","🥭","🍑","🥭","🍍","🥥","🍍","🥥","🥝","🍅","🥝","🍅","🍆","🥑","🍆","🥑","🥦","🥬","🥦","🥬","🥒","🌶","🥒","🌶"]
            
        default:
            print("")
        }
        
        //emodji cound level
        switch stepperLevelValue {
        case 1:
            while emodji.count > 16 {
                emodji.removeLast()
            }
            emodji.shuffle()
            
        case 2:
            while emodji.count > 24 {
                emodji.removeLast()
            }
            emodji.shuffle()
            
        case 3:
            while emodji.count > 48 {
                emodji.removeLast()
            }
            emodji.shuffle()
        default:
            break
        }
        
    }
    
    @objc func tapLabel(_ sender: UIGestureRecognizer) {
        let label = (sender.view as! UILabel)
        if(label.text != "🟧") {
            return
        }
        
        label.text = emodji[label.tag - 1]
        label.backgroundColor = .clear
        
        if(flipBool == false) {
            OneTapMemoryLabel = (sender.view as! UILabel)
            OneTapMemoryEmodji = OneTapMemoryLabel.text!
            flipBool = true
            return
        }
        
        if(flipBool == true) {
            
            if(label.text == OneTapMemoryEmodji){
                flipBool = false
                countFlipCheckWin = countFlipCheckWin + 2
                switch stepperLevelValue {
                case 1:
                    if(countFlipCheckWin == 16){
                        checkWin()
                    }
                case 2:
                    if(countFlipCheckWin == 24){
                        checkWin()
                    }
                case 3:
                    if(countFlipCheckWin == 48){
                        checkWin()
                    }
                default:
                    return
                }
            }
            else {
                
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [self] in
                    flipBool = false
                    OneTapMemoryEmodji = ""
                    label.text = "🟧"
                    label.backgroundColor = .orange
                    OneTapMemoryLabel.text = "🟧"
                    OneTapMemoryLabel.backgroundColor = .orange
                    countTouchCard = countTouchCard + 1
                    labelInfoTouch.text = "Количество попыток: \(String(countTouchCard))"
                    }

                
            }
        }
        
    }
    
    func checkWin(){
        print(stepperLevelValue)
        loadRecordData()
        var winRecord = false
        switch stepperLevelValue {
        case 1:
            if(countTouchCard < topRecordOneLevel) {
            UserDefaults.standard.setValue(countTouchCard, forKey: "topRecordOneLevel")
            UserDefaults.standard.synchronize()
            winRecord = true
            }
        case 2:
            if(countTouchCard < topRecordTwoLevel) {
            UserDefaults.standard.setValue(countTouchCard, forKey: "topRecordTwoLevel")
            UserDefaults.standard.synchronize()
                print("2 save")
            winRecord = true
            }
        case 3:
            if(countTouchCard < topRecordThreeLevel) {
            UserDefaults.standard.setValue(countTouchCard, forKey: "topRecordThreeLevel")
            UserDefaults.standard.synchronize()
            winRecord = true
            }
        default:
            return
        }
        
        
        let alert = UIAlertController(title: winRecord ? "У вас получилось побить рекорд":"Надеюсь получится след раз побить рекорд" ,message: "Кол. попыток: \(String(countTouchCard))", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in
            self.dismiss(animated: true, completion: nil)
        }))
        self.present(alert, animated: true, completion: nil)
        
        winRecord = false
        
    }
    
    func loadRecordData(){
        let tempTopRecordOneLevel = UserDefaults.standard.object(forKey: "topRecordOneLevel")
        if tempTopRecordOneLevel != nil {
            let levelRecord = tempTopRecordOneLevel as! Int
            topRecordOneLevel = levelRecord
        }
        else{
            topRecordOneLevel = 999
        }
        
        let tempTopRecordTwoLevel = UserDefaults.standard.object(forKey: "topRecordTwoLevel")
        if tempTopRecordTwoLevel != nil {
            let levelRecord = tempTopRecordTwoLevel as! Int
            topRecordTwoLevel = levelRecord
        }
        else{
            topRecordTwoLevel = 999
        }
        
        let TempTopRecordThreeLevel = UserDefaults.standard.object(forKey: "topRecordThreeLevel")
        if TempTopRecordThreeLevel != nil {
            let levelRecord = TempTopRecordThreeLevel as! Int
            topRecordThreeLevel = levelRecord
        }
        else{
            topRecordThreeLevel = 999
        }
    }

}
