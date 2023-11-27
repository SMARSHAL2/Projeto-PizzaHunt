package project.unoesc.springboot.pizzaHunt.repository;

import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import project.unoesc.springboot.pizzaHunt.model.Cliente;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {
    @Query("select c from Cliente c where upper(trim(c.nome)) like %?1%")
    List<Cliente> buscarPorNome(String nome);
}
