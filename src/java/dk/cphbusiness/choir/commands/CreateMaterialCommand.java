/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;
import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MaterialDetail;
import dk.cphbusiness.choir.view.ChoirFactory;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Patrick
 */
public class CreateMaterialCommand extends TargetCommand{

    public CreateMaterialCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        request.setAttribute("music", manager.listMusic());
        request.setAttribute("voices", manager.listVoices());
        request.setAttribute("material", new MaterialDetail());
        request.setAttribute("type", request.getParameter("type"));
        return super.execute(request);
    }
    
    
    
}
