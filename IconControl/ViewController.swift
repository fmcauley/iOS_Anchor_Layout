/*
*/

import UIKit

class ViewController: UIViewController {
    
    lazy var iconControl : IconControl = {
        return IconControl(frame: .zero)
    }()
  
    @IBAction func iconControlTapped(sender: AnyObject) {
        print("Is there anybody out there?")
    }
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
//    iconControl.text = "My Icon Control"
//    iconControl.image = UIImage(named: "cocktail")
//    iconControl.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
//    iconControl.spacing = 81.0
//    
//    view.addSubview(iconControl)
//    
//    NSLayoutConstraint.activateConstraints([
//        iconControl.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
//        iconControl.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
//        ])
  }
}

