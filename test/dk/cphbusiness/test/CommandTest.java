/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.test;

import dk.cphbusiness.choir.commands.Command;
import dk.cphbusiness.choir.commands.SaveMemberCommand;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.lang.annotation.Target;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

/**
 *
 * @author
 * kasper
 */
public class CommandTest {
    
    public CommandTest() {
        System.out.println("Constructed");
    }
    
    @BeforeClass
    public static void setUpClass() {
        System.out.println("Before class");
    }
    
    @AfterClass
    public static void tearDownClass() {
        System.out.println("After class");
    }
    
    @Before
    public void setUp() {
        System.out.println("Before test");
    }
    
    @After
    public void tearDown() {
        System.out.println("After test");
    }
    
    @Test
    public void testOneThing()throws Exception{
        System.out.println("Test one Thing");
        fail();
    }
    
    @Test
    public void testAnotherThing()throws Exception{
        System.out.println("Test one Thing");
        int a = 78;
        int b = 22;
        int c = a + b;
        assertTrue(c == 100);
    }
    
    @Test
    public void testSaveMemberSuccess()throws Exception{
        RequestMock request = new RequestMock();
        request.setParameter("firstName", "kasper")
               .setParameter("lastName", "karstensen");
        Command saveCommand = new SaveMemberCommand("main.jsp");
        String target = saveCommand.execute(request);
        assertThat(target, is("main.jsp"));
        assertThat(request.getSession().getAttribute("member"), is(MemberDetail.class));
        MemberDetail member = (MemberDetail)request.getSession().getAttribute("member");
        assertThat(member.getFirstName(), is("Kasper"));
    }
    // TODO add test methods here.
    // The methods must be annotated with annotation @Test. For example:
    //
    // @Test
    // public void hello() {}
}
