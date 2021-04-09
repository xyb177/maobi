//
//  ViewController.swift
//
//  Copyright (c) Alexis Creuzot (http://alexiscreuzot.com)
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit
import WebKit
import SnapKit
import SnapKitExtend
import ButtonProgressBar_iOS


@available(iOS 13.0, *)
class ViewController: UIViewController{
    
    typealias FilteringCompletion = ((UIImage?, Error?) -> ())
    

     private var  imageView = UIImageView()
     private var loader = UIActivityIndicatorView()
     private var buttonHolderView = UIView()
     private var  applyButton = UIButton()
     private var loaderWidthConstraint = NSLayoutConstraint()
     private var scroll = UIScrollView()
     private var content = UIView()
     private var images = [UIImageView]()
    private var progressButton = ButtonProgressBar()
    private var timePeriod = UITextField()
    private var timePadding =  UITextField()
    
   
    
    
    var selectedNSTModel: NSTDemoModel = .starryNight
    var imagePicker = UIImagePickerController()
    var selectedImage = UIImage(named: "paris")
    
    var isProcessing : Bool = false {
        didSet {
            self.applyButton.isEnabled = !isProcessing
            self.isProcessing ? self.loader.startAnimating() : self.loader.stopAnimating()
            self.loaderWidthConstraint.constant = self.isProcessing ? 20.0 : 0.0
            UIView.animate(withDuration: 0.3) {
                self.isProcessing
                    ? self.applyButton.setTitle("Processing...", for: .normal)
                    : self.applyButton.setTitle("Apply Style", for: .normal)
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //MARK:- Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.isProcessing = false
        
        for _ in 0...12 {
            images.append(UIImageView())
        }
        view.backgroundColor = UIColor.black
        view.addSubview(scroll)
        scroll.snp.makeConstraints{(make) in
            make.edges.equalTo(view)
        }
        
        scroll.addSubview(content)
        content.snp.makeConstraints{(make)in
            make.top.bottom.equalTo(scroll)
            make.left.right.equalTo(view)
        }
        
        
    
        
        //被分解的字的图片
        content.addSubview(imageView)
        imageView.image = UIImage(named:"paris")
        imageView.snp.makeConstraints{(make)in
            make.size.equalTo(200)
            make.top.equalTo(content).offset(100)
            make.centerX.equalToSuperview()
        }
        //
        content.addSubview(buttonHolderView)
        buttonHolderView.snp.makeConstraints{(make) in
            make.width.equalTo(200)
            make.height.equalTo(50)
            make.top.equalTo(imageView.snp.bottom).offset(100)
            make.centerX.equalToSuperview()
            
        }
        //按钮
        buttonHolderView.addSubview(applyButton)
        applyButton.backgroundColor = UIColor.blue
        applyButton.snp.makeConstraints{(make) in
            make.width.equalTo(120)
            make.center.equalToSuperview()
        }
        
        //
        buttonHolderView.addSubview(loader)
        loader.snp.makeConstraints{(make)in
            make.left.equalTo(applyButton.snp.right)
            make.centerY.equalToSuperview()
        }
        //进度条
        progressButton.addTarget(nil, action:#selector(self.tapped), for:.touchUpInside)
        progressButton.setTitle("Apply", for: .normal)
        progressButton.setCompletionImage(image: UIImage(named: "nav_search")!)
        
        progressButton.center = self.view.center
        content.addSubview(progressButton)
        
        progressButton.snp.makeConstraints{(make)in
            make.top.equalTo(buttonHolderView.snp.bottom).offset(30)
            make.width.equalTo(120)
            make.height.equalTo(40)
            make.centerX.equalToSuperview()
        }
        
        
        //图片数组的位置
        Snp(image: images)
        //按钮点击事件
        //applyButton.addTarget(self, action:#selector(self.applyNST), for:.touchUpInside)
        //导航条
        guard let navi = navigationController else { return }
        if navi.visibleViewController == self {
            navi.barStyle(.theme)}
        
    }
        
    @objc func tapped(){
       
        self.progressButton.startIndeterminate(withTimePeriod: 10, andTimePadding: 0.5)
        
        print(1)
        
    }
        
    func Snp (image: [UIImageView])
    {     let length = image.count-1
        for index in 0...length {
            self.content.addSubview(image[index])
            image[index].image=UIImage(named:"paris")
            image[index].snp.makeConstraints{(make)in
                make.size.equalTo(100)
                
                if (index%2 == 0) {make.left.equalTo(80)}
                else {make.left.equalTo(image[index-1].snp.right).offset(50)}
                
                if (index == 0 || index == 1)
                {
                    make.top.equalTo(progressButton.snp.bottom).offset(100)
                }
                else
                {
                    make.top.equalTo(image[index-2].snp.bottom).offset(100)
                }
                if (index==length || (length%2==1 && index==length-1))
                {make.bottom.equalToSuperview()}
                
                
            }
        }
    }

    
    //MARK: - Utils
    func showError(_ error: Error) {
        
        self.buttonHolderView.backgroundColor = UIColor(red: 220/255, green: 50/255, blue: 50/255, alpha: 1)
        self.applyButton.setTitle(error.localizedDescription, for: .normal)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) { // Change `2.0` to the desired number of seconds.
            self.applyButton.setTitle("Apply Style", for: .normal)
            self.buttonHolderView.backgroundColor = UIColor(red: 5/255, green: 122/255, blue: 255/255, alpha: 1)
        }
    }
    
    //MARK:- CoreML
    
    func process(input: UIImage, completion: @escaping FilteringCompletion) {
        
        let startTime = CFAbsoluteTimeGetCurrent()
        var outputImage: UIImage?
        var nstError: Error?
        
        // Next step is pretty heavy, better process it
        // asynchronously to prevent UI freeze
        DispatchQueue.global().sync
            {
            
            // Load model and launch prediction
            do {
                let modelProvider = try self.selectedNSTModel.modelProvider()
                outputImage = try modelProvider.prediction(inputImage: input)
                print(outputImage as Any)
                //Global_output.append{outputImage}
            } catch let error {
                nstError = error
            }
            
            // Hand result to main thread
            DispatchQueue.global().sync {
                if let outputImage = outputImage {
                    completion(outputImage, nil)
                    print("out:--")
                    print(outputImage)
                } else if let nstError = nstError{
                    completion(nil, nstError)
                } else {
                    completion(nil, NSTError.unknown)
                }
                
                let timeElapsed = CFAbsoluteTimeGetCurrent() - startTime
                print("Time elapsed for NST process: \(timeElapsed) s.")
            }
               
        }
    }
    
    //MARK:- Actions
    
   
    
     func importFromLibrary() {
        if UIImagePickerController.isSourceTypeAvailable(.photoLibrary) {
            self.imagePicker.delegate = self
            self.imagePicker.sourceType = .photoLibrary
            self.imagePicker.allowsEditing = false
            self.present(self.imagePicker, animated: true)
        } else {
            print("Photo Library not available")
        }
    }
    
    @objc func applyNST() {
       
        self.progressButton.startIndeterminate(withTimePeriod:1 , andTimePadding: 0.5)
        /*imageView.image = self.selectedImage
        
        guard let image = self.imageView.image else {
            print("Select an image first")
            return
        }

        self.isProcessing = true
        for  index in 0...5{
        print(index)
        
            self.selectedNSTModel = NSTDemoModel.allCases[index]
             
            self.process(input: image) { filteredImage, error in
                    
                if let filteredImage = filteredImage {
                    self.images[index].image = filteredImage
            
                
                } else if let error = error {
                    self.showError(error)
                } else {
                    self.showError(NSTError.unknown)
                }
                
            }
        }
        self.isProcessing = false

        progressButton.triggerCompletion()*/
        /*for index in 6...12{
        print(index)
        
            self.selectedNSTModel = NSTDemoModel.allCases[index]
            self.process(input: image) { filteredImage, error in
        
                if let filteredImage = filteredImage {
                    
                    self.images[index].image = filteredImage
            
                } else if let error = error {
                    self.showError(error)
                } else {
                    self.showError(NSTError.unknown)
                }
            
            
        }
            
        
        }*/
            
            
    
    }
}

// MARK: - UIImagePickerControllerDelegate

@available(iOS 13.0, *)
extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.selectedImage = pickedImage
            self.imageView.image = pickedImage
            self.imageView.backgroundColor = .clear
            
        }
        self.dismiss(animated: true)
    }
}

