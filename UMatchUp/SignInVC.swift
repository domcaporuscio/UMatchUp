//
//  SignInVC.swift
//  UMatchUp
//
//  Created by Dominic Caporuscio on 11/12/20.
//

import UIKit
import FirebaseAuth
import Firebase

class SignInVC: UIViewController, UITextFieldDelegate {
    
    var titleLabel: UILabel!
    var segment: UISegmentedControl!
    var emailTextView: UITextView!
    var emailLabel: UILabel!
    var emailField: UITextField!
    var signInAndRegisterButton: UIButton!
    
    var spacer:CGFloat = 50
    

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTitle()
        setupSegment()
        setupEmailUI()
        setupSignInAndRegisterButton()
    }
    
    func setupTitle(){
        titleLabel = UILabel(frame: CGRect(x: 0, y: 0,
                                      width: self.view.frame.width,
                                      height: self.view.frame.height/4))
        titleLabel.backgroundColor = UIColor.clear
        titleLabel.text = "UMatch Up"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 45)
        //titleLabel.textColor = blue
        titleLabel.textAlignment = .center
        self.view.addSubview(titleLabel)
    }
    
    func setupSegment() {
       let segmentItems = ["Create Account", "Sign In"]
       segment = UISegmentedControl(items: segmentItems)
        segment.frame = CGRect(x: self.view.frame.minX + spacer, y: self.titleLabel.frame.maxY,
                               width: self.view.frame.width - (spacer*2), height: 44)
       segment.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
       segment.selectedSegmentIndex = 0
       view.addSubview(segment)
    }
    
    @objc func segmentControl(_ segmentedControl: UISegmentedControl) {
       switch (segmentedControl.selectedSegmentIndex) {
          case 0:
            print("Tapped: Create Account")
            signInAndRegisterButton.setTitle("Create Account", for: .normal)
          break
          case 1:
             print("Tapped: Sign In")
             signInAndRegisterButton.setTitle("Sign In", for: .normal)
          break
          default:
          break
       }
    }
    
    func setupEmailUI(){
        emailLabel = UILabel(frame: CGRect(x: spacer, y: segment.frame.maxY + spacer,
                                           width: self.view.frame.width - (spacer*2), height: 30))
        emailLabel.backgroundColor = UIColor.clear
        emailLabel.text = "UMich Uniqname"
        emailLabel.font = UIFont.systemFont(ofSize: 19)
        //emailLabel.textColor = blue
        emailLabel.textAlignment = .left
        self.view.addSubview(emailLabel)
        
        emailField = UITextField(frame: CGRect(x: spacer, y: self.emailLabel.frame.maxY,
                                               width: 0.6*(self.view.frame.width - (spacer*2)), height: 50))
        emailField.backgroundColor = UIColor.init(red: 0.5, green: 0.5, blue: 0.9, alpha: 0.2)
        emailField.layer.cornerRadius = 25
        //emailField.textColor = blue
        emailField.placeholder = "schlissel"
        //emailField.attributedPlaceholder = NSAttributedString(string: "schlissel", attributes: [NSAttributedString.Key.foregroundColor : UIColor.lightGray])
        self.emailField.delegate = self
        emailField.textAlignment = .right
        emailField.tag = 0
        emailField.autocapitalizationType = .none
        emailField.font = UIFont.systemFont(ofSize: 17)
        self.view.addSubview(emailField)
        
        //let domainLabel = UILabel(frame: CGRect(x: emailField.frame.maxX, y: emailField.frame.minY,
                                               // width: 0.4*emailLabel.frame.width, height: emailField.frame.height))
        let domainLabel = UITextField(frame: CGRect(x: emailField.frame.maxX, y: emailField.frame.minY,
                                                    width: 0.4*emailLabel.frame.width, height: emailField.frame.height))
        domainLabel.text = "@umich.edu"
        domainLabel.isUserInteractionEnabled = false
        domainLabel.font = UIFont.systemFont(ofSize: 17)
        //domainLabel.textColor = blue
        domainLabel.textAlignment = .left
        domainLabel.backgroundColor = .clear//emailField.backgroundColor
        self.view.addSubview(domainLabel)
    }

    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        // Try to find next responder
        if let nextField = textField.superview?.viewWithTag(textField.tag + 1) as? UITextField {
           nextField.becomeFirstResponder()
        } else {
           // Not found, so remove keyboard.
           textField.resignFirstResponder()
        }
        // Do not add a line break
        return false
    }
    
    
    
    func setupSignInAndRegisterButton(){
        signInAndRegisterButton = UIButton(frame: CGRect(x: spacer, y: emailField.frame.maxY + spacer,
                                                         width: self.view.frame.width - (spacer*2), height: 50))
        signInAndRegisterButton.layer.cornerRadius = 25
        //signInAndRegisterButton.backgroundColor = UIColor.init(red: <#T##CGFloat#>, green: <#T##CGFloat#>, blue: <#T##CGFloat#>, alpha: <#T##CGFloat#>)
        signInAndRegisterButton.setTitle("Create Account", for: .normal)
        //signInAndRegisterButton.addTarget(self, action: #selector(pressedSignInAndRegisterButton), for: .touchUpInside)
        self.view.addSubview(signInAndRegisterButton)
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
