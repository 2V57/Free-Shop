package vitalijus.freeshop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import vitalijus.freeshop.entities.User;
import vitalijus.freeshop.services.UserService;

import java.io.IOException;
import java.security.Principal;

@Controller
public class UserController {

    private final UserService userService;

    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping("/profile")
    public String profile(Principal principal,
                          Model model) {
        User user = userService.getUserByPrincipal(principal);
        model.addAttribute("user", user);
        User updateUser = userService.getUpdateUserFromDb(user);
        model.addAttribute("updateUser", updateUser);
        model.addAttribute("avatar", updateUser.getAvatar());
        return "profile";
    }

    @GetMapping("/user/{id}")
    public String userInfo(@PathVariable("id") User user, Principal principal,
                           Model model) {
        model.addAttribute("user", userService.getUserByPrincipal(principal));
        model.addAttribute("products", user.getProducts());
        model.addAttribute("userInfo", user);
        return "user-info";
    }

    @PostMapping("/profile/edit")
    public String editProfile(
            @RequestParam("email") String email,
            @RequestParam("name") String name,
            @RequestParam("phoneNumber") String phoneNumber
            ) throws IOException {
        userService.editProfile(name, phoneNumber, email);
        return "redirect:/profile";
    }

}
