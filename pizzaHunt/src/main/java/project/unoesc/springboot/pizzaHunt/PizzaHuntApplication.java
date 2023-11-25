package project.unoesc.springboot.pizzaHunt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = "project.unoesc.springboot.pizzaHunt.model")
@SpringBootApplication
public class PizzaHuntApplication {

	public static void main(String[] args) {
		SpringApplication.run(PizzaHuntApplication.class, args);
	}

}