extension UIImage {
    //返回一个将白色背景变透明的UIImage
    func imageByRemoveWhiteBg() -> UIImage? {
        let colorMasking: [CGFloat] = [222, 255, 222, 255, 222, 255]
        return transparentColor(colorMasking: colorMasking)
    }
     
    //返回一个将黑色背景变透明的UIImage
    func imageByRemoveBlackBg() -> UIImage? {
        let colorMasking: [CGFloat] = [0, 32, 0, 32, 0, 32]
        return transparentColor(colorMasking: colorMasking)
    }
     
    func transparentColor(colorMasking:[CGFloat]) -> UIImage? {
        if let rawImageRef = self.cgImage {
            UIGraphicsBeginImageContext(self.size)
            if let maskedImageRef = rawImageRef.copy(maskingColorComponents: colorMasking) {
                let context: CGContext = UIGraphicsGetCurrentContext()!
                context.translateBy(x: 0.0, y: self.size.height)
                context.scaleBy(x: 1.0, y: -1.0)
                context.draw(maskedImageRef, in: CGRect(x:0, y:0, width:self.size.width,
                                                        height:self.size.height))
                let result = UIGraphicsGetImageFromCurrentImageContext()
                UIGraphicsEndImageContext()
                return result
            }
        }
        return nil
    }
}

