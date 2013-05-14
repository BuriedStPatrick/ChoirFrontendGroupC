/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.view.ChoirFactory;
import javax.servlet.http.HttpServletRequest;

public class ListMaterialsCommand extends TargetCommand{
    
    public ListMaterialsCommand(String target){
        super(target);
    }
    
    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        request.setAttribute("materials", manager.listMaterials());
        request.setAttribute("voices", manager.listVoices());
        
        return super.execute(request);
    }
    
}
