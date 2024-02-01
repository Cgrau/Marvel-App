import UIKit
import SnapKit

open class MotionLoadingView: UIView {
  private var activityIndicatorView: UIActivityIndicatorView = {
    let view = UIActivityIndicatorView(activityIndicatorStyle: .medium)
    return view
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public init() {
    super.init(frame: .zero)
    setup()
  }
  
  private func setup() {
    backgroundColor = .white
    addSubview(activityIndicatorView)
    activityIndicatorView.snp.makeConstraints { make in
      make.center.equalTo(self)
    }
  }
  
  func startLoading() {
    activityIndicatorView.startAnimating()
  }
}
