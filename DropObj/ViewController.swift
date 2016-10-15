//
//  ViewController.swift
//  DropObj
//
//  Created by Rachid on 14/10/2016.
//  Copyright © 2016 Rachid. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var gameView: ShapeView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tapGR = UITapGestureRecognizer(target: self, action: #selector(ViewController.didTap(_:)))
        self.view.addGestureRecognizer(tapGR)
    }
    
//    override func viewDidAppear(animated: Bool) {
//        super.viewDidAppear(animated)
//        gameView.animating = true
//    }
//    
//    override func viewWillDisappear(animated: Bool) {
//        super.viewWillDisappear(animated)
//        gameView.animating = false
//    }

    func didTap(tapGR: UITapGestureRecognizer) {
        
        let tapLocation = tapGR.locationInView(self.view)
        
        let shapeView = ShapeView(origin: tapLocation)

        gameView.addSubview(shapeView)
//        gameView.gravity.addItem(shapeView)
    }
}

