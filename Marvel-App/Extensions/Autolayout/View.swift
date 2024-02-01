import UIKit

public enum ViewLoadingState {
  case idle
  case loading
  case loaded
}

open class View: UIView {
  
  private lazy var loadingView: MotionLoadingView = {
    return MotionLoadingView()
  }()
  
  public override init(frame: CGRect) {
    super.init(frame: frame)
    setup()
  }
  
  private var selectedScrollView: UIScrollView?
  
  @available(*, unavailable)
  required public init?(coder aDecoder: NSCoder) {
    super.init(coder: aDecoder)
    setup()
  }
  
  public var loadingState: ViewLoadingState = .idle {
    didSet {
      switch loadingState {
      case .loading:
        startLoading()
      default:
        endLoading()
      }
    }
  }
  
  public init() {
    super.init(frame: .zero)
    setup()
  }
  
  private func setup() {
    backgroundColor = .white
    setupView()
    setupConstraints()
    bindViewModel()
  }
  
  open func setupView() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
  
  open func setupConstraints() {
    fatalError("`View` subclasses should implement \(#function) ⚠️")
  }
  
  open func bindViewModel() {}
}

extension View {
  private func startLoading() {
    addSubview(loadingView)
    loadingView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
    loadingView.startLoading()
  }
  
  private func endLoading() {
    loadingView.removeFromSuperview()
  }
}

extension View {
  public func setupKeyboardBehaviour(to scrollView: UIScrollView) {
    selectedScrollView = scrollView
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(View.keyboardWillShow),
                                           name: NSNotification.Name.UIKeyboardWillShow, object: nil)
    NotificationCenter.default.addObserver(self,
                                           selector: #selector(View.keyboardWillHide),
                                           name: NSNotification.Name.UIKeyboardWillHide, object: nil)
  }
  
  @objc func keyboardWillShow(_ notification:Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard let keyboardKey = userInfo[UIKeyboardFrameBeginUserInfoKey] as? NSValue else { return }
    let keyboardSize = keyboardKey.cgRectValue
    selectedScrollView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: keyboardSize.height, right: 0)
  }
  
  @objc func keyboardWillHide(_ notification:Notification) {
    guard let userInfo = notification.userInfo else { return }
    guard userInfo[UIKeyboardFrameBeginUserInfoKey] != nil else { return }
    selectedScrollView?.contentInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
  }
}
