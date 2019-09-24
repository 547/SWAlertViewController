//
//  ViewController.swift
//  SWAlertViewController
//
//  Created by 547 on 09/11/2019.
//  Copyright (c) 2019 547. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        let cacel = CFAlertAction.init(title: "cancel", style: .Default, alignment: .justified, backgroundColor: UIColor.white, textColor: UIColor.blue, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: UIColor.blue, borderWidth: 1.0, contentEdgeInsets: UIEdgeInsets(top: 10, left: 29, bottom: 10, right: 29), handler: nil)
        let aa = CFAlertAction.init(title: "comfir", style: .Default, alignment: .justified, backgroundColor: UIColor.blue, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: nil, borderWidth: nil, contentEdgeInsets: UIEdgeInsets(top: 10, left: 29, bottom: 10, right: 29), handler: nil)
//        let alert = CFAlertViewController.init(title: "test", message: "this is message", titleFont: UIFont.systemFont(ofSize: 17), messageFont: UIFont.systemFont(ofSize: 15), titleAndMessageSpace: 18, textAlignment: .center, margin: 18, cornerRadius: 8, borderColor: nil, borderWidth: nil, preferredStyle: .alert, actionsArrangement: .horizontal, didDismissAlertHandler: nil)
        
        let alert = CFAlertViewController.init(title: "test", titleColor: UIColor.black, message: "this is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is message", messageColor: UIColor.gray, titleFont: UIFont.systemFont(ofSize: 12), messageFont: UIFont.systemFont(ofSize: 9), titleAndMessageSpace: 19, textAlignment: .center, separationLineColor: UIColor.gray.withAlphaComponent(0.3), separationLineLeading: 0, separationLineTrailing: 0, textContentBottomMargin: 64, separationLineHeight: 0.5, margin: 30, cornerRadius: 8, borderColor: nil, borderWidth: 0, actionsLeading: 46, actionsTrailing: 46, actionsTop: 18, actionsBottom: 18, actionsSpace: 18, actionsHeight: 30, preferredStyle: .alert, actionsArrangement: .horizontal, headerView: nil, footerView: nil, didDismissAlertHandler: nil)
        alert.backgroundStyle = .plain
        alert.addAction(cacel)
        alert.addAction(aa)
        present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

