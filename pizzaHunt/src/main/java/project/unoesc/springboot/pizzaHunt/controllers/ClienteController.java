package project.unoesc.springboot.pizzaHunt.controllers;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import project.unoesc.springboot.pizzaHunt.model.Cliente;
import project.unoesc.springboot.pizzaHunt.repository.ClienteRepository;

@RestController
@RequestMapping("/clientes")
public class ClienteController {

    @Autowired
    private ClienteRepository clienteRepository;

    @GetMapping("/listar")
    public ResponseEntity<List<Cliente>> listarClientes() {
        List<Cliente> clientes = clienteRepository.findAll();
        return new ResponseEntity<>(clientes, HttpStatus.OK);
    }
    
    @PostMapping(value = "/salvar")
    public ResponseEntity<?> salvarCliente(@RequestBody Cliente cliente) {
        System.out.println("Salvando cliente: " + cliente);
        Cliente clienteSalvo = clienteRepository.save(cliente);
        return new ResponseEntity<>(clienteSalvo, HttpStatus.CREATED);
    }

    
    @DeleteMapping(value = "/deletar")
    public ResponseEntity<String> deletarCliente(@RequestParam Long idCliente) {
        if (!clienteRepository.existsById(idCliente)) {
            return new ResponseEntity<>("Cliente não encontrado.", HttpStatus.NOT_FOUND);
        }
        clienteRepository.deleteById(idCliente);
        return new ResponseEntity<>("Cliente excluído com sucesso", HttpStatus.OK);
    }
    
    @GetMapping(value = "/buscarpornome")
	@ResponseBody
	public ResponseEntity<List<Cliente>> bucarpornome(@RequestParam(name = "nome") String nome) {
		List<Cliente> usuario = clienteRepository.buscarPorNome(nome.trim().toUpperCase());
		return new ResponseEntity<List<Cliente>>(usuario, HttpStatus.OK);
	}
    
    @GetMapping(value = "/buscaruserid")
    @ResponseBody
    public ResponseEntity<?> buscarClientePorId(@RequestParam(name = "iduser") Long idCliente) {
        Optional<Cliente> cliente = clienteRepository.findById(idCliente);

        if (cliente.isPresent()) {
            return new ResponseEntity<>(cliente.get(), HttpStatus.OK);
        } else {
            return new ResponseEntity<>("Cliente não encontrado", HttpStatus.NOT_FOUND);
        }
    }


}
