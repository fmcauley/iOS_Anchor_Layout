/*
*/

import UIKit

class ViewController: UIViewController {
    
    lazy var iconControl : IconControl = {
        return IconControl(frame: .zero)
    }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
    
    iconControl.text = "My Icon Control"
    iconControl.image = UIImage(named: "cocktail")
    // no api needed for background color this is a propery that already exists
    iconControl.backgroundColor = UIColor(white: 0.9, alpha: 1.0)
    
    view.addSubview(iconControl)
    
    NSLayoutConstraint.activateConstraints([
        iconControl.centerXAnchor.constraintEqualToAnchor(view.centerXAnchor),
        iconControl.centerYAnchor.constraintEqualToAnchor(view.centerYAnchor)
        ])
  }
}

