//
//  MLModelProvider.swift
//  NSTDemo
//
//  Created by Alexis Creuzot on 21/05/2019.
//  Copyright © 2019 monoqle. All rights reserved.
//

import UIKit
import CoreML

@available(iOS 13.0, *)
enum NSTDemoModel : String, CaseIterable {
    
    case starryNight = "stroke_1_0830"
    case pointillism = "stroke_2"
    case stroke3 = "stroke_3"
    case stroke4 = "stroke4"
    case stroke5 = "stroke5"
    case stroke6 = "stroke6"
    case stroke7 = "stroke7"
    case stroke8 = "stroke8"
    case stroke9 = "stroke9"
    case stroke10 = "stroke10"
    case stroke11 = "stroke11"
    case stroke12 = "stroke12"
    case stroke13 = "stroke13"
    
    func modelProvider() throws -> MLModelProvider {
        guard let url = Bundle.main.url(forResource: self.rawValue, withExtension:"mlmodelc") else {
            throw NSTError.assetPathError
        }
        
        switch self {
        case .starryNight:
            return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .pointillism:
            return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke3:
            return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke4:
            return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke5:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke6:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke7:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke8:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke9:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke10:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke11:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke12:
           return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        case .stroke13:
        return try MLModelProvider(contentsOf: url,
                                       pixelBufferSize: CGSize(width:256, height:256),
                                       inputName: "inputImage",
                                       outputName: "outputImage")
        }
    }
}

/// Encapsulation class for our NST models
@available(macOS 10.13, iOS 13.0, tvOS 11.0, watchOS 4.0, *)
class MLModelProvider {
    var model: MLModel
    
    // The variable parameters for our NST models
    var inputName: String
    var outputName: String
    var pixelBufferSize: CGSize
   
    init(contentsOf url: URL,
         pixelBufferSize: CGSize,
         inputName: String,
         outputName: String) throws {
        self.model = try MLModel(contentsOf: url)
        self.pixelBufferSize = pixelBufferSize
        self.inputName = inputName
        self.outputName = outputName
    }
    
    // Provide a more abstracted prediction method
    // Allowing for an UIImage input of any size
    // and returning the result as an UIImage of same size
    func prediction(inputImage: UIImage) throws -> UIImage {

        // 1 - Resize image to our model expected size
        guard let resizedImage = inputImage.resize(to: self.pixelBufferSize) else {
            throw NSTError.resizeError
        }
        
        // 2 - Transform our UIImage to a PixelBuffer
        guard let cvBufferInput = resizedImage.pixelBuffer() else {
            throw NSTError.pixelBufferError
        }
        
        // 3 -  Feed that PixelBuffer to the model (this is where the actual magic happens)
        let MLInput = MLModelProviderInput(inputImage: cvBufferInput,
                                           inputName: inputName)
        let output = try self.prediction(input: MLInput)
        
        // 4 - Transform PixelBuffer output to UIImage
        guard let outputImage = UIImage(pixelBuffer: output.outputImage) else {
            throw NSTError.pixelBufferError
        }

        
        // 5 - Resize result back to the original input size
        guard let finalImage = outputImage.resize(to: inputImage.size) else {
            throw NSTError.resizeError
        }
        
        return finalImage
    }
    
    // Prediction using our custom MLModelProviderInput and MLModelProviderOutput
    func prediction(input: MLModelProviderInput) throws -> MLModelProviderOutput {
        let outFeatures = try model.prediction(from: input)
        let result = MLModelProviderOutput(outputImage: outFeatures.featureValue(for: outputName)!.imageBufferValue!, outputName: outputName)
        return result
    }
}

/// Model Prediction Input Type
@available(macOS 10.13, iOS 13.0, tvOS 11.0, watchOS 4.0, *)
class MLModelProviderInput : MLFeatureProvider {
    
    var inputImage: CVPixelBuffer
    var inputName: String
    var featureNames: Set<String> {
        get { return [inputName] }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == inputName) {
            return MLFeatureValue(pixelBuffer: inputImage)
        }
        return nil
    }
    
    init(inputImage: CVPixelBuffer, inputName: String) {
        self.inputName = inputName
        self.inputImage = inputImage
    }
}

@available(macOS 10.13, iOS 13.0, tvOS 11.0, watchOS 4.0, *)
class MLModelProviderOutput : MLFeatureProvider {
    
    let outputImage: CVPixelBuffer
    var outputName: String
    var featureNames: Set<String> {
        get { return [outputName] }
    }
    
    func featureValue(for featureName: String) -> MLFeatureValue? {
        if (featureName == outputName) {
            return MLFeatureValue(pixelBuffer: outputImage)
        }
        return nil
    }
    
    init(outputImage: CVPixelBuffer, outputName: String) {
        self.outputName = outputName
        self.outputImage = outputImage
    }
}


