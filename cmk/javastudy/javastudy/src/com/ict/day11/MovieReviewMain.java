package com.ict.day11;

public class MovieReviewMain {
    public static void main(String[] args) {
        // Creating movie review instances
        MovieReview movie1 = new MovieReview("인셉션", "인생은 무한루프");
        MovieReview movie2 = new MovieReview("어바웃 타임", "인생 시간 영화 !");

        // Printing movie review information
        System.out.println("영화 제목 : " + movie1.title + ", 리뷰 : " + movie1.review);
        System.out.println("영화 제목 : " + movie2.title + ", 리뷰 : " + movie2.review);
    }
}