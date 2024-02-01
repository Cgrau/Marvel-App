import UIKit

public extension UIView {
    enum Spacing {
        case zero
        case one
        case two
        case four
        case eight
        case twelve
        case sixteen
        case twenty
        case twentyFour
        case thirtyTwo
        case fourty
        case fourtyEight
        case fiftySix
        case sixtyFour
        case eighty
        
        public var value: CGFloat {
            switch self {
            case .zero:
                return 0
            case .one:
                return 1
            case .two:
                return 2
            case .four:
                return 4
            case .eight:
                return 8
            case .twelve:
                return 12
            case .sixteen:
                return 16
            case .twenty:
                return 20
            case .twentyFour:
                return 24
            case .thirtyTwo:
                return 32
            case .fourty:
                return 40
            case .fourtyEight:
                return 48
            case .fiftySix:
                return 56
            case .sixtyFour:
                return 64
            case .eighty:
                return 80
            }
        }
    }
}
