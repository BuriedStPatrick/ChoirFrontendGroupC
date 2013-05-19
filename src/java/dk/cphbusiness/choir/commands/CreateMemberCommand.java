/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;
import dk.cphbusiness.choir.commands.TargetCommand;
import dk.cphbusiness.choir.commands.CommandException;
import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.view.ChoirFactory;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Patrick
 */
public class CreateMemberCommand extends TargetCommand{

    public CreateMemberCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        request.setAttribute("roles", manager.listRoles());
        request.setAttribute("voices", manager.listVoices());
        request.setAttribute("member", new MemberDetail());
        request.setAttribute("createmember", true);
        return super.execute(request);
    }
    
    
    
}
