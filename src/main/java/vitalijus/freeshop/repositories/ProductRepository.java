package vitalijus.freeshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import vitalijus.freeshop.entities.Product;

import java.util.List;

public interface ProductRepository extends JpaRepository<Product, Long> {
    List<Product> getProductsByUserId(Long userId);
}
