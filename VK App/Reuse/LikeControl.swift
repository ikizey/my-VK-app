//  Created by ikizey on 02.09.2021.



import UIKit

class LikeControl: UIControl {

    var countLikesLabel = UILabel()
    var likeButton = UIButton()
    var likeImage = UIImage()
    var unlikeImage = UIImage()
    var isLiked = false


    override init(frame: CGRect) {
        super.init(frame: frame)
        setupImages()
        placeLabel()
        setupButton()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }

    func placeLabel() {
        countLikesLabel = UILabel(frame: CGRect(x: 20.0, y: 0.0, width: 80.0, height: 20.0))
        countLikesLabel.text = "0"
        countLikesLabel.backgroundColor = .clear
        countLikesLabel.textColor = .black

        addSubview(countLikesLabel)

        NSLayoutConstraint.activate([
                                        countLikesLabel.centerYAnchor.constraint(
                                            equalTo: self.centerYAnchor),
                                        countLikesLabel.centerXAnchor.constraint(
                                            equalTo: self.leftAnchor,
                                            constant: 27.0),
                                        countLikesLabel.widthAnchor.constraint(
                                            equalTo: self.widthAnchor,
                                            multiplier: 0.5),
                                        countLikesLabel.heightAnchor.constraint(
                                            equalTo: self.heightAnchor,
                                            multiplier: 0.8) ])
    }

    func setupButton(){
        likeButton.layer.frame = CGRect(x: 0, y: 0, width: 20.0, height: 20.0)
        likeButton.setImage(
            UIImage(cgImage: unlikeImage.cgImage!),
            for: .normal)
        likeButton.setImage(
            UIImage(cgImage: likeImage.cgImage!),
            for: .selected)
        likeButton.isSelected = isLiked
        likeButton.clipsToBounds = false
        likeButton.addTarget(
            self,
            action: #selector(switchLike),
            for: .touchUpInside)

        addSubview(likeButton)

        NSLayoutConstraint.activate([
                                        likeButton.centerYAnchor.constraint(
                                            equalTo: self.topAnchor,
                                            constant: 0.0),
                                        likeButton.centerXAnchor.constraint(
                                            equalTo: self.leftAnchor,
                                            constant: 2.0),
                                        likeButton.widthAnchor.constraint(
                                            equalTo: likeButton.heightAnchor,
                                            multiplier: 1.0),
                                        likeButton.heightAnchor.constraint(
                                            equalTo: self.heightAnchor,
                                            multiplier: 1.0) ])
    }

    @objc func switchLike() {
        if likeButton.isSelected {
            countLikesLabel.text = "1"
        } else {
            countLikesLabel.text = "0"
        }
        likeButton.isSelected.toggle()
        sendActions(for: .valueChanged)
    }


    private func setupImages() {
        likeImage = heartBezier(
            fillColor: UIColor.systemBlue,
            strokeColor: UIColor.systemBlue)
        unlikeImage = heartBezier(
            fillColor: UIColor.white,
            strokeColor: UIColor.white)
    }

    private func heartBezier(fillColor: UIColor, strokeColor: UIColor) -> UIImage {
        let size = CGSize(width: 20.0, height: 20.0)
        UIGraphicsBeginImageContextWithOptions(size, false, 0.0)
        guard let context = UIGraphicsGetCurrentContext() else { return UIImage() }

        let heart = UIBezierPath()
        heart.lineWidth = 4.0
        heart.move(to: CGPoint(x: 18.0, y: 7.0))
        heart.addLine(to: CGPoint(x: 10.0, y: 16.0))
        heart.addLine(to: CGPoint(x: 2.0, y: 7.0))

        heart.addArc(
            withCenter: CGPoint(x: 6.0, y: 7.0),
            radius: 4,
            startAngle: .pi,
            endAngle: 0,
            clockwise: true)
        heart.addArc(
            withCenter: CGPoint(x: 14.0, y: 7.0),
            radius: 4,
            startAngle: .pi,
            endAngle: 0,
            clockwise: true)
        heart.close()
        strokeColor.setStroke()
        heart.stroke()
        fillColor.setFill()
        heart.fill()

        context.fillPath()

        context.addPath(heart.cgPath)

        guard let img = UIGraphicsGetImageFromCurrentImageContext()
        else { return UIImage() }
        UIGraphicsEndImageContext()
        return img
    }
}
