//
//  CaringController.swift
//  Carat
//
//  Created by 문지수 on 2020/09/06.
//  Copyright © 2020 이가영. All rights reserved.
//

import UIKit

class CaringController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = UIColor.blue
    }
    
    override func willMove(toParent parent: UIViewController?) {
        print(#function)
        
    }
    
    override func didMove(toParent parent: UIViewController?) {
        print(#function)
    }
}
