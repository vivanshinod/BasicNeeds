//
//  MyCustomClass.swift


import UIKit

class MyCustomClass: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
    }
}
@IBDesignable
class CardView: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 2
    @IBInspectable var topRight: Bool = true
    @IBInspectable var topLeft: Bool = true
    @IBInspectable var bottomRight: Bool = true
    @IBInspectable var bottomLeft: Bool = true
    @IBInspectable var shadowOffsetWidth: Int = 0
    @IBInspectable var shadowOffsetHeight: Int = 3
    @IBInspectable var shadowColor: UIColor? = UIColor.lightGray
    @IBInspectable var shadowOpacity: Float = 0.5
    
    override func layoutSubviews() {
        
        var roundedCorners: UIRectCorner = []
        if(topRight){ roundedCorners.insert(.topRight)}
        if(topLeft){ roundedCorners.insert(.topLeft)}
        if(bottomRight){ roundedCorners.insert(.bottomRight)}
        if(bottomLeft){ roundedCorners.insert(.bottomLeft)}
        
        // roundCorners(corners: roundedCorners, radius: cornerRadius)
        //       layer.cornerRadius = cornerRadius
        //let shadowPath = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        let shadowPath = UIBezierPath(roundedRect:bounds,
                                      byRoundingCorners: roundedCorners,
                                      cornerRadii: CGSize(width: cornerRadius, height:  cornerRadius))
        layer.masksToBounds = false
        layer.shadowColor = shadowColor?.cgColor
        layer.shadowOffset = CGSize(width: shadowOffsetWidth, height: shadowOffsetHeight);
        layer.shadowOpacity = shadowOpacity
        layer.shadowPath = shadowPath.cgPath
        
        if (topRight && topLeft && bottomRight && bottomLeft){
            layer.cornerRadius = cornerRadius
        } else {
            roundCorners(corners: roundedCorners, radius: cornerRadius)
        }
    }
    
    func roundCorners(corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        layer.mask = mask
    }
    
}

class MyLabel: UILabel {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        
    }
    @IBInspectable var LightWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Light", size: LightWithFontSize)
        }
    }
    @IBInspectable var RegularWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Regular", size: RegularWithFontSize)
        }
    }
    @IBInspectable var MediumWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Medium", size: MediumWithFontSize)
        }
    }
    @IBInspectable var BoldWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Bold", size: BoldWithFontSize)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            text = key.localized()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    
}

class MyButton: UIButton {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        // self.textColor = UIColor.lightGray
        
    }
    
    @IBInspectable var LightWithFontSize: CGFloat = 0.0 {
        didSet {
            self.titleLabel?.font = UIFont(name: "Cairo-Light", size: LightWithFontSize)
        }
    }
    @IBInspectable var RegularWithFontSize: CGFloat = 0.0 {
        didSet {
            self.titleLabel?.font = UIFont(name: "Cairo-Regular", size: RegularWithFontSize)
        }
    }
    @IBInspectable var MediumWithFontSize: CGFloat = 0.0 {
        didSet {
            self.titleLabel?.font = UIFont(name: "Cairo-Medium", size: MediumWithFontSize)
        }
    }
    @IBInspectable var BoldWithFontSize: CGFloat = 0.0 {
        didSet {
            self.titleLabel?.font = UIFont(name: "Cairo-Bold", size: BoldWithFontSize)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            self.setTitle(key.localized(), for: .normal)
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var imageTintColor: UIColor? {
        didSet {
            let image = self.image(for: .normal)?.withRenderingMode(.alwaysTemplate)
            self.setImage(image, for: .normal)
            self.tintColor = imageTintColor
        }
    }
    
}

class MyView: UIView {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        // self.textColor = UIColor.lightGray
        
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var ShadowEffectWithCornerRadius: CGFloat = 0.0 {
        
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 2.0
            self.layer.cornerRadius = ShadowEffectWithCornerRadius
            self.layer.masksToBounds = false
        }
        
    }
    
    @IBInspectable var LowShadowEffectWithCornerRadius: CGFloat = 0.0 {
        
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowOpacity = 0.1
            self.layer.shadowRadius = 2.0
            self.layer.cornerRadius = LowShadowEffectWithCornerRadius
            self.layer.masksToBounds = false
        }
        
    }
    
    @IBInspectable var ShadowEffectOnly: Int = 0 {
        
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 1)
            self.layer.shadowOpacity = 0.3
            self.layer.shadowRadius = 2.0
            self.layer.masksToBounds = false
        }
        
    }
    
    @IBInspectable var topShadow: Int = 0 {
        
        didSet {
            self.layer.shadowColor = UIColor.black.cgColor
            self.layer.shadowOffset = CGSize(width: 1, height: 2)
            self.layer.shadowOpacity = 0.5
            self.layer.shadowRadius = 8.0
            self.layer.masksToBounds = false
        }
        
    }
    
    
}

