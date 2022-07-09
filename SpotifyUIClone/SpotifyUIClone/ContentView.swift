//
//  ContentView.swift
//  SpotifyUIClone
//
//  Created by Ilya Zelkin on 30.06.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            Background()
            VStack {
                Cover()
                
                VStack {
                    ArtistInfo()
                    Controls()
                    
                    VStack(spacing: 24) {
                        Track(name: "RIP Lil Phat", artists: "YoungBoy Never Broke Again", explicit: true, playing: false)
                        Track(name: "Knocked Off", artists: "YoungBoy Never Broke Again", explicit: true, playing: false)
                        Track(name: "Lil Top", artists: "YoungBoy Never Broke Again", explicit: true, playing: true)
                        Track(name: "Red Eye", artists: "YoungBoy Never Broke Again", explicit: true, playing: false)
                        Track(name: "Fine By Time", artists: "YoungBoy Never Broke Again", explicit: true, playing: false)
                    }.padding(.top)
                }
                Spacer()
            }
            
            VStack {
                MediaPlayer()
                Menu()
            }
            .background(Color(#colorLiteral(red: 0.1443889439, green: 0.1443889439, blue: 0.1443889439, alpha: 1)))
            .offset(y: UIScreen.main.bounds.height / 2 - 75)
            
        }.foregroundColor(.white)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct Background: View {
    
    //Color(#colorLiteral(red: 0.6680337191, green: 0.5484392047, blue: 0.4873991609, alpha: 1))
    let colors: [Color] = [Color(#colorLiteral(red: 0.4611321688, green: 0.3731327057, blue: 0.3136254251, alpha: 1)), Color(#colorLiteral(red: 0.3514457345, green: 0.2878119648, blue: 0.254212141, alpha: 1)), Color(#colorLiteral(red: 0.2252764106, green: 0.1909053922, blue: 0.1654431522, alpha: 1)),Color(#colorLiteral(red: 0.1326926947, green: 0.1130195037, blue: 0.1047289297, alpha: 1)), Color(#colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1)), Color(#colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1)), Color(#colorLiteral(red: 0.07058823854, green: 0.07058823854, blue: 0.07058823854, alpha: 1))]
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: colors), startPoint: .top, endPoint: .bottom)
            .edgesIgnoringSafeArea(.all)
    }
}

struct Cover: View {
    
    var body: some View {
        ZStack(alignment: .top) {
            Image("cover")
                .resizable()
                .frame(width: 270, height: 270)//270
                .shadow(radius: 5)
            
            Image(systemName: "chevron.left")
                .offset(x: -165)
                .font(.system(size: 20))
        }
    }
}

struct ArtistInfo: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text("Still Flexin, Still Steppin")
                    .font(.system(size: 25, weight: .bold))
                
                HStack {
                    Image("nba")
                        .resizable()
                        .frame(width: 30, height: 30)
                        .clipShape(Circle())
                    Text("YoungBoy Never Broke Again")
                        .font(.system(size: 14, weight: .bold))
                }
            }
            .padding(.leading)
            .padding(.top)
            
            Spacer()
        }
    }
}

struct Controls: View {
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 10) {
                HStack {
                    Text("Album")
                    Circle()
                        .frame(width: 3, height: 3)
                    Text("2020")
                }
                
                HStack(spacing: 25) {
                    Image(systemName: "heart")
                    Image(systemName: "arrow.down.circle")
                    Image(systemName: "ellipsis")
                    
                    Spacer()
                    
                    Image(systemName: "shuffle")
                        //.padding(.trailing)
                    
                    ZStack(alignment: .bottomTrailing) {
                        ZStack {
                            Circle()
                                .frame(width: 60, height: 60)
                                .foregroundColor(.green)
                            
                            Image(systemName: "play.fill")
                                .foregroundColor(.black)
                                .font(.system(size: 25))
                        }
                    }
                }
                .font(.system(size: 25))
            }
            .foregroundColor(Color(UIColor.lightGray))
            .font(.system(size: 14))
            
            Spacer()
        }
        /*
         ZStack(alignment: .bottomTrailing) {
             ZStack {
                 Circle()
                     .frame(width: 60, height: 60)
                     .foregroundColor(.green)
                 
                 Image(systemName: "play.fill")
                     .foregroundColor(.white)
                     .font(.system(size: 25))
             }
         }
         */
        .padding(.horizontal)
    }
}

struct Track: View {
    let name: String
    let artists: String
    let explicit: Bool
    let playing: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(name)
                    .font(.system(size: 14))
                    .foregroundColor(playing ? .green : .white)
                
                HStack {
                    
                    if explicit {
                        Image(systemName: "e.square.fill")
                    }
                    
                    Text(artists)
                        .font(.system(size: 12))
                }
                .foregroundColor(Color(UIColor.lightGray))
            }
            Spacer()
            
            Image(systemName: "ellipsis")
        }
        .padding(.horizontal)
    }
}

struct MediaPlayer: View {
    var body: some View {
        HStack {
            HStack {
                Image("cover")
                    .resizable()
                    .frame(width: 60, height: 60)
                
                VStack(alignment: .leading) {
                    Text("Lil Top")
                    Text("YoungBoy Never Broke Again")
                        .foregroundColor(Color(UIColor.lightGray))
                }
                .font(.system(size: 14))
            }
            
            Spacer()
            
            HStack(spacing: 35) {
                Image(systemName: "hifispeaker")
                    .foregroundColor(Color(UIColor.lightGray))
                Image(systemName: "play.fill")
            }
            .font(.system(size: 25))
            .padding(.trailing)
        }
        .border(Color.black, width: 0.3)
    }
}

struct Menu: View {
    var body: some View {
        HStack {
            VStack(spacing: 8) {
                Image(systemName: "house")
                    .font(.system(size: 20))
                
                Text("Home")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(UIColor.lightGray))
            
            Spacer()
            
            VStack(spacing: 8) {
                Image(systemName: "magnifyingglass")
                    .font(.system(size: 20))
                
                Text("Search")
                    .font(.system(size: 12))
            }
            
            Spacer()
            
            VStack(spacing: 8) {
                Image(systemName: "text.justifyright")
                    .rotationEffect(.degrees(90))
                    .font(.system(size: 20))
                
                Text("Search")
                    .font(.system(size: 12))
            }
            .foregroundColor(Color(UIColor.lightGray))
        }
        .padding(.bottom, 30)
        .padding(.top, 2)
        .padding(.horizontal, 40)
    }
}
