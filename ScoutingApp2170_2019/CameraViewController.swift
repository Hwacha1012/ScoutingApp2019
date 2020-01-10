//
//  CameraViewController.swift
//  ScoutingApp2170_2019
//
//  Created by Leonard Liu on 2/5/19.
//  Copyright © 2019 Leonard Liu. All rights reserved.
//

import UIKit
import AVFoundation
import Foundation
var photoCount = 0

class CameraViewController: UIViewController, UINavigationControllerDelegate, UIImagePickerControllerDelegate  {
    @IBOutlet weak var backButton: UIButton!
    
    @IBOutlet weak var cameraButton: UIButton!
    
    var imagePicker: UIImagePickerController!
    
    @IBAction func backButtonPressed(_ sender: Any) {
        performSegue(withIdentifier: "segueAfterPhoto", sender: nil)
    }
    @IBAction func cameraButtonPressed(_ sender: Any) {
        imagePicker =  UIImagePickerController()
        imagePicker.delegate = self
        imagePicker.sourceType = .camera
        
        present(imagePicker, animated: true, completion: nil)

    }
    
    
    
    var captureSession = AVCaptureSession()
    
    var videoPreviewLayer: AVCaptureVideoPreviewLayer?
    var qrCodeFrameView: UIView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        guard let captureDevice = AVCaptureDevice.default(for: .video) else { return }
        let videoInput: AVCaptureDeviceInput
        
        do {
            // Get an instance of the AVCaptureDeviceInput class using the previous device object.
            let input = try AVCaptureDeviceInput(device: captureDevice)
            
            // Set the input device on the capture session.
            captureSession.addInput(input)
            
            // Initialize a AVCaptureMetadataOutput object and set it as the output device to the capture session.
            let captureMetadataOutput = AVCaptureMetadataOutput()
            captureSession.addOutput(captureMetadataOutput)
            
            // Set delegate and use the default dispatch queue to execute the call back
           // captureMetadataOutput.setMetadataObjectsDelegate(self as! AVCaptureMetadataOutputObjectsDelegate, queue: DispatchQueue.main)
          //  captureMetadataOutput.metadataObjectTypes = supportedCodeTypes
            //            captureMetadataOutput.metadataObjectTypes = [AVMetadataObject.ObjectType.qr]
            
        } catch {
            // If any error occurs, simply print it out and don't continue any more.
            print(error)
            return
        }
        
        videoPreviewLayer = AVCaptureVideoPreviewLayer(session: captureSession)
        videoPreviewLayer?.videoGravity = AVLayerVideoGravity.resizeAspectFill
        videoPreviewLayer?.frame = view.layer.bounds
        view.layer.addSublayer(videoPreviewLayer!)
        
        // Start video capture.
        captureSession.startRunning()
        
        // Move the message label and top bar to the front
        //  view.bringSubview(toFront: messageLabel)
        //  view.bringSubview(toFront: topbar)
        
        view.bringSubviewToFront(backButton)
       view.bringSubviewToFront(cameraButton)
        //imagePicker =  UIImagePickerController()
       // imagePicker.delegate = self
        //imagePicker.sourceType = .camera
        
       // present(imagePicker, animated: true, completion: nil)
        
        
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        picker.dismiss(animated: true)
        
        //guard let image = info[.editedImage] as? UIImage else {
        guard let image = info[.originalImage] as? UIImage else {
            print("No image found")
            return
        }
        
        // print out the image size as a test
        print("Image size is \(image.size)")
      // let imageData:NSData = image.pngData()! as NSData
        let imageData2:NSData = image.jpegData(compressionQuality: 0.5) as! NSData
        
        //print(imageData)
        //Saved image
        //this line crashes the app
      //  UserDefaults.standard.set(imageData, forKey: "savedImage1")
        /*UserDefaults.standard.set(imageData2, forKey: "savedImage1000")
        print("here")
        //Decode
        let data = UserDefaults.standard.object(forKey: "savedImage1000") as! NSData
        print("here!")
        let image2 = UIImage(data: data as Data)
        print("here!!")
        print(image2!.size)
        */
        