class MyImageView: UIImageView {
    
    
    @IBInspectable var imageTintColor: UIColor? {
        didSet {
            let image = self.image?.withRenderingMode(.alwaysTemplate)
            self.image = image
            self.tintColor = imageTintColor
        }
    }
    
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
}

class MyTextView: UITextView, UITextViewDelegate {
    
    var placeHolderString : String = ""
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        // self.textColor = UIColor.lightGray
        self.delegate = self
        
    }
    
    @IBInspectable var LightWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Light", size: LightWithFontSize)
            
        }
    }
    @IBInspectable var RegularWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Regular", size: RegularWithFontSize)
        }
    }
    @IBInspectable var MediumWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Medium", size: MediumWithFontSize)
        }
    }
    @IBInspectable var BoldWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Bold", size: BoldWithFontSize)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            text = key.localized()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    
    @IBInspectable var placeholder: String? {
        didSet {
            self.text = placeholder
            placeHolderString = self.text
            self.textColor = UIColor.lightGray
        }
    }
    
    @IBInspectable var padding: CGFloat = 0.0 {
        didSet {
            self.setPaddingPoints(padding)
        }
    }
    
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.textColor == UIColor.lightGray {
            textView.text = nil
            textView.textColor = UIColor.black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = placeHolderString
            textView.textColor = UIColor.lightGray
        }
    }
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        if text == "\n" {
            textView.resignFirstResponder()
            return false
        }
        return true
    }
    
}

class MyTextField: UITextField, UITextFieldDelegate {
    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)!
        self.layer.masksToBounds = true
        // self.textColor = UIColor.lightGaray
        self.delegate = self
        
    }
    @IBInspectable var LightWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Light", size: LightWithFontSize)
            
        }
    }
    @IBInspectable var RegularWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Regular", size: RegularWithFontSize)
        }
    }
    @IBInspectable var MediumWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Medium", size: MediumWithFontSize)
        }
    }
    @IBInspectable var BoldWithFontSize: CGFloat = 0.0 {
        didSet {
            self.font = UIFont(name: "Cairo-Bold", size: BoldWithFontSize)
        }
    }
    @IBInspectable var cornerRadius: CGFloat = 0.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var localisedKey: String? {
        didSet {
            guard let key = localisedKey else { return }
            text = key.localized()
        }
    }
    
    @IBInspectable var borderColor: UIColor? {
        didSet {
            self.layer.borderColor = borderColor?.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 0.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    
    
    @IBInspectable var leftPadding: CGFloat = 0.0 {
        didSet {
            self.setLeftPaddingPoints(leftPadding)
        }
    }
    
    @IBInspectable var rightPadding: CGFloat = 0.0 {
        didSet {
            self.setRightPaddingPoints(rightPadding)
        }
    }
    
}
class MySlider: UISlider {
    private var thumbTextLabel: UILabel = UILabel()
    private var btnHStack: UIButton = UIButton()
    
    private var thumbFrame: CGRect {
        return thumbRect(forBounds: bounds, trackRect: trackRect(forBounds: bounds), value: value)
    }
    
    private lazy var thumbView: UIView = {
        let thumb = UIView()
        return thumb
    }()
    
    override func layoutSubviews() {
        super.layoutSubviews()
        btnHStack.frame = CGRect(x: thumbFrame.origin.x, y: thumbFrame.origin.y, width: thumbFrame.size.width, height: thumbFrame.size.height)
        
    }
    
    
    
    
//    private func setValue() {
//        thumbTextLabel.text = self.value.description
//    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        addSubview(btnHStack)

        
        btnHStack.backgroundColor = UIColor(named: "AppColorDark")
        btnHStack.setImage(UIImage(named: "distancePref"), for: .normal)
        btnHStack.imageEdgeInsets = UIEdgeInsets(top: 5, left: 5, bottom: 5, right: 5)
        btnHStack.layer.zPosition = layer.zPosition + 1
        
        let thumb = thumbImage()
        setThumbImage(thumb, for: .normal)
    }
    
    private func thumbImage() -> UIImage {
        let width = 100
        thumbView.frame = CGRect(x: 0, y: 15, width: width, height: 30)
        thumbView.layer.cornerRadius = 15
        
        let renderer = UIGraphicsImageRenderer(bounds: thumbView.bounds)
        return renderer.image { rendererContext in
            rendererContext.cgContext.setShadow(offset: .zero, blur: 5, color: UIColor.black.cgColor)
            thumbView.backgroundColor = UIColor(named: "AppColorDark")
            thumbView.layer.render(in: rendererContext.cgContext)
        }
    }
    
    override func trackRect(forBounds bounds: CGRect) -> CGRect {
        return CGRect(origin: bounds.origin, size: CGSize(width: bounds.width, height: 5))
    }
}
