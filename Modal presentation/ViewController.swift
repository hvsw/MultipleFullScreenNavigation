//
//  ViewController.swift
//  Modal presentation
//
//  Created by Henrique Valcanaia on 2020-01-13.
//  Copyright © 2020 Henrique Valcanaia. All rights reserved.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet weak var presentationStyleSegmentedControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presentationStyleSegmentedControl.selectedSegmentIndex = UIModalPresentationStyle.pageSheet.rawValue
    }
    @IBAction func pushNavigation(_ sender: Any) {
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!
        let nav = UINavigationController(rootViewController: vc )
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true)
    }
    
    @IBAction func pushVC(_ sender: Any) {
        guard let modalPresentationStyle = UIModalPresentationStyle(rawValue: self.presentationStyleSegmentedControl.selectedSegmentIndex) else {
            print("Invalid selectedSegmentedIndex (\(self.presentationStyleSegmentedControl.selectedSegmentIndex))")
            return
        }
        let vc = UIStoryboard(name: "Main", bundle: Bundle.main).instantiateInitialViewController()!
        vc.modalPresentationStyle = modalPresentationStyle
        self.present(vc, animated: true)
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true)
    }
}

