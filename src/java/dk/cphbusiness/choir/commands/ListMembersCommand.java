/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.view.ChoirFactory;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Kasper
 */
public class ListMembersCommand extends TargetCommand{

    public ListMembersCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        request.setAttribute("members",manager.listMembers());
        request.setAttribute("roles", manager.listRoles());
        request.setAttribute("voices", manager.listVoices());
        return super.execute(request);
    }
    
    
    
}
