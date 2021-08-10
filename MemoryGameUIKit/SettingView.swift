//
//  SettingViewController.swift
//  MemoryGameUIKit
//
//  Created by Admin on 10.08.2021.
//

import UIKit

class SettingView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        let label = UILabel()
        label.text = "Test Label"
        label.font = label.font.withSize(CGFloat(55))
        label.textColor = .orange

        let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel))
        tap.numberOfTapsRequired = 1
        label.isUserInteractionEnabled = true
        label.addGestureRecognizer(tap)
        
        view.addSubview(label)
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        label.topAnchor.constraint(equalTo: view.topAnchor, constant: 250).isActive = true
        // Do any additional setup after loading the view.
    }
    

    @objc func tapLabel(){
        dismiss(animated: true) {
            print("close")
        }
    }

}
