//
//  HouseInformationCard.swift
//  BrashApp
//
//  Created by Hiram Castro on 23/03/24.
//

import SwiftUI

struct HouseInformationCard: View {
    
    var vm:HomeMapVM
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack() {
                ForEach(vm.getRentHousesDataMock(),
                        id: \.self) { houseInfo in
                    
                        VStack {
                            
                            ZStack {//Image
                                Image(houseInfo.imageURL ?? "")
                                    .resizable()
                                    .frame(width: 350, height: 100)
                                    .clipped()
                                    .background(Color.red)
                                
                                VStack {
                                    HStack(spacing: 100) {
                                        HStack() {
                                            Text(houseInfo.amountDecreased ?? "")
                                                .foregroundStyle(Color.white)
                                                .bold()
                                        }
                                        .frame(width: 200)
                                        .background(RoundedRectangle(cornerRadius: 10)
                                            .foregroundColor(.black).opacity(0.7))
                                        
                                        Image(systemName: "heart")
                                            .resizable()
                                            .frame(width: 25, height: 20)
                                            .symbolRenderingMode(.palette)
                                            .foregroundStyle(Color.white)
                                    }
                                }
                                .padding(.bottom, 60)
                                
                            }//Image
                                
                            HStack {
                                Text(houseInfo.rentCost ?? "")
                                    .font(.title)
                                    .bold()
                                Spacer()
                            }
                            
                            HStack {
                                Text(houseInfo.totalBeds ?? "")
                                    .bold()
                                Text("|")
                                Text(houseInfo.totalBath ?? "")
                                    .bold()
                                Text("|")
                                Text(houseInfo.sqftInfo ?? "")
                                    .bold()
                                Text("|")
                                Text(houseInfo.info ?? "")
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                            
                            HStack {
                                Text(houseInfo.address ?? "")
                                    .foregroundStyle(Color.gray)
                                Spacer()
                            }
                            
                        }
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.white))
                    
                }
            }
        }
    }
}

#Preview {
    HouseInformationCard(vm: HomeMapVM())
}
