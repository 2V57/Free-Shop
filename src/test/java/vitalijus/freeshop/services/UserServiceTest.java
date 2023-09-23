package vitalijus.freeshop.services;

import org.hamcrest.CoreMatchers;
import org.junit.Assert;
import org.junit.jupiter.api.Test;
import org.junit.runner.RunWith;
import org.mockito.ArgumentMatcher;
import org.mockito.Mockito;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.boot.test.mock.mockito.MockBean;
import org.springframework.mail.MailSender;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.test.context.junit4.SpringRunner;
import vitalijus.freeshop.entities.Role;
import vitalijus.freeshop.entities.User;
import vitalijus.freeshop.repositories.UserRepository;

import java.util.Collection;

import static org.junit.jupiter.api.Assertions.*;

@RunWith(SpringRunner.class)
@SpringBootTest
class UserServiceTest {
    @Autowired
    private UserService userService;

    @MockBean
    private UserRepository userRepository;

    @MockBean
    private MailSender mailSender;

    @MockBean
    private PasswordEncoder passwordEncoder;

    @Test
    void testCreateUser() {

        User user = new User();

        boolean isUserCreated = userService.createUser(user);

        Assert.assertTrue(isUserCreated);
        Assert.assertNotNull(user.getActivationCode());
    }

    @Test
    public void testCreatedUserFail() {
        User user = new User();
        user.setEmail("a@a.lt");

        Mockito.doReturn(new User())
                .when(userRepository)
                .findByEmail("a@a.lt");

        boolean isUserCreated = userService.createUser(user);

        Assert.assertFalse(isUserCreated);
    }
}