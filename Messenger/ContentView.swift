//
//  ContentView.swift
//  Messenger
//
//  Created by Мария Ганеева on 28.11.2022.
//

import SwiftUI

struct ContentView: View {

    @State var index = 0 // отвечает за переход рег/автор

    var body: some View {
        GeometryReader { _ in
            VStack {
                Image("logotip")
                    .resizable()
                    .frame(width: 70, height: 70)

                ZStack {
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index)) // чтобы менять порядок
                    Login(index: self.$index)
                }

                HStack(spacing: 15) {
                    Rectangle()
                        .fill(Color(.magenta))
                        .frame(height: 1)

                    Text("OR")

                    Rectangle()
                        .fill(Color(.magenta))
                        .frame(height: 1)
                }
                .padding(.horizontal, 20)
                .padding(.top, 50)
            }
            .padding(.vertical)
        }
        .padding(.top, 100)
        .background(.black).edgesIgnoringSafeArea(.all)
        .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CShape: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: rect.width, y: 120)) // начальная точка
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1: Shape {
    func path(in rect: CGRect) -> Path {
        return Path { path in
            path.move(to: CGPoint(x: 0, y: 120)) // начальная точка
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

struct Login: View {
    @State var email = ""
    @State var password = ""
    @Binding var index : Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    VStack(spacing: 10) {
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)

                        Capsule()
                            .fill(self.index == 0 ? .blue : .clear)
                            .frame(width: 100, height: 5)
                    }

                    Spacer()

                }
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.indigo)
                        TextField("Email Address", text: self.$email)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.indigo)
                        SecureField("Password", text: self.$password)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)

                HStack {
                    Spacer(minLength: 0)

                    Button(action: {
                        //
                    }) {
                        Text("Forget password?")
                            .foregroundColor(.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(.ultraThinMaterial)
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
                self.index = 0
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {
                //
            }) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(.indigo)
                    .clipShape(Capsule())
                    .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y: 35)
            .opacity(self.index == 0 ? 1 : 0) // если index = 0 то видимая вью, иначе невидимая
        }
    }
}

struct SignUp: View {
    @State var email = ""
    @State var password = ""
    @State var repassword = ""
    @Binding var index : Int

    var body: some View {
        ZStack(alignment: .bottom) {
            VStack {
                HStack {
                    Spacer(minLength: 0)

                    VStack(spacing: 10) {
                        Text("SingUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)

                        Capsule()
                            .fill(self.index == 1 ? .blue : .clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(.indigo)
                        TextField("Email Address", text: self.$email)
                    }

                    Divider()
                        .background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.indigo)
                        SecureField("Password", text: self.$password)
                    }

                    Divider()
                        .background(.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)

                VStack {
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(.indigo)
                        SecureField("Password", text: self.$repassword)
                    }
                    Divider()
                        .background(.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(.ultraThinMaterial)
            .clipShape(CShape1())
            .contentShape(CShape1())
            .shadow(color: .black.opacity(0.3), radius: 5, x: 0, y: -5) // тень
            .onTapGesture {
                self.index = 1
            }
            .cornerRadius(35)
            .padding(.horizontal, 20)

            Button(action: {
                //
            }) {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(.indigo)
                    .clipShape(Capsule())
                    .shadow(color: .white.opacity(0.1), radius: 5, x: 0, y:  -5)
            }
            .offset(y: 35)
            .opacity(self.index == 1 ? 1 : 0)
        }
    }
}
