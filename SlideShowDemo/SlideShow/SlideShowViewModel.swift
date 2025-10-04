//
//  SlideShowViewModel.swift
//  SlideShowDemo
//
//  Created by Anie Parameswaran on 01/10/2025.
//

import Foundation
import Combine

// MARK: - SlideShowVMProtocol

protocol SlideShowVMProtocol: ObservableObject {
    func pause()
    func restartTimer()
    func gestureHandler(translation size: CGSize, action: () -> Void)
    
    var slides: [SlideShowModel] { get }
    var currentIndex: String { get set }
}

// MARK: - SlideShowViewModel

class SlideShowViewModel: SlideShowVMProtocol {
    
    var slides: [SlideShowModel] = []
    
    @Published var currentIndex: String = ""
    private var timer: AnyCancellable?
    
    init() {
        self.initialiseModel()
        self.startTimer()
    }
    
    private func initialiseModel() {
        let slide1 = SlideShowModel(id: "1", image: "burger")
        let slide2 = SlideShowModel(id: "2", image: "cake")
        let slide3 = SlideShowModel(id: "3", image: "icecream")
        self.slides = [slide1, slide2, slide3]
        self.currentIndex = slide1.id
    }
    
    private func startTimer() {
        guard timer == nil else { return }
        
        timer = Timer
            .publish(every: 5, on: .main, in: .common)
            .autoconnect()
            .sink { [weak self] _ in
                guard let self else { return }
                self.moveToNextSlide()
            }
    }
    
    private func moveToNextSlide() {
        let currentIndex = self.slides.firstIndex(where: { $0.id == self.currentIndex }) ?? 0
        let nextIndex = self.slides.index(after: currentIndex)
        
        self.currentIndex = self.slides.count > nextIndex ?
        self.slides[nextIndex].id :
        self.slides.first?.id ?? ""
    }
    
    func pause() {
        timer?.cancel()
        timer = nil
    }
        
    func restartTimer() {
        startTimer()
    }
    
    func gestureHandler(translation size: CGSize, action: () -> Void) {
        let width = size.width
        let height = size.height
        
        if abs(width) > abs(height) {
            action()
        }
    }
}
