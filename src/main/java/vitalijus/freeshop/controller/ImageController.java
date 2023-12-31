package vitalijus.freeshop.controller;

import org.springframework.core.io.InputStreamResource;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import vitalijus.freeshop.services.ProductService;
import vitalijus.freeshop.entities.Image;

import java.io.ByteArrayInputStream;

@RestController
public class ImageController {

    private final ProductService productService;

    public ImageController(ProductService productService) {
        this.productService = productService;
    }


    @GetMapping("/images/{id}")
    public ResponseEntity<?> getImageById(@PathVariable Long id)  {
        Image image = productService.getImageById(id);
        return ResponseEntity.ok()
                .header("fileName", image.getOriginalFileName())
                .contentType(MediaType.valueOf(image.getContentType()))
                .contentLength(image.getSize())
                .body(new InputStreamResource
                        (new ByteArrayInputStream(image.getBytes())));
    }
}
