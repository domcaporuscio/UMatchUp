//
//  SignInVC.swift
//  UMatchUp
//
//  Created by Dominic Caporuscio on 11/12/20.
//

import UIKit
import FirebaseAuth

class SignInVC: UIViewController {
    
    var emailTextView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        emailTextView = UITextView(frame: CGRect(x: 67, y: 200, width: view.frame.width/2, height: 74))
        emailTextView.center = view.center
        emailTextView.backgroundColor = .orange
        
        view.addSubview(emailTextView)
        print("test")
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
