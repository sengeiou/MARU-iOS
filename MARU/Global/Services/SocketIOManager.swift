//
//  SocketIOManager.swift
//  MARU
//
//  Created by 오준현 on 2020/09/04.
//  Copyright © 2020 maru. All rights reserved.
//

import SocketIO

class SocketIOManager: NSObject {
    
    static let shared = SocketIOManager()
    
    var manager = SocketManager(socketURL: URL(string: "http://52.79.90.119:8080/chat/0")!,
                                config: [.log(false), .compress])
    
    var socket: SocketIOClient!
    
    override init() {
        super.init()
        socket = manager.defaultSocket
    }
    
    func establishConnection(_ name: String) {
        socket.connect()
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            self.socket.emit("joinRoom", name)
        })
    }
    
    func closeConnection() {
        socket.disconnect()
    }

    func joinRoom(_ roomIndex: Int,
                  _ name: String){
        socket.emit("joinRoom", name)
    }
    
    func connect(completion: @escaping ([Any]) -> Void){
        socket.on("chat message") { (data, ack) in
            completion(data)
        }
        socket.on("joinRoom") { (data, ack) in
            print(data)
        }

    }
    
    func sendMessage(_ roomIndex: Int,
                     _ message: String,
                     _ nickname: String) {
        socket.emit("joinRoom", nickname)
        socket.emit("chat message", nickname, message, roomIndex)
    }
    
}
