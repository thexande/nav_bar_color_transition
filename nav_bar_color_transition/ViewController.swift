import UIKit

public extension UIImage {
    convenience init(color: UIColor, size: CGSize = CGSize(width: 1, height: 1)) {
        let rect = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        UIGraphicsBeginImageContextWithOptions(rect.size, false, 0)
        color.setFill()
        UIRectFill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        self.init(cgImage: (image?.cgImage!)!)
    }
}

class MasterViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Master"
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Detail", style: .plain, target: self, action: #selector(pressedDetail))
        navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.red), for: .default)
    }
    
    @objc func pressedDetail() {
        navigationController?.pushViewController(DetailViewController(), animated: true)
    }
}

class DetailViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Detail"
        navigationController?.navigationBar.setBackgroundImage(UIImage(color: UIColor.green), for: .default)
    }
}
