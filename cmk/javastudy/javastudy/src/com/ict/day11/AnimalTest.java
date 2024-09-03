package com.ict.day11;

public class AnimalTest {
    public static void main(String[] args) {

        Animal animal = new Animal();
        animal.setAge(3);
        animal.setName("큰뿔소");
        animal.setLive(true);

        // 이름과 생존 여부 출력
        System.out.println("이름: " + animal.getName());
        System.out.println("생존 여부: " + (animal.isLive() ? "살아있음" : "죽음"));

     
    }
}
