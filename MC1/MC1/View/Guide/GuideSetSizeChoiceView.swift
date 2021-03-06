//
//  GuideSetSizeChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideSetSizeChoiceView: View {
    @State var isGuideSideMenuChoiceView = false
    @Binding var menu: Menu
    @Binding var count: Int
    @State var isLargeSet: Bool = false
    @Binding var isFinish: Bool
    
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        if isGuideSideMenuChoiceView {
            GuideSideMenuChoiceView(menu: $menu, count: $count, isLargeSet: $isLargeSet, isFinish: $isFinish)
        } else {
            ZStack{
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack{
                    VStack {
                        Text("주문 확인하기")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .frame(width: 120, alignment: .center)
                        Spacer()
                    }
                    .padding(.top, 100)
                    
                    Divider()
                    
                    VStack{
                        Text(menu.name)
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.bottom, 70)
                        
                        ScrollView{
                            LazyVGrid(columns: columns) {
                                Button(action: {
                                    isLargeSet=false
                                    isGuideSideMenuChoiceView=true
                                }) {
                                    ZStack {
                                        RoundedRectangle(cornerRadius: 2)
                                            .foregroundColor(.primaryColor)
                                            .overlay(
                                                        RoundedRectangle(cornerRadius: 2)
                                                            .stroke(Color.gray, lineWidth: 1)
                                                    )
                                        
                                        VStack{
                                            Image(menu.name)
                                                .resizable()
                                                .scaledToFit()
                                            Text(menu.name+" 세트")
                            //                    .font(Font.mainFont)
                                                .font(.caption)
                                                .foregroundColor(Color.grayColor)
                                            Text("₩"+String(menu.setPrice))
                            //                    .font(Font.mainFont)
                                                .font(.caption)
                                                .foregroundColor(Color.grayColor)
                                        }
                                    }
                                    .padding(.horizontal)
                                    .frame(width: 100, height: 110)
                                    
                                    

//                                    .frame(width: 100, height: 150, alignment: .center)
                                }
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 2)
                                        .foregroundColor(.whiteColor)
                                        .overlay(
                                                    RoundedRectangle(cornerRadius: 2)
                                                        .stroke(Color.gray, lineWidth: 1)
                                                )
                                    
                                    VStack{
                                        Image(menu.name)
                                            .resizable()
                                            .scaledToFit()
                                        Text(menu.name+" 라지세트")
                        //                    .font(Font.mainFont)
                                            .font(.caption)
                                            .foregroundColor(Color.grayColor)
                                        Text("₩"+String(menu.setPrice+600))
                        //                    .font(Font.mainFont)
                                            .font(.caption)
                                            .foregroundColor(Color.grayColor)
                                    }
                                }
                                .padding(.horizontal)
                                .frame(width: 100, height: 110)
                                
                                ZStack {
                                    RoundedRectangle(cornerRadius: 2)
                                }
                                .padding(.horizontal)
                                .frame(width: 100, height: 110)
                            }
                        }
                        .frame(width: 250)
                    }
                }
            }
            .frame(height: 650)
        }
    }
}

struct GuideSetSizeChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "빅맥®", tag: [], price: 5000, setPrice: 6000)
    static var previews: some View {
        GuideSetSizeChoiceView(menu: $menu, count: .constant(1), isFinish: .constant(false))
    }
}
