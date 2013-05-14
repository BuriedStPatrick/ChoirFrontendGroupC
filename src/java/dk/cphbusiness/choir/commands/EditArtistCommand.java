/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.ArtistDetail;
import dk.cphbusiness.choir.contract.eto.NoSuchArtistException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Nicklas Hemmingsen
 */
public class EditArtistCommand extends TargetCommand{
    
        public EditArtistCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        long id = Long.parseLong(request.getParameter("id"));
        try {
            ArtistDetail artist = manager.findArtist(id);
            request.setAttribute("artist",artist); 
        } catch (NoSuchArtistException nsme) {
            Logger.getLogger(EditArtistCommand.class.getName()).log(Level.SEVERE, null, nsme);
            throw new CommandException(
            "Edit Member Command",
            nsme.getMessage()+" id: "+nsme.getId(), nsme);
        }  
        return super.execute(request);
    }
}
