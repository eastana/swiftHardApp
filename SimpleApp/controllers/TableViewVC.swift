////
////  TableViewVC.swift
////  SimpleApp
////
////  Created by Kuanyshbay Ibragim on 12.01.2021.
////
//
//import UIKit
//private let cellId = "cellId"
//
//class TableViewCell2: UITableViewCell {
//
//    lazy var titleLabel: UILabel = {
//        let label = UILabel()
//        label.text = "fffff"
//        return label
//    }()
//
//    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
//        super.init(style: style, reuseIdentifier: reuseIdentifier)
//        addLabel()
//    }
//
//    func addLabel() {
//        addSubview(titleLabel)
//
//        titleLabel.anchor(top: topAnchor, leading: leadingAnchor, bottom: bottomAnchor, trailing: trailingAnchor, padding: .init(top: 10, left: 10, bottom: 10, right: 10), size: .init(width: 100, height: 50))
//    }
//
//    required init?(coder: NSCoder) {
//        fatalError("init(coder:) has not been implemented")
//    }
//
//}
//
//class TableViewVC: UIViewController {
//
//    lazy var tableView: UITableView = {
//        let tableView = UITableView()
//        tableView.register(TableViewCell2.self, forCellReuseIdentifier: cellId)
//        tableView.delegate = self
//        tableView.dataSource = self
//        return tableView
//    }()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        addView()
//
//    }
//
//    func addView() {
//        view.addSubview(tableView)
//        tableView.anchor(top: view.topAnchor, leading: view.leadingAnchor, bottom: view.bottomAnchor, trailing: view.trailingAnchor)
//    }
//
//    @objc func printSome() {
//        print("sss")
//    }
//}
//
//
//extension TableViewVC: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("pressed")
//    }
//
//}
//
//extension TableViewVC: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return 2
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as? TableViewCell2
//        return cell!
//    }
//}
//
//
//
//
//struct AnchoredConstraints {
//    var top, leading, bottom, trailing, width, height: NSLayoutConstraint?
//}
//
//extension UIView {
//    func profileCardView() {
//        layer.shadowColor = UIColor.gray.cgColor
//        layer.shadowOpacity = 0.4
//        layer.shadowOffset = CGSize.zero
//        layer.shadowRadius = 14
//        layer.cornerRadius = 20
//    }
//}
//
//extension UIView {
//
//    func anchor(top: NSLayoutYAxisAnchor? = nil,
//                left: NSLayoutXAxisAnchor? = nil,
//                bottom: NSLayoutYAxisAnchor? = nil,
//                right: NSLayoutXAxisAnchor? = nil,
//                paddingTop: CGFloat = 0,
//                paddingLeft: CGFloat = 0,
//                paddingBottom: CGFloat = 0,
//                paddingRight: CGFloat = 0,
//                width: CGFloat? = nil,
//                height: CGFloat? = nil) {
//        translatesAutoresizingMaskIntoConstraints = false
//
//        if let top = top {
//            topAnchor.constraint(equalTo: top, constant: paddingTop).isActive = true
//        }
//        if let left = left {
//            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
//        }
//        if let bottom = bottom {
//            bottomAnchor.constraint(equalTo: bottom, constant: -paddingBottom).isActive = true
//        }
//        if let right = right {
//            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
//        }
//        if let width = width {
//            widthAnchor.constraint(equalToConstant: width).isActive = true
//        }
//        if let height = height {
//            heightAnchor.constraint(equalToConstant: height).isActive = true
//        }
//    }
//
//    func centerX(inView view: UIView) {
//        translatesAutoresizingMaskIntoConstraints = false
//        centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//    }
//
//    func centerY(inView view: UIView, leftAnchor: NSLayoutXAxisAnchor? = nil, paddingLeft: CGFloat = 0, constant: CGFloat = 0) {
//        translatesAutoresizingMaskIntoConstraints = false
//        centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: constant).isActive = true
//
//        if let left = leftAnchor {
//            anchor(left: left, paddingLeft: paddingLeft)
//        }
//    }
//
//    func setDimension(height: CGFloat, width: CGFloat) {
//        translatesAutoresizingMaskIntoConstraints = false
//        heightAnchor.constraint(equalToConstant: height).isActive = true
//widthAnchor.constraint(equalToConstant: width).isActive = true
//    }
//
//    func addShadow() {
//        layer.shadowColor = UIColor.black.cgColor
//        layer.shadowOpacity = 0.55
//        layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
//        layer.masksToBounds = false
//    }
//
//    func fillSuperview(padding: UIEdgeInsets = .zero) {
//           translatesAutoresizingMaskIntoConstraints = false
//        if let superviewTopAnchor = superview?.safeAreaLayoutGuide.topAnchor {
//            topAnchor.constraint(equalTo: superviewTopAnchor, constant: padding.top).isActive = true
//           }
//
//           if let superviewBottomAnchor = superview?.bottomAnchor {
//               bottomAnchor.constraint(equalTo: superviewBottomAnchor, constant: -padding.bottom).isActive = true
//           }
//
//           if let superviewLeadingAnchor = superview?.leadingAnchor {
//               leadingAnchor.constraint(equalTo: superviewLeadingAnchor, constant: padding.left).isActive = true
//           }
//
//           if let superviewTrailingAnchor = superview?.trailingAnchor {
//               trailingAnchor.constraint(equalTo: superviewTrailingAnchor, constant: -padding.right).isActive = true
//           }
//    }
//
//    @discardableResult
//    func anchor(top: NSLayoutYAxisAnchor?, leading: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, trailing: NSLayoutXAxisAnchor?, padding: UIEdgeInsets = .zero, size: CGSize = .zero) -> AnchoredConstraints {
//
//        translatesAutoresizingMaskIntoConstraints = false
//        var anchoredConstraints = AnchoredConstraints()
//
//        if let top = top {
//            anchoredConstraints.top = topAnchor.constraint(equalTo: top, constant: padding.top)
//        }
//
//        if let leading = leading {
//            anchoredConstraints.leading = leadingAnchor.constraint(equalTo: leading, constant: padding.left)
//        }
//
//        if let bottom = bottom {
//            anchoredConstraints.bottom = bottomAnchor.constraint(equalTo: bottom, constant: -padding.bottom)
//        }
//
//        if let trailing = trailing {
//            anchoredConstraints.trailing = trailingAnchor.constraint(equalTo: trailing, constant: -padding.right)
//        }
//
//        if size.width != 0 {
//            anchoredConstraints.width = widthAnchor.constraint(equalToConstant: size.width)
//        }
//
//        if size.height != 0 {
//            anchoredConstraints.height = heightAnchor.constraint(equalToConstant: size.height)
//        }
//
//        [anchoredConstraints.top, anchoredConstraints.leading, anchoredConstraints.bottom, anchoredConstraints.trailing, anchoredConstraints.width, anchoredConstraints.height].forEach{ $0?.isActive = true }
//
//        return anchoredConstraints
//    }
//}
