//
//  ViewController.swift
//  RxRegex_Example
//
//  Created by 최형우 on 2022/01/03.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import RxRegex
import RxSwift
import UIKit
import RxCocoa

class ViewController: UIViewController{
    
    @IBOutlet weak var textField: UITextField!
    
    @IBOutlet weak var validationLabel: UILabel!
    
    private let pattern = "^[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,20}$"
    
    private let disposeBag: DisposeBag = .init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let sharedText = textField.rx.text.asObservable().regex(pattern).share(replay: 2)
        
        sharedText
            .map { $0 ? UIColor.blue : UIColor.red }
            .bind(to: validationLabel.rx.textColor)
            .disposed(by: disposeBag)
        
        sharedText
            .map { $0 ? "Valid" : "Invalid" }
            .bind(to: validationLabel.rx.text)
            .disposed(by: disposeBag)
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    @objc func textFieldDidChange(_ sender: UITextField){
        
    }
}
