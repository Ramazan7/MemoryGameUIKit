//
//  ViewController.swift
//  MemoryGameUIKit
//
//  Created by Admin on 08.08.2021.
//

import UIKit

class ViewController: UIViewController {

    var countFlip = 0
    var emodji = ["🐌","🐞","🐌","🐞","🦅","🦉","🦅","🦉"]
    var emodjiSelect = 0
    override func viewDidLoad() {
        super.viewDidLoad()
       gameLevelView(level: 1)
        // Do any additional setup after loading the view.
       // gameLevelView(widthCount: 2, heightCount: 2)
    }

    func gameLevelView(level:Int){
        var widthCount = 0
        var heightCount = 0
        var labelTag = 1
        var distanceLabel = 0
        var sizeEmodji = 0
         var topConctrait = 0
         var leadingConstrait = 0
        
        // - 1 fix array
        switch level {
        case 1:
            widthCount = 2 - 1
            heightCount = 2 - 1
            sizeEmodji = 120
            distanceLabel = 100
        case 2:
            widthCount = 4 - 1
            heightCount = 4 - 1
            sizeEmodji = 60
            distanceLabel = 50
        case 3:
            widthCount = 4 - 1
            heightCount = 6 - 1
            sizeEmodji = 30
            distanceLabel = 25
        default:
            print("error")
        }
        
      
        for _ in 0...heightCount {
        for wCount in 0...widthCount {
            let label = UILabel()
            label.text = emodji[labelTag - 1]
            label.font = label.font.withSize(CGFloat(sizeEmodji))
            label.tag = labelTag
            labelTag = labelTag + 1
            
            let tap = UITapGestureRecognizer(target: self, action: #selector(tapLabel(_:)))
                tap.numberOfTapsRequired = 1
                label.isUserInteractionEnabled = true
                label.addGestureRecognizer(tap)
            
            view.addSubview(label)
            
            label.translatesAutoresizingMaskIntoConstraints = false
            label.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(topConctrait)).isActive = true
            label.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: CGFloat(leadingConstrait)).isActive = true
            leadingConstrait = leadingConstrait + distanceLabel
            
        }
            topConctrait = topConctrait + 120
            leadingConstrait = 0
        
    }

}
    @objc func tapLabel(_ sender: UIGestureRecognizer) {
        let tag = (sender.view as! UILabel)
        tag.text = emodji[2]
      /*  let alert = UIAlertController(title: "Выбрали", message: "Select: \(tag)", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)*/
    }
}
