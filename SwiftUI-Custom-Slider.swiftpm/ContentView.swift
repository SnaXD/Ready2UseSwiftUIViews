import SwiftUI

struct ContentView: View {
    @State var value: Double = 50
    @State var lastCoordinateValue: CGFloat = 0.0
    var sliderRange: ClosedRange<Double> = 0...100
    
    var body: some View {
        GeometryReader { proxy in
            let radius = proxy.size.height * 0.5
            //Width - Thumb width
            let maxValue = proxy.size.width - 40
            
            let scaleFactor = maxValue / (sliderRange.upperBound)
            let lower = sliderRange.lowerBound
            let sliderVal = (self.value - lower) * scaleFactor
            VStack{
                ZStack {
                    RoundedRectangle(cornerRadius: radius)
                        .foregroundColor(Color(uiColor: .systemGray5))
                        .frame(height: 16)
                    HStack(spacing: 0){
                        Rectangle()
                            .foregroundColor(.black)
                            .frame(width: sliderVal, height: 10)
                        Spacer()
                    }
                    .cornerRadius(10)
                    //For a matching padding in all edges
                    .padding(.horizontal, 3)
                    HStack {
                        RoundedRectangle(cornerRadius: radius)
                            .foregroundColor(Color.yellow)
                            .frame(width: 40, height: 24)
                            .offset(x: sliderVal)
                            .gesture(
                                DragGesture(minimumDistance: 0)
                                    .onChanged { v in
                                        if (abs(v.translation.width) < 0.1) {
                                            self.lastCoordinateValue = sliderVal
                                        }
                                        if v.translation.width > 0 {
                                            let nextCoordinateValue = min(maxValue, self.lastCoordinateValue + v.translation.width)
                                            self.value = (nextCoordinateValue / scaleFactor)  + lower
                                        } else {
                                            let nextCoordinateValue = max(0, self.lastCoordinateValue + v.translation.width)
                                            self.value = (nextCoordinateValue / scaleFactor) + lower
                                        }
                                    }
                            )
                        Spacer()
                    }
                }
                .frame(height: 40)
                Text(String(format: "%.0f", value))
            }
        }
    }
}

