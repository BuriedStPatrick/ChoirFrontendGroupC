
/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MaterialDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchMaterialException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Nicklas Hemmingsen
 */
public class EditMaterialCommand extends TargetCommand{

    public EditMaterialCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        request.setAttribute("music", manager.listMusic());
        request.setAttribute("voices", manager.listVoices());
        try {
            MaterialDetail material = manager.findMaterial(id);
            request.setAttribute("material",material); 
        } catch (NoSuchMaterialException nsme) {
            Logger.getLogger(ListMaterialsCommand.class.getName()).log(Level.SEVERE, null, nsme);
            throw new CommandException(
            "Edit Material Command",
            nsme.getMessage()+" id: "+nsme.getId(), nsme);
        }  
        return super.execute(request);
    }
 
}