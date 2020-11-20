//
//  ProfileVC.swift
//  UMatchUp
//
//  Created by Dominic Caporuscio on 11/19/20.
//

import UIKit

class ProfileVC: UIViewController {
    
    var nameLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded ProfileVC")
        
        setupNameLabel()
        
    }
    
    func setupNameLabel() {
        nameLabel = UILabel(frame: CGRect(x: view.frame.minX, y: view.frame.midY, width: view.frame.width, height: 50))
        nameLabel.backgroundColor = .orange
        nameLabel.textAlignment = .center
        nameLabel.text = "Name Goes Here"
        view.addSubview(nameLabel)
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
