//
//  HelpPageVIewReal.swift
//  MC1
//
//  Created by uiskim on 2022/04/11.
//

import SwiftUI

struct HelpPageViewReal: View {
    @Environment(\.presentationMode) var presentationMode
    
    @State private var buttonNumbers = 0
    @Binding var showEndView: Bool
    
    var body: some View {
        if showEndView{
            StoreChoiceView()
        }else{
            TabView(selection: $buttonNumbers) {
                ForEach(helpingDatas){context in
                    ZStack {
                        Image("background")
                        VStack {
                            Text(context.topText)
                                .font(.system(size: 28, weight: .heavy))
                                .foregroundColor(Color.black)
                                .multilineTextAlignment(.center)
                            Image(context.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 270)
                            Spacer().frame(height: 65)
                        }
                        HStack {

                                Button {
                                    if buttonNumbers > 0{
                                        buttonNumbers -= 1
                                    }
                                } label: {
                                    if buttonNumbers > 0 {
                                        Image("HelpingBackwardButton")
                                    }else if buttonNumbers == 0{
                                        Image("HelpingBackwardButton").hidden()
                                    }
                                }
                            
                            Spacer().frame(width: 230)
                            VStack {
                                Button {
                                    if buttonNumbers < 3 {
                                        buttonNumbers += 1
                                    }
                                } label: {
                                    if buttonNumbers < 3 {
                                        Image("HelpingForwardButton")
                                    }else if buttonNumbers == 3 {
                                        Image("HelpingBackwardButton").hidden()
                                    }
                                }
                                
                            }
                        }
                        VStack {
                            Spacer().frame(height: 305)
                            Button {
                                if buttonNumbers == 3{
                                    presentationMode.wrappedValue.dismiss()
                                    showEndView.toggle()
                                    
                                }
                            } label: {
                                if buttonNumbers != 3 {
                                    Image("HelpingGuideStartButton")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                } else {
                                    Image("GuideStartLast")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 300)
                                }
                            }
                        }
                    }
                }
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .ignoresSafeArea()
        }
    }
}


//MARK: Guide Struct

struct helpGuides: Identifiable,Hashable {
    let id: Int
    let topText: String
    let image: String
}


//MARK: GuideDatas

let helpingDatas = [
    helpGuides(id: 0, topText: "????????? ?????? ??????\n ????????? ????????? ?????????", image: "HelpingGuideImg1"),
    helpGuides(id: 1, topText: "????????? ?????? ?????????\n ????????? ???????????? ???????????????", image: "HelpingGuideImg2"),
    helpGuides(id: 2, topText: "???????????? ???????????? ??????\n ?????? ???????????? ??????????????????", image: "HelpingGuideImg3"),
    helpGuides(id: 3, topText: "???????????????'??? ??????\n ??????????????? ??????????????????!", image: "HelpingGuideImg4")
]


struct HelpPageViewReal_Preview: PreviewProvider {
    static var previews: some View {
        HelpPageViewReal(showEndView: .constant(false))
    }
}

