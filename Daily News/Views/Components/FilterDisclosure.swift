//
//  FilterDisclosure.swift
//  Daily News
//
//  Created by Nikos Stauropoulos on 10.08.24.
//

import SwiftUI

struct FilterDisclosure: View {
    @ObservedObject var viewModel:FilteredArticlesViewModel
    @Binding var isExpanded:Bool
    var body: some View {
        DisclosureGroup(
            isExpanded: $isExpanded,
            content: {
                VStack{
                    TextField("Set a keyword for example 'Tesla' ", text: $viewModel.userInputKeyword)
                        .padding()
                        .border(Color.gray, width: 2)
                        .cornerRadius(5.0)
                    
                    DatePicker("From", selection: $viewModel.userInputDateFrom,displayedComponents: .date)
                    
                    Divider()
            
                    DatePicker("To", selection: $viewModel.userInputDateTo, displayedComponents: .date)
                    
                    Button("Search") {
                        viewModel.fetchFilteredArticles()
                        isExpanded = false
                    }
                    .buttonStyle(.borderedProminent)
                }
            },
            label: {
                Image(systemName: "line.3.horizontal.decrease.circle")
                    .font(.title2)
                Text("Filter")
            })
        .padding()
    }
}
