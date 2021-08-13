//
//  ViewController.swift
//  MemoryGameUIKit
//
//  Created by Admin on 08.08.2021.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        designMenu()
        
        view.backgroundColor = .black
    }
    
    
    func designMenu(){
        let buttonNewGame = UIButton()
        buttonNewGame.setTitle("Новая Игра", for: .normal)
        buttonNewGame.titleLabel?.font = UIFont.systemFont(ofSize: 50, weight: .bold)
        buttonNewGame.setTitleColor(.orange, for: .normal)
        buttonNewGame.addTarget(self, action: #selector(openGameView), for: .touchUpInside)
        view.addSubview(buttonNewGame)
        
        
        
        buttonNewGame.translatesAutoresizingMaskIntoConstraints = false
        buttonNewGame.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonNewGame.topAnchor.constraint(equalTo: view.topAnchor, constant: 300).isActive = true
        
        let buttonRecord = UIButton()
        buttonRecord.setTitle("Топ рекордов", for: .normal)
        buttonRecord.titleLabel?.font = UIFont.systemFont(ofSize: 35, weight: .bold)
        buttonRecord.setTitleColor(.orange, for: .normal)
        buttonRecord.addTarget(self, action: #selector(openRecordGameView), for: .touchUpInside)
        view.addSubview(buttonRecord)
        
        
        
        buttonRecord.translatesAutoresizingMaskIntoConstraints = false
        buttonRecord.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonRecord.topAnchor.constraint(equalTo: view.topAnchor, constant: 400).isActive = true
        
        let buttonSetting = UIButton()
        buttonSetting.setTitle("Настройки", for: .normal)
        buttonSetting.titleLabel?.font = UIFont.systemFont(ofSize: 30, weight: .bold)
        buttonSetting.setTitleColor(.orange, for: .normal)
        buttonSetting.addTarget(self, action: #selector(openSettingView), for: .touchUpInside)
        view.addSubview(buttonSetting)
        
        
        
        buttonSetting.translatesAutoresizingMaskIntoConstraints = false
        buttonSetting.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        buttonSetting.topAnchor.constraint(equalTo: view.topAnchor, constant: 500).isActive = true
       
    }
    
    @objc func openGameView(){
        let gameview = GameView()
        gameview.modalPresentationStyle = .fullScreen
       self.present(gameview, animated: true)
    }
    
    @objc func openSettingView(){
        let settingview = SettingView()
        settingview.modalPresentationStyle = .fullScreen
       self.present(settingview, animated: true)
    }
    
    @objc func openRecordGameView(){
        let settingview = RecordGameView()
        settingview.modalPresentationStyle = .fullScreen
       self.present(settingview, animated: true)
    }
}
