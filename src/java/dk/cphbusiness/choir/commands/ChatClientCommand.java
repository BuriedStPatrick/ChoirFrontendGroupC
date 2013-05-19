/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author PC
 */
public class ChatClientCommand extends TargetCommand{

    public ChatClientCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        try {
            ChoirManager manager = ChoirFactory.getInstance().getManager();
            MemberAuthentication member = (MemberAuthentication)request.getSession().getAttribute("loggedIn");
            long id = member.getId();
            
            MemberDetail memberD = manager.findMember(id);
            String name = memberD.getFirstName() + " " + memberD.getLastName();
            request.setAttribute("name", name);
           
        } catch (NoSuchMemberException ex) {
            Logger.getLogger(ChatClientCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return super.execute(request); //To change body of generated methods, choose Tools | Templates.
    }
    
    
}
