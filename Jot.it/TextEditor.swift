//
//  TextEditor.swift
//  Jot.it
//
//  Created by Jose Blanco on 1/9/24.
//

import Foundation
import HighlightedTextEditor
import SwiftUI
import RichTextKit

struct TextEditorView: View {
    @State var title = ""
    @State var noteBody = ""
    @FocusState var titleFocus: Bool
    @FocusState var bodyFocus: Bool
    
    @State private var text = NSAttributedString(string: "")
    @StateObject var context = RichTextContext()
    
    var body: some View {
        NavigationView {
            VStack {
                CustomField(text: $title, isFocused: $titleFocus, textfield: true, lineLimit: 2, placeholder: "Title...")
                    .animation(.spring, value: title)
                    //.padding(.bottom)
                RichTextEditor(text: $text, context: context) { textView in
                    textView.setCurrentColor(.underline, to: .blue)
                }.toolbar {
                    ToolbarItem(placement: .automatic) {
                        RichTextActionButtonStack(
                            context: context,
                            actions: [.undo, .redo, .copy]
                        )
                    }
                }
                
            }
        }
    }
}

struct EditorScreen: View {

    @State var title = ""
    @FocusState var titleFocus: Bool
    @State private var text = NSAttributedString.empty

    @StateObject
    var context = RichTextContext()

    var body: some View {
        VStack {
            TextField("Title", text: $title, axis: .vertical) // <3>
                            .font(.largeTitle) // <4>
                            .padding() // <5>
                            .focused($titleFocus) // <6>
                            //.padding(.horizontal)
                            // <7>
                            .background(Material.regular)
                            //.background(Color.primary.opacity(0.15))
                            .cornerRadius(15)
                            .padding()
                            .lineLimit(2)
                            
            editor.padding()
            toolbar
        }
        .background(Color.primary.opacity(0.15))
        .navigationTitle("")
        .toolbar {
            ToolbarItemGroup(placement: .navigationBarTrailing) {
                MainMenu()
            }
        }
    }
}

private extension EditorScreen {

    var editor: some View {
        RichTextEditor(text: $text, context: context) {
            $0.textContentInset = CGSize(width: 10, height: 20)
        }
        .background(Material.regular)
        .cornerRadius(10)
        .focusedValue(\.richTextContext, context)
    }

    var toolbar: some View {
        RichTextKeyboardToolbar(
            context: context,
            leadingButtons: {},
            trailingButtons: {}
        ) {
            var sheet = $0
            sheet.colorPickers = .all
            return sheet
        }
    }
}

struct MainMenu: View {

    @State
    private var isSheetPresented = false

    var body: some View {
        Menu {
            RichTextShareMenu(
                formats: .libraryFormats,
                formatAction: { print("TODO: Share file for \($0.id)") },
                pdfAction: { print("TODO: Share PDF file") })
            RichTextExportMenu(
                formats: .libraryFormats,
                formatAction: { print("TODO: Export file for \($0.id)") },
                pdfAction: { print("TODO: Export PDF file") })
            Divider()
        } label: {
            Image(systemName: "menu")
        }.sheet(isPresented: $isSheetPresented) {
            NavigationView {
                VStack {
                    
                }
            }.navigationViewStyle(.stack)
        }
    }
}

struct EditorScreen_Previews: PreviewProvider {

    static var previews: some View {
        EditorScreen()
    }
}
