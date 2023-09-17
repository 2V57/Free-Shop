package vitalijus.freeshop.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import vitalijus.freeshop.entities.Image;

public interface ImageRepository extends JpaRepository<Image, Long> {
}
