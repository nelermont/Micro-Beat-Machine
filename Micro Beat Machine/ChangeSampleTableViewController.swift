//
//  ChangeSampleTableViewController.swift
//  Micro Beat Machine
//
//  Created by Дмитрий Подольский on 04.12.2020.
//

import UIKit

class ChangeSampleTableViewController: UITableViewController {
    let playBeat = PlayBeat()
    let viewController = ViewController()
    
    var kick = "kick"
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func insertKick1(_ sender: UIButton) {
        playBeat.setSound(forResource: "\(kick)2")
    }
    
    @IBAction func goNewSampleAction(_ sender: UIButton) {
        viewController.loops = "kick"
    }
    
}
