//
//  GenericCollectionViewCell.swift
//  GenericCell
//
//  Created by yosshi4486 on 2020/05/16
//  
//

#if canImport(UIKit)
import UIKit

/// A GenericCollectionViewCell object is a generic type of UICollectionViewCell that previews a custom view you give.
///
/// Use like a bellows:
///     collectionView.register<GenericCollectionViewCell<YourCustomView>.self, forCellReuseIdentifier: "Cell")
///     let cell = collectionView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! GenericCollectionViewCell<YourCustomView>
@dynamicMemberLookup public class GenericCollectionViewCell<View : UIView>: UICollectionViewCell {
    
    /// The custom view that the type is given from generic-type.
    public let customView: View = .init(frame: .zero)
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        
        commonInit()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        
        commonInit()
    }
    
    /// Provides flatten access to customView.
    public subscript<U>(dynamicMember keyPath: ReferenceWritableKeyPath<View, U>) -> U {
        get {
            customView[keyPath:keyPath]
        }
        
        set {
            customView[keyPath:keyPath] = newValue
        }
    }
    
    private func commonInit() {
        contentView.addSubview(customView)
        
        customView.translatesAutoresizingMaskIntoConstraints = false
        customView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        customView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        customView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        customView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }

}

#endif
