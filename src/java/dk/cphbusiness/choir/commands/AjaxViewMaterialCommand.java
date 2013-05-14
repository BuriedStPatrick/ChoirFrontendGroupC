package dk.cphbusiness.choir.commands;

import com.google.gson.Gson;
import dk.cphbusiness.choir.contract.dto.MaterialDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMaterialException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author PC
 */
public class AjaxViewMaterialCommand extends AjaxCommand{

    @Override
    public String execute(HttpServletRequest request, String data) throws CommandException {
        MaterialDetail material = null;
        try {
            material = ChoirFactory.getInstance().getManager().findMaterial(Long.parseLong(request.getParameter("id")));
            int id = Integer.parseInt(request.getParameter("id"));
            Gson json = new Gson();
            data = json.toJson(material);
            request.setAttribute("material", data);
            
        } catch (NoSuchMaterialException ex) {
            Logger.getLogger(AjaxViewMaterialCommand.class.getName()).log(Level.SEVERE, null, ex);
        }
        return super.execute(request, data);
    }
    
    
}
