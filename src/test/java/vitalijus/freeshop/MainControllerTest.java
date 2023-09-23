package vitalijus.freeshop;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithUserDetails;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.web.servlet.MockMvc;
import vitalijus.freeshop.controller.ProductController;

import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.*;

@RunWith(SpringRunner.class)
@SpringBootTest
@AutoConfigureMockMvc
@WithUserDetails("a@a.lt")
public class MainControllerTest {
    @Autowired
    private MockMvc mockMvc;

    @Autowired
    private ProductController productController;

    @Test
    public void testHomePageIsWordFreeShop() throws Exception {
        this.mockMvc.perform(get("/")).andDo(print()).andExpect(status().isOk())
                .andExpect(content().string(containsString("Free Shop")));
    }

    @Test
    public void testMainPage() throws Exception{
        this.mockMvc.perform(get("/"))
                .andDo(print())
                .andExpect(authenticated())
                .andExpect(content().string(containsString("Vitalijus")));
    }
}
