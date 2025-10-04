//
//  SlideShowView.swift
//  SlideShowDemo
//
//  Created by Anie Parameswaran on 01/10/2025.
//

import SwiftUI

// MARK: - SlideShowView

struct SlideShowView: View {
    @StateObject var viewModel = SlideShowViewModel()

    var body: some View {
        VStack {
            self.tabView
                .simultaneousGesture(self.dragGesture)
                .onLongPressGesture(
                    perform: { self.viewModel.pause() },
                    onPressingChanged: { _ in self.viewModel.restartTimer() })
        }
        .padding()
        .frame(height: 300)
        .onAppear { self.viewModel.restartTimer() }
        .onDisappear { self.viewModel.pause() }
    }

    private var tabView: some View {
        TabView(selection: self.$viewModel.currentIndex) {
            ForEach(self.viewModel.slides, id: \.id) { slide in
                image(for: slide)
                    .tag(slide.id)
            }
        }
        .tabViewStyle(.page(indexDisplayMode: .automatic))
        .animation(.easeInOut, value: self.viewModel.currentIndex)
    }

    private func image(for slide: SlideShowModel) -> some View {
        Image(slide.image)
            .resizable()
            .aspectRatio(contentMode: .fill)
    }

    private var dragGesture: _EndedGesture<_ChangedGesture<DragGesture>> {
        DragGesture()
            .onChanged { value in
                self.viewModel.gestureHandler(translation: value.translation) {
                    self.viewModel.pause()
                }
            }
            .onEnded { value in
                self.viewModel.gestureHandler(translation: value.translation) {
                    self.viewModel.restartTimer()
                }
            }
    }
}
