/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Kasper
 */
public class LoginCommand extends TargetCommand {

    public LoginCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        try {
            manager.login(request.getParameter("userName"), request.getParameter("password"));
        } catch (AuthenticationException ex) {
            Logger.getLogger(LoginCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return super.execute(request); 
    }
    
    
}