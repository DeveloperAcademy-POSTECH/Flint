//
//  MenuQuantityView.swift
//  MC1
//
//  Created by Yeongwoo Kim on 2022/04/07.
//

import SwiftUI

struct MenuQuantityView: View {
    @Environment(\.presentationMode) var presentationMode
    @Binding var menu: Menu
    @Binding var isMenuSelected: Bool
    @Binding var menuQuantity: Int
    
    var body: some View {
        ZStack{
            Image("SheetBackground")

            VStack {
                Text(menu.name)
                    .foregroundColor(.grayColor)
                    .font(.titleFont)
                Text("주문하실 수량을 선택해주세요")
                    .foregroundColor(.grayColor)
                    .padding(.bottom, 30)

                ZStack{
                    Image("StepperBackground")
                    HStack {
                        Button(action: {
                            if menuQuantity>1{
                                menuQuantity-=1
                            }
                        }) {
                            Image(systemName: "minus.circle")
                        }
                        .foregroundColor(.grayColor)
                        
                        Text(String(menuQuantity)+"개")
                            .foregroundColor(.grayColor)
                            .font(.mainFont)
                            .padding(.horizontal, 70)
                        
                        Button(action: {
                            menuQuantity+=1
                        }) {
                            Image(systemName: "plus.circle")
                        }
                        .foregroundColor(.grayColor)
                    }
                }
                .padding(.bottom, 70)

                HStack{
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                        isMenuSelected.toggle()
                    }) {
                        Image("PreviousButton")
                    }

                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        Image("NextButton")
                    }
                }
            }
        }
    }
}

struct MenuQuantityView_Previews: PreviewProvider {
    @State static var menu = Menu(name: "트리플 치즈버거", tag: [], price: 5000)
    static var previews: some View {
        MenuQuantityView(menu: $menu, isMenuSelected: .constant(true), menuQuantity: .constant(1))
    }
}
