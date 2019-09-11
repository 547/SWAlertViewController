//
//  ViewController.swift
//  SWAlertViewController
//
//  Created by 547 on 09/11/2019.
//  Copyright (c) 2019 547. All rights reserved.
//

import UIKit
import SWAlertViewController
class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let cacel = CFAlertAction.init(title: "cancel", style: .Default, alignment: .justified, backgroundColor: UIColor.white, textColor: UIColor.blue, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: UIColor.blue, borderWidth: 1.0, handler: nil)
        let aa = CFAlertAction.init(title: "comfir", style: .Default, alignment: .justified, backgroundColor: UIColor.blue, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: nil, borderWidth: nil, handler: nil)
        let alert = CFAlertViewController.init(title: "test", message: "this is message", titleFont: UIFont.systemFont(ofSize: 17), messageFont: UIFont.systemFont(ofSize: 15), titleAndMessageSpace: 18, textAlignment: .center, margin: 18, cornerRadius: 8, borderColor: nil, borderWidth: nil, preferredStyle: .alert, actionsArrangement: .horizontal, didDismissAlertHandler: nil)
        
        alert.addAction(cacel)
        alert.addAction(aa)
        present(alert, animated: true, completion: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

