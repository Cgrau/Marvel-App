import UIKit

public extension UIView {
    func addConstraintEdges(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let horizontalConstraints = addConstraintEdgesHorizontally(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let verticalConstraints = addConstraintEdgesVertically(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return horizontalConstraints + verticalConstraints
    }
    
    func addConstraintEdgesHorizontally(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let leading = addConstraintLeading(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let trailing = addConstraintTrailing(to: view, useSafeArea: useSafeArea, constant: -constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return leading + trailing
    }
    
    func addConstraintEdgesHorizontally(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, height: CGFloat, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let horizontal = addConstraintEdgesHorizontally(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let height = addConstraintHeight(height, file: file, method: method, line: line)
        return horizontal + height
    }
    
    func addConstraintEdgesVertically(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let top = addConstraintTop(to: view, useSafeArea: useSafeArea, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let bottom = addConstraintBottom(to: view, useSafeArea: useSafeArea, constant: -constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return top + bottom
    }
    
    func addConstraintEdgesVertically(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, priority: UILayoutPriority = .required, width: CGFloat, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let vertical = addConstraintEdgesVertically(to: view, useSafeArea: useSafeArea, constant: constant, priority: priority, file: file, method: method, line: line)
        let width = addConstraintWidth(width, file: file, method: method, line: line)
        return vertical + width
    }
    
    func addConstraintLeading(toTrailing view: UIView, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return addConstraintLeading(toAnchor: view.trailingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTop(toBottom view: UIView, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return addConstraintTop(toAnchor: view.bottomAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintLeading(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let leadingAnchor: NSLayoutXAxisAnchor
        if useSafeArea {
            leadingAnchor = constraintsView.safeAreaLayoutGuide.leadingAnchor
        } else {
            leadingAnchor = constraintsView.leadingAnchor
        }
        return addConstraintLeading(toAnchor: leadingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintLeading(toAnchor: NSLayoutXAxisAnchor, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        return addConstraintXAxisAnchor(leadingAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTrailing(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let trailingAnchor: NSLayoutXAxisAnchor
        if useSafeArea {
            trailingAnchor = constraintsView.safeAreaLayoutGuide.trailingAnchor
        } else {
            trailingAnchor = constraintsView.trailingAnchor
        }
        return addConstraintTrailing(toAnchor: trailingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTrailing(toAnchor: NSLayoutXAxisAnchor, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintXAxisAnchor(trailingAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTrailing(toLeading view: UIView, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintTrailing(toAnchor: view.leadingAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTop(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let topAnchor: NSLayoutYAxisAnchor
        if useSafeArea {
            topAnchor = constraintsView.safeAreaLayoutGuide.topAnchor
        } else {
            topAnchor = constraintsView.topAnchor
        }
        return addConstraintTop(toAnchor: topAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintTop(toAnchor: NSLayoutYAxisAnchor, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintYAxisAnchor(topAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintBottom(to view: UIView? = nil, useSafeArea: Bool = false, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        let bottomAnchor: NSLayoutYAxisAnchor
        if useSafeArea {
            bottomAnchor = constraintsView.safeAreaLayoutGuide.bottomAnchor
        } else {
            bottomAnchor = constraintsView.bottomAnchor
        }
        return addConstraintBottom(toAnchor: bottomAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintBottom(toAnchor: NSLayoutYAxisAnchor, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintYAxisAnchor(bottomAnchor, toAnchor: toAnchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintCenter(to view: UIView? = nil, multiplier: CGPoint = CGPoint(x: 1, y: 1), constant: (x: UIView.Margin, y: UIView.Margin) = (.zero, .zero), relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let x = addConstraintCenterX(to: view, multiplier: multiplier.x, constant: constant.x, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        let y = addConstraintCenterY(to: view, multiplier: multiplier.y, constant: constant.y, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return x + y
    }
    
    func addConstraintCenterX(to view: UIView? = nil, multiplier: CGFloat = 1, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        return addConstraintAttribute(.centerX,
                                      relatedBy: relation,
                                      to: constraintsView,
                                      attribute: .centerX,
                                      multiplier: multiplier,
                                      constant: constant,
                                      priority: priority,
                                      file: file,
                                      method: method,
                                      line: line)
    }
    
    func addConstraintCenterY(to view: UIView? = nil, multiplier: CGFloat = 1, constant: UIView.Margin = .zero, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let constraintsView = view ?? superview!
        return addConstraintAttribute(.centerY,
                                      relatedBy: relation,
                                      to: constraintsView,
                                      attribute: .centerY,
                                      multiplier: multiplier,
                                      constant: constant,
                                      priority: priority,
                                      file: file,
                                      method: method,
                                      line: line)
    }
    
    func addConstraintSize(_ size: CGSize, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let width: [NSLayoutConstraint]
        let height: [NSLayoutConstraint]
        width = addConstraintWidth(size.width, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        height = addConstraintHeight(size.height, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        return width + height
    }
    
    func addConstraintSize(to view: UIView? = nil, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let width: [NSLayoutConstraint]
        let height: [NSLayoutConstraint]
        if let view = view {
            width = addConstraintWidth(toAnchor: view.widthAnchor, relatedBy: relation, priority: priority, file: file, method: method, line: line)
            height = addConstraintHeight(toAnchor: view.heightAnchor, relatedBy: relation, priority: priority, file: file, method: method, line: line)
        } else {
            width = addConstraintWidth(relatedBy: relation, priority: priority, file: file, method: method, line: line)
            height = addConstraintHeight(relatedBy: relation, priority: priority, file: file, method: method, line: line)
        }
        return width + height
    }
    
    func addConstraintWidth(_ width: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintDimensionAnchor(widthAnchor, constant: width, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintWidth(toAnchor: NSLayoutDimension? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let anchor = toAnchor ?? superview!.widthAnchor
        return addConstraintDimensionAnchor(widthAnchor, toAnchor: anchor, multiplier: multiplier, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintHeight(_ height: CGFloat, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        addConstraintDimensionAnchor(heightAnchor, constant: height, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintHeight(toAnchor: NSLayoutDimension? = nil, multiplier: CGFloat = 1, constant: CGFloat = 0, relatedBy relation: NSLayoutConstraint.Relation = .equal, priority: UILayoutPriority = .required, file: String = #file, method: String = #function, line: Int = #line) -> [NSLayoutConstraint] {
        let anchor = toAnchor ?? superview!.heightAnchor
        return addConstraintDimensionAnchor(heightAnchor, toAnchor: anchor, multiplier: multiplier, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    func addConstraintAttribute(_ receiverAttribute: NSLayoutConstraint.Attribute,
                                relatedBy relation: NSLayoutConstraint.Relation = .equal,
                                to view: UIView,
                                attribute toAttribute: NSLayoutConstraint.Attribute,
                                multiplier: CGFloat = 1,
                                constant: UIView.Margin = .zero,
                                priority: UILayoutPriority = .required,
                                file: String = #file,
                                method: String = #function,
                                line: Int = #line) -> [NSLayoutConstraint] {
        let constraint = NSLayoutConstraint(item: self,
                                            attribute: receiverAttribute,
                                            relatedBy: relation,
                                            toItem: view,
                                            attribute: toAttribute,
                                            multiplier: multiplier,
                                            constant: constant.value)
        constraint.priority = priority
        return [constraint]
    }
    
    func distributeHorizontallyViewsInSuperview(_ views: [UIView], file: String = #file, method: String = #function, line: Int = #line) {
        guard let firstView = views.first else { return }
        guard let lastView = views.last else { return }
        
        var constraints: [[NSLayoutConstraint]] = [
            firstView.addConstraintLeading(file: file, method: method, line: line),
            lastView.addConstraintTrailing(file: file, method: method, line: line)
        ]
        for i in 1..<views.count {
            let view = views[i]
            let previousView = views[i - 1]
            constraints.append(view.addConstraintLeading(toTrailing: previousView, file: file, method: method, line: line))
        }
        NSLayoutConstraint.activateNested(constraints)
    }
    
    @discardableResult
    func addConstraints(replace old: [NSLayoutConstraint], with new: [NSLayoutConstraint]) -> [NSLayoutConstraint] {
        NSLayoutConstraint.deactivate(old)
        removeConstraints(old)
        NSLayoutConstraint.activateNested([
            new
        ])
        return new
    }
    
    // MARK: Private
    
    private func addConstraintYAxisAnchor(_ anchor: NSLayoutXAxisAnchor, constant: UIView.Margin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        addConstraintXAxisAnchor(anchor, toAnchor: anchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    private func addConstraintXAxisAnchor(_ anchor: NSLayoutXAxisAnchor, toAnchor: NSLayoutXAxisAnchor, constant: UIView.Margin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, constant: constant.value)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant.value)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant.value)
        @unknown default:
            fatalError()
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }
    
    private func addConstraintYAxisAnchor(_ anchor: NSLayoutYAxisAnchor, constant: UIView.Margin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        addConstraintYAxisAnchor(anchor, toAnchor: anchor, constant: constant, relatedBy: relation, priority: priority, file: file, method: method, line: line)
    }
    
    private func addConstraintYAxisAnchor(_ anchor: NSLayoutYAxisAnchor, toAnchor: NSLayoutYAxisAnchor, constant: UIView.Margin, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, constant: constant.value)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, constant: constant.value)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, constant: constant.value)
        @unknown default:
            fatalError()
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }
    
    private func addConstraintDimensionAnchor(_ anchor: NSLayoutDimension, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalToConstant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualToConstant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualToConstant: constant)
        @unknown default:
            fatalError()
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }
    
    private func addConstraintDimensionAnchor(_ anchor: NSLayoutDimension, toAnchor: NSLayoutDimension, multiplier: CGFloat, constant: CGFloat, relatedBy relation: NSLayoutConstraint.Relation, priority: UILayoutPriority, file: String, method: String, line: Int) -> [NSLayoutConstraint] {
        let constraint: NSLayoutConstraint
        switch relation {
        case .equal:
            constraint = anchor.constraint(equalTo: toAnchor, multiplier: multiplier, constant: constant)
        case .greaterThanOrEqual:
            constraint = anchor.constraint(greaterThanOrEqualTo: toAnchor, multiplier: multiplier, constant: constant)
        case .lessThanOrEqual:
            constraint = anchor.constraint(lessThanOrEqualTo: toAnchor, multiplier: multiplier, constant: constant)
        @unknown default:
            fatalError()
        }
        constraint.identifier = "\(file):\(method):\(line)"
        constraint.priority = priority
        return [constraint]
    }
}

// MARK: - Activation

public extension Array where Element: NSLayoutConstraint {
    var isActive: Bool {
        get {
#if DEBUG
            let filterCount = filter { $0.isActive == false }.count
            if filterCount != 0, filterCount != count {
                assertionFailure("WATCH OUT: you should know what you're doing, this array contains active and/or/y not active NSLayoutConstraints")
            }
#endif
            return find { $0.isActive == false } == nil
        }
        set {
            if newValue {
                NSLayoutConstraint.activate(self)
            } else {
                NSLayoutConstraint.deactivate(self)
            }
        }
    }
}

public extension Array where Element == [NSLayoutConstraint] {
    func activateConstraints() {
        NSLayoutConstraint.activateNested(self)
    }
    
    func deactivateConstraints() {
        NSLayoutConstraint.deactivateNested(self)
    }
}

public extension NSLayoutConstraint {
    static func activateNested(_ constraints: [[NSLayoutConstraint]]) {
        constraints.joined().forEach { constraint in
            (constraint.firstItem as? UIView)?.translatesAutoresizingMaskIntoConstraints = false
        }
        NSLayoutConstraint.activate(constraints.flatMap { $0 })
    }
    
    
    static func deactivateNested(_ constraints: [[NSLayoutConstraint]]) {
        NSLayoutConstraint.deactivate(constraints.flatMap { $0 })
    }
}

public extension UIEdgeInsets {
    init(layoutMarginsHorizontal: UIView.Margin) {
        self = UIEdgeInsets(top: 0,
                            left: layoutMarginsHorizontal.value,
                            bottom: 0,
                            right: -layoutMarginsHorizontal.value)
    }
    
    
    init(layoutMarginsVertical: UIView.Margin) {
        self = UIEdgeInsets(top: layoutMarginsVertical.value,
                            left: 0,
                            bottom: -layoutMarginsVertical.value,
                            right: 0)
    }
    
    
    init(topMargin: UIView.Margin,
         leftMargin: UIView.Margin,
         bottomMargin: UIView.Margin,
         rightMargin: UIView.Margin) {
        self = UIEdgeInsets(top: topMargin.value,
                            left: leftMargin.value,
                            bottom: bottomMargin.value,
                            right: rightMargin.value)
    }
}

public extension Sequence {
    func find(_ predicate: (Self.Iterator.Element) throws -> Bool) rethrows -> Self.Iterator.Element? {
        for element in self {
            if try predicate(element) {
                return element
            }
        }
        return nil
    }
}
