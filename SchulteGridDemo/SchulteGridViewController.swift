//
//  SchulteGridViewController.swift
//  SchulteGridDemo
//
//  Created by Lois_pan on 2017/12/29.
//  Copyright © 2017年 Lois_pan. All rights reserved.
//

import UIKit

class SchulteGridViewController: UIViewController {
    let count: NSInteger
    init(count: NSInteger) {
        self.count = count
        super.init(nibName: nil, bundle: nil)
    }
    
    let perW = 40
    let tapTop = 100
    
    var tapLeft = 60
    
    var resultArr: [Int] = []
    var addReultArr:[Int] = []
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.black
        self.resultArr = self.getData()
        self.navigationItem.title = "舒尔特表格"
        switch self.resultArr.count {
            case 49:
                tapLeft = 20
            break
            
            default:
            break
        }
        
        self.createButton()
    }
    
    private func createButton() {
        for i in 0..<self.resultArr.count {
            let button = UIButton()
            button.tag = self.resultArr[i]
            button.setTitle(String(self.resultArr[i]), for: UIControlState.normal)
            button.setTitleColor(UIColor.white, for: UIControlState.normal)
            button.backgroundColor = UIColor.lightGray
            button.layer.cornerRadius = 6
            button.layer.borderWidth = 1
            button.clipsToBounds = true
            button.layer.borderColor = UIColor.red.cgColor
            print(i % Int(sqrt(Double(self.count))))
            print(i / Int(sqrt(Double(self.count))))
            
            button.frame = CGRect(x:tapLeft + (perW+10) * (i % Int(sqrt(Double(self.count)))) , y: tapTop +  (perW+10) * (i / Int(sqrt(Double(self.count)))) , width:perW, height:perW)
            
            button.addTarget(self, action: #selector(buttonClick(button:)), for: UIControlEvents.touchUpInside)
            self.view.addSubview(button)
        }
    }
    
    @objc private func buttonClick(button:UIButton) {
        let tag = button.tag
        print(tag)

        if tag == self.addReultArr.count + 1 {
            self.addReultArr.append(tag)
            button.isHidden = true
        }
    }
    
    private func getData() -> Array<Int> {
        var mutableArr: [Int] = []
        for i in 0...(self.count-1){
            mutableArr.append(i+1)
        }
        
        for i in 0..<mutableArr.count {
            let index = (Int)(arc4random())%(mutableArr.count-i) + i
            mutableArr.swapAt(i, index)
        }
        return mutableArr
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

}

