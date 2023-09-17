package vitalijus.freeshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import vitalijus.freeshop.entities.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByEmail(String email);

    User findByActivationCode(String activationCode);
}
