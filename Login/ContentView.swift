//
//  ContentView.swift
//  Login
//
//  Created by Jan Hovland on 13/11/2019.
//  Copyright © 2019 Jan Hovland. All rights reserved.
//

//  Block comment : Ctrl + Cmd + / (on number pad)
//  Indent        : Ctrl + Cmd + * (on number pad)

import SwiftUI

struct ContentView: View {
    
    @State var user = ""
    @State var pass = ""
    @State var login = false
    @State var signup = false
    
    var body: some View {
        VStack{
            Login(login: $login, signup: $signup, user: $user, pass: $pass)
        }.alert(isPresented: $login) {
            Alert(title: Text(self.user), message: Text(self.pass), dismissButton: .none)
        }
        .sheet(isPresented: $signup) {
            signUp(signup: self.$signup)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Login : View {
    
    @Binding var login : Bool
    @Binding var signup : Bool
    @Binding var user : String
    @Binding var pass : String
    
    var body : some View{
        VStack(alignment: .center, spacing: 12, content: {
            Image("CloudKit").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
            HStack{
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .cornerRadius(20)
            
            HStack{
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                SecureField("Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .cornerRadius(20)
            
            Button(action: {
                self.login.toggle()
            }) {
                Text("Login")
            }
            .cornerRadius(20)
            .shadow(radius: 25)
            
            Text("Dont have account yet")
            Button(action: {
                self.signup.toggle()
            }) {
                Text("SignUp")
            }
            .cornerRadius(20)
            .shadow(radius: 25)
            
            Spacer()
        })
        .padding(.horizontal, 18)
    }
}

struct signUp : View  {
    
    @Binding var signup : Bool
    @State var user : String = ""
    @State var pass : String = ""
    @State var repass : String = ""
    
    var body : some View{
        VStack(alignment: .center, spacing: 22, content: {
            Image("CloudKit").resizable().frame(width: 80, height: 80).padding(.bottom, 15)
            
            HStack{
                Image(systemName: "person.fill").resizable().frame(width: 20, height: 20)
                TextField("Username", text: $user).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .cornerRadius(20)
            
            HStack{
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                SecureField("Password", text: $repass).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .cornerRadius(20)
            
            HStack{
                Image(systemName: "lock.fill").resizable().frame(width: 15, height: 20).padding(.leading, 3)
                SecureField("Re-Password", text: $pass).padding(.leading, 12).font(.system(size: 20))
            }.padding(12)
                .cornerRadius(20)
            
            Button(action: {
                self.signup.toggle()
            }) {
                Text("SignUp")
            }
            .cornerRadius(20)
            .shadow(radius: 25)
        })
        .padding(.horizontal, 18)
    }
}

