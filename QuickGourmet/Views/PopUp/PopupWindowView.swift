//
//  PopupWindowView.swift
//  QuickGourmet
//
//  Created by sasaki.ken on 2021/08/05.
//

import SwiftUI

struct PopupWindowView: View {
    @Binding var show: Bool
    @State private var selection = 0
    let action = {}

    var body: some View {
        if show {
            ZStack {
                Color.black.opacity(0.3)
                    .edgesIgnoringSafeArea(.all)
                ZStack {
                    VStack(alignment: .center, spacing: 0) {
                        Text("おおよその徒歩時間を選択")
                            // .frame(minWidth: .infinity)
                            .frame(height: 45, alignment: .center)
                            .font(.headline)
                            .padding(.top, 20)
                        Picker(selection: $selection, label: Text("徒歩時間")) {
                            Text("おおよそ3分").tag(0)
                            Text("おおよそ7分").tag(1)
                            Text("おおよそ13分").tag(2)
                            Text("おおよそ20分").tag(3)
                            Text("おおよそ30分").tag(4)
                        }
                        .frame(maxWidth: 200)
                        .padding(.top, 20)
                        Button(action: {
                            withAnimation(.linear(duration: 0.3)) {
                                action()
                                show = false
                            }
                        }) {
                            SearchButton(text: "検索")
                                .padding(.vertical, 20)
                        }
                    }
                    .frame(maxWidth: 300)
                    .cornerRadius(20)
                    .background(Color.white)
                    .cornerRadius(20)
                    Image(systemName: "xmark.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color.white)
                        .offset(x: 0, y: 230)
                        .onTapGesture {
                            show = false
                        }
                }
            }
        }
    }
}

struct PopupWindowView_Previews: PreviewProvider {
    static var previews: some View {
        PopupWindowView(show: .constant(true))
    }
}