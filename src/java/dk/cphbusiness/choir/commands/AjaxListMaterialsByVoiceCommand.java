/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import com.google.gson.Gson;
import dk.cphbusiness.choir.contract.dto.MaterialSummary;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Patrick
 */
public class AjaxListMaterialsByVoiceCommand extends AjaxCommand{
    
    @Override
    public String execute(HttpServletRequest request, String data) throws CommandException {
        ArrayList<MaterialSummary> materials = new ArrayList<MaterialSummary>(ChoirFactory.getInstance().getManager().listMaterialsByVoices(Integer.parseInt(request.getParameter("voiceCode"))));
        Gson json = new Gson();
        data = json.toJson(materials);
        request.setAttribute("material", data);
        
        return super.execute(request, data);
    }
}
