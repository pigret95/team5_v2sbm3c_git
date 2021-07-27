package dev.mvc.book_world;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.ComponentScan;

@SpringBootApplication
@ComponentScan(basePackages = {"dev.mvc"})
public class BookWorldApplication {

	public static void main(String[] args) {
		SpringApplication.run(BookWorldApplication.class, args);
	}

}
