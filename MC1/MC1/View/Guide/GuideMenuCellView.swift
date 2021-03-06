//
//  GuideMenuCellView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideMenuCellView: View {
    @Binding var menu: Menu
    @Binding var isFinish: Bool
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 2)
                .foregroundColor((menu.name == selectedMenuList[iteration].menu.name) ? .primaryColor : .whiteColor)
                .overlay(
                            RoundedRectangle(cornerRadius: 2)
                                .stroke(Color.gray, lineWidth: 1)
                        )
            
            VStack{
                Image(menu.name)
                    .resizable()
                    .scaledToFit()
                Text(menu.name)
//                    .font(Font.mainFont)
                    .font(.caption)
                    .foregroundColor(Color.grayColor)
                Text("₩"+String(menu.price))
//                    .font(Font.mainFont)
                    .font(.caption)
                    .foregroundColor(Color.grayColor)
            }
        }
        .padding(.horizontal)
        .frame(width: 100, height: 120)
    }
}

//struct GuideMenuCellView_Previews: PreviewProvider {
//    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000, setPrice: 6000)
//    static var previews: some View {
//        GuideMenuCellView(menu: $menu)
//    }
//}
