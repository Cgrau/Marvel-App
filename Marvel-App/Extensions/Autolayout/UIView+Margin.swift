import UIKit

public extension UIView {
    /// Margin - Spacings used iinside the Autolayout Engine
    indirect enum Margin: Equatable {
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
        case negative(Margin)
        
        var value: CGFloat {
            switch self {
            case .zero:
                return Spacing.zero.value
            case .one:
                return Spacing.one.value
            case .two:
                return Spacing.two.value
            case .four:
                return Spacing.four.value
            case .eight:
                return Spacing.eight.value
            case .twelve:
                return Spacing.twelve.value
            case .sixteen:
                return Spacing.sixteen.value
            case .twenty:
                return Spacing.twenty.value
            case .twentyFour:
                return Spacing.twentyFour.value
            case .thirtyTwo:
                return Spacing.thirtyTwo.value
            case .fourty:
                return Spacing.fourty.value
            case .fourtyEight:
                return Spacing.fourtyEight.value
            case .fiftySix:
                return Spacing.fiftySix.value
            case .sixtyFour:
                return Spacing.sixtyFour.value
            case .eighty:
                return Spacing.eighty.value
            case .negative(let negativeMargin):
                return -negativeMargin.value
            }
        }
    }
}


public prefix func -(value: UIView.Margin) -> UIView.Margin {
    UIView.Margin.negative(value)
}

