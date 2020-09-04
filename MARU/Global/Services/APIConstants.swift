//
//  APIConstants.swift
//  MARU
//
//  Created by 오준현 on 2020/08/14.
//  Copyright © 2020 maru. All rights reserved.
//

struct APIConstants {
    static let BaseURL = "http://52.79.90.119:3002/"
    
    // POST 회원가입
    static let signUp = BaseURL + "user/signup"
    // POST 로그인
    static let signIn = BaseURL + "user/signin"
    // POST 아이디 중복체크
    static let checkID = BaseURL + "user/checkId"
    // POST 닉네임 중복체크
    static let checkNick = BaseURL + "user/checkNick"
    // GET 내 프로필 조회
    static let myInfo = BaseURL + "user/profile"
    // POST 회원 탈퇴
    static let userWithdrawal = BaseURL + "user/withdrawal"
    
    // GET 메인화면
    static let main = BaseURL + "main"
    
    // GET 책 검색 - 토론방 개설 목적 search/book?title=책제목
    static let searchBook = BaseURL + "search/book"
    // GET 토론방 방장 제한(1번가능)
    static let limitLeader = BaseURL + "room/limitLeader"
    // POST 토론방 개설
    static let makeMoim = BaseURL + "room/make"
    
    // GET 개설된 토론방 검색
    static let searchMoim = BaseURL + "search/room"
    // GET 토론방 참가자 제한(2번가능)
    static let limitJoin = BaseURL + "room/limitJoin"
    // GET 토론방 소개 room/roomInfo/:roomIdx
    static let IntroMoim = BaseURL + "room/roomInfo/"
    
    // GET 토론방 입장(퀴즈풀이) room/roomQuiz/:roomIdx
    static let IntroQuiz = BaseURL + "room/roomQuiz/"
    // POST 방장 별점 평가
    static let rateLeader = BaseURL + "user/rating"
    
    // GET 채팅 목록 받아오기
    static let chat = BaseURL + "message/"
}
