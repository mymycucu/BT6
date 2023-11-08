//
//  TirukanCamera.swift
//  BTProjects
//
//  Created by Ario Syahputra on 07/11/23.
//

//import SwiftUI
//
//struct TirukanCamera: View {
//   
//
//    var body: some View {
//        ZStack {
//                .frame(width: 310, height: 400)
//                .cornerRadius(22)
//                .overlay(
//                    RoundedRectangle(cornerRadius: 22)
//                        .stroke(Color.PB500, lineWidth: 8) // Use your desired stroke color
//                )
//                .shadow(color: Color.white.opacity(0.3), radius: 5, x: 0, y: 5)
//            
//        }
//    }
//}
//
//#Preview {
//    TirukanCamera()
//}

import SwiftUI
import AVFoundation

struct CameraPreview: UIViewRepresentable {
    let session: AVCaptureSession

    func makeUIView(context: Context) -> UIView {
        let previewView = UIView()
        let previewLayer = AVCaptureVideoPreviewLayer(session: session)
        previewLayer.videoGravity = .resizeAspectFill
        previewLayer.frame = previewView.layer.bounds
        previewView.layer.addSublayer(previewLayer)
        return previewView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        // Update the view if needed
    }
}

struct CameraView: View {
    @State private var isCameraRunning = false
    private var session = AVCaptureSession()

    var body: some View {
        VStack {
            CameraPreview(session: session)
                .onAppear {
                    startCamera()
                }
                .onDisappear {
                    stopCamera()
                }
        }
    }

    private func startCamera() {
        guard !isCameraRunning else { return }

        session.beginConfiguration()

        if let device = AVCaptureDevice.default(.builtInDualCamera, for: .video, position: .back) {
            do {
                let input = try AVCaptureDeviceInput(device: device)
                if session.canAddInput(input) {
                    session.addInput(input)
                }

                let output = AVCaptureVideoDataOutput()
                if session.canAddOutput(output) {
                    session.addOutput(output)
                }

                session.commitConfiguration()
                session.startRunning()
                isCameraRunning = true
            } catch {
                print("Error setting up the camera: \(error.localizedDescription)")
            }
        }
    }

    private func stopCamera() {
        if isCameraRunning {
            session.stopRunning()
            isCameraRunning = false
        }
    }
}























