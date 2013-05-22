package dk.cphbusiness.test;

import dk.cphbusiness.choir.commands.Command;
import dk.cphbusiness.choir.commands.SaveMemberCommand;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.view.ChoirFactory;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;
import static org.hamcrest.CoreMatchers.*;

/**
 *
 * @author PC
 */
public class CommandTest {
    
    public CommandTest() {
        System.out.println("Constructed");
    }
    
    @BeforeClass
    public static void setUpClass() {
        System.out.println("Before Class");
    }
    
    @AfterClass
    public static void tearDownClass() {
        System.out.println("After Class");
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
    public void testOneThing() throws Exception{
        fail();
    }
    
    @Test
    public void testAnotherThing() throws Exception{
        int a = 78;
        int b = 22;
        int c = a + b;
        
        assertTrue(c == 100);
        assertThat(c, is(100));
    }
    
    @Test
    public void testSaveMemberSuccess() throws Exception{
        RequestMock request = new RequestMock();
        request
                .setParameter("firstName", "Patrick")
                .setParameter("lastName", "Christensen")
                .setParameter("title", "ADM")
                .setParameter("street", "Karin Nellemoses Vej 1");
        Command saveCommand = new SaveMemberCommand("mobileMemberSide.jsp");
//        ChoirFactory.getInstance().setManager(new DummyChoirManager());
        
        String target = saveCommand.execute(request);
        assertThat(target, is("mobileMemberSide.jsp"));
        assertThat(request.getSession().getAttribute("loggedIn"), is(MemberDetail.class));
        MemberDetail member = (MemberDetail)request.getSession().getAttribute("loggedIn");
        
    }
}