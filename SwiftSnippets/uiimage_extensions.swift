import UIKit

extension UIImage {
    
    func resizeOnWidth(to width: CGFloat) -> UIImage {
        let scale = width / size.width
        let newHeight = size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: width, height: newHeight))
        draw(in: CGRect(x: 0, y: 0, width: width, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return newImage!
    }
    
    func resizeImage(targetSize: CGSize) -> UIImage? {
        
        // This is the rect that we've calculated out and this is what is actually used below
        let rect = CGRect(x: 0, y: 0, width: targetSize.width, height: targetSize.height)
        
        // Actually do the resizing to the rect using the ImageContext stuff
        UIGraphicsBeginImageContextWithOptions(targetSize, false, 1.0)
        draw(in: rect)
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    class func imageWithLayer(layer: CALayer) -> UIImage  {
        UIGraphicsBeginImageContextWithOptions(layer.bounds.size, layer.isOpaque, 0)
        let context = UIGraphicsGetCurrentContext() !! "func imageWithLayer in UIImage.swift: UIGraphicsGetCurrentContext() returned nil"
        layer.render(in: context)
        let image = UIGraphicsGetImageFromCurrentImageContext() !! "func imageWithLayer in UIImage.swift: UIGraphicsGetImageFromCurrentImageContext() returned nil"
        UIGraphicsEndImageContext()
        return image
    }
}
