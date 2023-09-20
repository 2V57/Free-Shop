package vitalijus.freeshop.services;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import vitalijus.freeshop.entities.Image;
import vitalijus.freeshop.entities.Role;
import vitalijus.freeshop.entities.User;
import vitalijus.freeshop.repositories.UserRepository;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.security.Principal;
import java.util.*;
import java.util.stream.Collectors;
import java.util.zip.Deflater;

@Service
public class UserService {
    private static final Logger log = LoggerFactory.getLogger(UserService.class);

    private static final Logger logger =
            LoggerFactory.getLogger(UserService.class);
    @Value("${mail.username}")
    private String emailFrom;
    @Value("${host.name}")
    private String hostName;
    private final UserRepository userRepository;
    private final PasswordEncoder passwordEncoder;
    private final MailSender mailSender;

    public UserService(UserRepository userRepository,
                       PasswordEncoder passwordEncoder,
                       MailSender mailSender) {
        this.userRepository = userRepository;
        this.passwordEncoder = passwordEncoder;
        this.mailSender = mailSender;
    }

    public boolean createUser(User user) {
        if (userRepository.findByEmail(user.getEmail()) != null) return false;
        user.setPassword(passwordEncoder.encode(user.getPassword()));
        user.getRoles().add(Role.ROLE_USER);
        user.setActivationCode(UUID.randomUUID().toString());
        userRepository.save(user);
        sendEmailMessage(user.getEmail(), user.getActivationCode(), user.getName());
        return true;
    }

    public User getUpdateUserFromDb(User user) {
        return userRepository.findById(user.getId())
                .orElse(null);
    }

    private void sendEmailMessage(String userEmail, String activationCode, String name){
        String messageText = String.format("Sveiki, %s!" +
                "Dėkojame, kad prisijungėte prie Free Shop." +
                "Norėdami aktyvuoti paskyrą, turite spustelėti nuorodą %s", name,
                hostName + "activate/" + activationCode);
        SimpleMailMessage messageToActivateUser= new SimpleMailMessage();
        messageToActivateUser.setTo(userEmail);
        messageToActivateUser.setFrom(emailFrom);
        messageToActivateUser.setSubject("Pašto adreso patvirtinimas");
        messageToActivateUser.setText(messageText);

        mailSender.send(messageToActivateUser);
    }

    public boolean activateUser(String activationCode) {
        User user = userRepository.findByActivationCode(activationCode);
        if (user != null) {
            log.info("Activate user: {}, email: {}", user.getName(), user.getEmail());
            user.setActivationCode("activate");
            user.setActive(true);
            userRepository.save(user);
            return true;
        } else return false;
    }

    public void editProfile(String name, String phoneNumber, String email) throws IOException {
        User userFromDb = userRepository.findByEmail(email);
        if (userFromDb == null) throw new UsernameNotFoundException("Email " + email + " is not found");
        userFromDb.setName(name);
        userFromDb.setPhoneNumber(phoneNumber);
        log.info("Edit user: " + userFromDb.getEmail());
        userRepository.save(userFromDb);
    }

    public List<User> list() {
        return userRepository.findAll();
    }

    public void banUser(Long id) {
        User user = userRepository.findById(id).orElse(null);
        if (user != null) {
            if (user.isActive()) {
                user.setActive(false);
                log.info("Ban user with id = {}; email: {}", user.getId(), user.getEmail());
            } else {
                user.setActive(true);
                log.info("Unban user with id = {}; email: {}", user.getId(), user.getEmail());
            }
        }
        userRepository.save(user);
    }

    public void changeUserRoles(User user, Map<String, String> form) {
        Set<String> roles = Arrays.stream(Role.values())
                .map(Role::name)
                .collect(Collectors.toSet());
        user.getRoles().clear();
        for (String key : form.keySet()) {
            if (roles.contains(key)) {
                user.getRoles().add(Role.valueOf(key));
            }
        }
        userRepository.save(user);
    }

    public User getUserByPrincipal(Principal principal) {
        User defaultUser = new User();
        if (principal == null) return defaultUser;
        String name = principal.getName();
        User user = userRepository.findByEmail(name);
        if (user == null) return defaultUser;
        return user;
    }

}