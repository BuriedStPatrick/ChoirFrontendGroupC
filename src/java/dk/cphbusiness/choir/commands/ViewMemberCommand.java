/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Nicklas Hemmingsen
 */
public class ViewMemberCommand extends TargetCommand{
    
    public ViewMemberCommand(String target){
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        try {
            MemberDetail member = manager.findMember(id);
            request.setAttribute("member",member);
        } catch (NoSuchMemberException nsme) {
            Logger.getLogger(ViewMemberCommand.class.getName()).log(Level.SEVERE, null, nsme);
            throw new CommandException(
            "View Member Command",
            nsme.getMessage()+" id: "+nsme.getId(), nsme);
        }
        return super.execute(request);
    }
  
}
