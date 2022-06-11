//
//  ViewController.swift
//  Dice
//
//  Created by Oleksii Mykhalchuk on 5/20/22.
//

import UIKit

class ViewController: UIViewController {
let dice = [
  "inverted-dice-1",
  "inverted-dice-2",
  "inverted-dice-3",
  "inverted-dice-4",
  "inverted-dice-5",
  "inverted-dice-6"
]
  var image: UIImageView!
  var button: UIButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    image = UIImageView()
    image.image = UIImage(named: dice[0])
//    image.bounds.size = CGSize(width: 200, height: 200)
    view.addSubview(image)
    image.translatesAutoresizingMaskIntoConstraints = false
    let constraints = [
      image.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      image.centerYAnchor.constraint(equalTo: view.centerYAnchor),
      image.widthAnchor.constraint(equalToConstant: 200),
      image.heightAnchor.constraint(equalToConstant: 200)
    ]
    NSLayoutConstraint.activate(constraints)
    button = UIButton()
    button.setTitle("Roll", for: .normal)
    button.setTitleColor(.black, for: .highlighted)
    button.backgroundColor = .red
    button.layer.cornerRadius = 20
    view.addSubview(button)
    button.translatesAutoresizingMaskIntoConstraints = false
    let constraintsBTN = [
      button.topAnchor.constraint(equalTo: image.bottomAnchor, constant: 50),
      button.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      button.widthAnchor.constraint(equalToConstant: 100),
      button.heightAnchor.constraint(equalToConstant: 50)
    ]
    NSLayoutConstraint.activate(constraintsBTN)
    button.addTarget(self, action: #selector(Roll), for: .touchUpInside)
  }

  @objc func Roll(sender: Any) {
    let num = Int.random(in: 0..<6)
    image.rotate()
    switch num {
      case 0:
        image.image = UIImage(named: dice[num])
      case 1:
        image.image = UIImage(named: dice[num])
      case 2:
        image.image = UIImage(named: dice[num])
      case 3:
        image.image = UIImage(named: dice[num])
      case 4:
        image.image = UIImage(named: dice[num])
      case 5:
        image.image = UIImage(named: dice[num])
      default:
        break
    }
  }
}
extension UIView {
  func rotate() {
    let rotation = CABasicAnimation(keyPath: "transfprm.rotation.z")
    rotation.toValue = NSNumber(value: Double.pi * 2)
    rotation.duration = 1
    rotation.isCumulative = true
    rotation.repeatCount = Float.greatestFiniteMagnitude
    self.layer.add(rotation, forKey: nil)
  }
}

