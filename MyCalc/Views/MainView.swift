//
//  MainView.swift
//  MyCalc
//
//  Created by Elena Chelyshkina on 22/08/2024.
//

import SwiftUI

struct MainView: View {
    
    @EnvironmentObject var viewModel: ViewModel
    
    // создаем фон (черный в кальк), диспелей (где показывается ввод), кнопки
    var body: some View {
        // функция помещает на задний фон
        ZStack {
            Color.black   //фон
                .ignoresSafeArea()  //окрашиваем всю область
            // вертикальное расположение - дисплея и кнопок
            VStack(spacing: 12) {
                
                Spacer() //отступ сверху
                // дисплей
                HStack {
                    Spacer()
                    Text(viewModel.value)  // дисплей
                        .foregroundColor(.white)
                        .font(.system(size: 90))
                        .fontWeight(.light)
                        .padding(.horizontal, 27) //отступ от права
                }
                // кнопки
                ForEach(viewModel.buttonsArray, id: \.self) {row in
                    HStack(spacing: 12) {
                        ForEach(row, id: \.self) { item in
                            Button {
                                //action - действие кнопки
                                viewModel.didTap(item: item)
                            } label:{
                                // внешний вид кнопки
                                Text(item.rawValue)
                                    .frame(
                                        width: viewModel.buttonWidth(item: item),
                                        height: viewModel.buttonHeight()) //размер массива
                                    .foregroundColor(item.buttonFontColor) //цвет шрифта в ячейке
                                    .background(item.buttonColor) //цвет фона ячейки
                                    .font(.system(size: 35)) //размер шрифта
                                    .cornerRadius(40) //округление ячейки
                                
                            }
                        }
                    }
                }
            }
            .padding(.bottom) //отступ снизу
        }
    }
    

}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .environmentObject(ViewModel())
    }
}
