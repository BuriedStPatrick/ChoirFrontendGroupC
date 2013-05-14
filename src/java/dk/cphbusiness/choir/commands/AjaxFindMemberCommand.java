package dk.cphbusiness.choir.commands;

import com.google.gson.Gson;
import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
import dk.cphbusiness.choir.view.AjaxServlet;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

public class AjaxFindMemberCommand extends AjaxCommand{

    @Override
    public String execute(HttpServletRequest request, String data) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        Gson json = new Gson();
        try {
            data = json.toJson(manager.findMember((Integer.parseInt(request.getParameter("id")))));
        } catch (NoSuchMemberException ex) {
            Logger.getLogger(AjaxServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        return super.execute(request, data);
    }
    
    
}
