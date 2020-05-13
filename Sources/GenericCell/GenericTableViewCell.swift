//
//  GenericTableViewCell.swift
//  GenericCell
//
//  Created by yosshi4486 on 2020/05/11
//  
//

#if canImport(UIKit)
import UIKit

/// A GenericTableViewCell object is a generic type of UITableViewCell that previews a custom view you give.
///
/// Use like a bellows:
///     tableView.register<GenericTableViewCell<YourCustomView>.self, forCellReuseIdentifier: "Cell")
///     let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GenericTableViewCell<YourCustomView>
@dynamicMemberLookup public class GenericTableViewCell<View : UIView>: UITableViewCell {
    
    /// The custom view that the type is given from generic-type.
    public let customView: View = .init(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    subscript<U>(dynamicMember keyPath: ReferenceWritableKeyPath<View, U>) -> U {
        get {
            customView[keyPath:keyPath]
        }
        
        set {
            customView[keyPath:keyPath] = newValue
        }
    }
    
    private func commonInit() {
        addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        customView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        customView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }

}

#endif


