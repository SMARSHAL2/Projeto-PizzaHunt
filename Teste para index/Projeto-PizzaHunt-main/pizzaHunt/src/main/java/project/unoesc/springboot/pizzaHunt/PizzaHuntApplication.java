/**
 * Classe principal responsável por iniciar a aplicação PizzaHunt.
 * Esta classe utiliza o framework Spring Boot para iniciar a aplicação web.
 * Ela é anotada com @SpringBootApplication para habilitar a configuração automática do Spring Boot
 * e @EntityScan para especificar o pacote onde as entidades do modelo estão localizadas.
 */
package project.unoesc.springboot.pizzaHunt;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;

@EntityScan(basePackages = "project.unoesc.springboot.pizzaHunt.model")
@SpringBootApplication
public class PizzaHuntApplication {

    /**
     * Método principal (main) da aplicação.
     * Inicializa a aplicação Spring Boot.
     *
     * @param args Argumentos passados para a aplicação via linha de comando.
     */
    public static void main(String[] args) {
        SpringApplication.run(PizzaHuntApplication.class, args);
    }

}
