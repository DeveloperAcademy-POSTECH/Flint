//
//  GuideDrinkChoiceView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/10.
//

import SwiftUI

struct GuideDrinkChoiceView: View {
    @State var isGuideShoppingCartView = false
    @Binding var menu: Menu
    @Binding var count: Int
    @Binding var isLargeSet: Bool
    @Binding var sideMenu: String
    @State var drink: String = ""
    var columns: [GridItem] = Array(repeating: .init(.flexible()), count: 3)
    
    var body: some View {
        if isGuideShoppingCartView{
            GuideFinalMenuCheckView(menu: $menu, count: $count, isSetMenu: .constant(true), isLargeSet: $isLargeSet, sideMenu: $sideMenu, drink: $drink)
        } else {
            ZStack {
                Color.whiteColor
                    .ignoresSafeArea()
                
                HStack {
                    VStack{
                        altImage
                            .foregroundColor(.grayColor)
                            .frame(width: 50, height: 50, alignment: .center)
                        
                        Text(menu.name + " 세트")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.vertical)
                        
                        Text(sideMenu)
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.vertical)
                        
                        Text("세트메뉴 음료를 선택해주세요.")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.vertical)
                        
                        Text("주문 확인하기")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.vertical)
                        
                        Spacer()
                    }
                    .frame(width: 120, alignment: .center)
                    
                    Divider()
                    
                    VStack {
                        HStack {
                            Text(menu.name + " 세트")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                            
                            Text("영양 정보")
                                .foregroundColor(.grayColor)
                                .font(.mainFont)
                                .padding()
                                .border(Color.grayColor)
                        }
                        
                        Text("세트메뉴 음료를 선택해주세요")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                        
                        ScrollView{
                            LazyVGrid(columns: columns) {
                                ForEach(mcdonaldDrink, id: \.self){ d in
                                    Button(action: {
                                        drink=d
                                        isGuideShoppingCartView=true
                                    }) {
                                        VStack{
                                            altImage
                                                .foregroundColor(.grayColor)
                                                .frame(width: 70, height: 70)
                                            Text(d)
                                                .font(Font.mainFont)
                                                .foregroundColor(Color.grayColor)
                                        }
                                        .frame(width: 100, height: 150, alignment: .center)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
    }
}

struct GuideDrinkChoiceView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "더블 불고기 버거", tag: [], price: 5000, setPrice: 6000)
    static var previews: some View {
        GuideDrinkChoiceView(menu: $menu, count: .constant(1), isLargeSet: .constant(true), sideMenu: .constant("사이드메뉴"))
    }
}
