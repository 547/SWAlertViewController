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
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func tapCustomButton(_ sender: UIButton) {
        let cacel = CFAlertAction.init(title: "cancel", leftImage: nil, style: .Default, alignment: .justified, backgroundColor: UIColor.white, textColor: UIColor.blue, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: UIColor.blue, borderWidth: 1.0, contentEdgeInsets: UIEdgeInsets(top: 10, left: 29, bottom: 10, right: 29), handler: nil)
        let aa = CFAlertAction.init(title: "comfir", leftImage: nil, style: .Default, alignment: .justified, backgroundColor: UIColor.blue, textColor: UIColor.white, textFont: UIFont.systemFont(ofSize: 12), cornerRadius: 15, borderColor: nil, borderWidth: nil, contentEdgeInsets: UIEdgeInsets(top: 10, left: 29, bottom: 10, right: 29), handler: nil)
        
        let alert = CFAlertViewController.init(title: "test", titleColor: UIColor.black, message: "this is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is messagethis is message", messageColor: UIColor.gray, titleFont: UIFont.systemFont(ofSize: 12), messageFont: UIFont.systemFont(ofSize: 9), titleAndMessageSpace: 150, textAlignment: .center, separationLineColor: UIColor.gray.withAlphaComponent(0.3), separationLineLeading: 0, separationLineTrailing: 0, textContentBottomMargin: 64, separationLineHeight: 0.5, margin: 30, cornerRadius: 8, borderColor: nil, borderWidth: 0, actionsLeading: 46, actionsTrailing: 46, actionsTop: 18, actionsBottom: 18, actionsSpace: 18, actionsHeight: 30, preferredStyle: .actionSheet, actionsArrangement: .vertical, headerView: nil, footerView: nil, didDismissAlertHandler: nil)
        alert.backgroundStyle = .plain
        alert.addAction(cacel)
        alert.addAction(aa)
        present(alert, animated: true, completion: nil)
    }
    @IBAction func tapButton(_ sender: UIButton) {
        let sheet = UIAlertController(title: "title", message: "message", preferredStyle: .actionSheet)
        let aa = UIAlertAction(title: "aa", style: .destructive, handler: nil)
        let aa1 = UIAlertAction(title: "aa1", style: .default, handler: nil)
        let aa2 = UIAlertAction(title: "aa2", style: .destructive, handler: nil)
        let cancel = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        
        sheet.addAction(aa)
        sheet.addAction(aa1)
        sheet.addAction(aa2)
        sheet.addAction(cancel)
        show(sheet, sender: nil)
        
    }
}