        if UserDefaults.standard.array(forKey: "photoList") == nil{
            // teamList = UserDefaults.standard.object(forKey: "teamList") as! [String]
            photoList.removeAll()
            photoList.append("\(teamNum); 1")
            print("photoList is \(photoList)!")
            UserDefaults.standard.set(photoList, forKey: "photoList")
            
            UserDefaults.standard.set(imageData2, forKey: "\(teamNum); 1")
            print("photo taken initial")
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            
        }
        else{
        //else if UserDefaults.standard.array(forKey: "photoList")!.isEmpty == false{
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            var i = 0;
         /*
            while(true){
                if photoList.index(of: "\(teamNum); \(i + 1)") == nil{
                    print(" i is \(i+1)")
                    break;
                }
                i += 1
            }
 */
            if photoList.index(of: "\(teamNum); 1") == nil{
                 i = 1
            }
            else if photoList.index(of: "\(teamNum); 2") == nil{
                i = 2
            }
            else if photoList.index(of: "\(teamNum); 3") == nil{
                i = 3
            }
            else if photoList.index(of: "\(teamNum); 4") == nil{
                i = 4
            }
            else if photoList.index(of: "\(teamNum); 5") == nil{
                i = 5
            }
            else if photoList.index(of: "\(teamNum); 6") == nil{
                i = 6
            }
            else if photoList.index(of: "\(teamNum); 7") == nil{
                i = 7
            }
            else if photoList.index(of: "\(teamNum); 8") == nil{
                i = 8
            }
            else if photoList.index(of: "\(teamNum); 9") == nil{
                i = 9
            }
            else{
                i = 10
            }
            
            
            photoList.append("\(teamNum); \(i)")
            print("\(teamNum); \(i)~~~~~")
            UserDefaults.standard.set(photoList, forKey: "photoList")
            UserDefaults.standard.set(imageData2, forKey: "\(teamNum); \(i)")
            
            print("photo taken")
            photoList = UserDefaults.standard.array(forKey: "photoList") as! [String]
            
            /*
            var i = 1;
            while(true){
                if photoList.index(of: "\(teamNum); \(i)") == nil{
                    break;
                }
                i += 1
            }

            breakLoop = false
            for index in 0...photoList.count - 1 {
                let testString = "\(teamNum); \(i)"
                if testString == photoList[index]{
                    breakLoop = true
                    break;
                }
            }
            print("breakLoop is \(breakLoop!)")
            if breakLoop == false{
                photoList.append("\(teamNum); \(i)")
                print(photoList)
                UserDefaults.standard.set(photoList, forKey: "photoList")
            }
            else if breakLoop == true{
                let indexOfElement = photoList.index(of: "\(teamNum); \(i)")
                photoList.remove(at: indexOfElement!)
                photoList.append("\(teamNum); \(i)")
                print(photoList)
                UserDefaults.standard.set(photoList, forKey: "photoList")
                
            }
            UserDefaults.standard.set(imageData2, forKey: "\(teamNum); \(i)")
            
            
            //comment below code to when you uncomment the above
            //  teamList = UserDefaults.standard.array(forKey: "teamList") as! [String]
            //  teamList.append("\(teamNumber); \(matchNumber)")
            //  UserDefaults.standard.set(teamList, forKey: "teamList")
 */
        }

        
        
    //    performSegue(withIdentifier: "segueAfterPhoto", sender: nil)
        //data is the name of the image
     //   myImageView.image = UIImage(data: data as Data)
        
        
        
       /* let imageData = UIImage.pngData(image)
       // let imageData = UIImageJPEGRepresentation(image, 1)
        let relativePath = "image_\(NSDate.timeIntervalSinceReferenceDate).png"
        let path = self.documentsPathForFileName(relativePath)
        imageData.writeToFile(path, atomically: true)
        UserDefaults.standard.set(relativePath, forKey: "path")
        UserDefaults.standard.synchronize()

        let fileManager = FileManager.default
        do {
            let documentDirectory = try fileManager.url(for: .documentDirectory, in: .userDomainMask, appropriateFor:nil, create:false)
            let fileURL = documentDirectory.appendingPathComponent("\(teamNum); 1")
            
         //   image.write(to: fileURL)
           // var imageData = UIImage.jpegData(image)
           // try imageData.write(to: fileURL)
            
          //  if let imageData = UIImage.jpegData(image) {
           //     try imageData.write(to: fileURL)
            //    return true
           // }
        } catch {
            print(error)
        }
        //return false
         */
        
    }
    
   
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
