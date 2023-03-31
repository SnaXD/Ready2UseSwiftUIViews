import SwiftUI

struct ContentView: View {
    var sfIconNames = ["car", "airplane", "bicycle", "tram"]
    let circleSize = CGSize(width: 64, height: 64)
    @State var selectedIndex = 0
    var body: some View {
        GeometryReader { proxy in
            ZStack{
                ZStack{
                    Rectangle()
                        .foregroundColor(Color(uiColor: .systemGray5))
                    //Layer 2
                    //Black Circle
                    HStack(spacing: 0){
                        Circle()
                            .frame(width: circleSize.width, height: circleSize.height)
                            .frame(maxWidth: proxy.size.width / 4)
                            .offset(x: CGFloat(selectedIndex) * (proxy.size.width / 4))
                        Spacer()
                    }
                }
                .mask{
                    //Layer 1
                    //Back Circles + Line
                    ZStack{
                        HStack(spacing: 0){
                            ForEach(0..<4, id: \.self) { _ in
                                Circle()
                                    .frame(width: circleSize.width, height: circleSize.height)
                                    .frame(maxWidth: .infinity)
                            }
                        }
                        Rectangle()
                            .frame(width: proxy.size.width - (proxy.size.width / 4), height: 5)
                    }
                }
                //Layer 3
                //Icons
                HStack(spacing: 0){
                    ForEach(0..<4, id: \.self) { idx in
                        Image(systemName: sfIconNames[idx])
                            .font(.system(size: 25))
                            .foregroundColor(selectedIndex == idx ? .white : Color(uiColor: .darkGray))
                            .frame(maxWidth: .infinity)
                            .onTapGesture {
                                withAnimation(.linear(duration: 0.4)){
                                    selectedIndex = idx
                                }
                            }
                    }
                }
            }
        }
    }
}
