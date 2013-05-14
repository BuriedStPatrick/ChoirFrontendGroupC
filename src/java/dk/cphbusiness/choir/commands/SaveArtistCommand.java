/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.ArtistDetail;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import dk.cphbusiness.choir.contract.eto.NoSuchArtistException;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Nicklas Hemmingsen
 */
public class SaveArtistCommand extends TargetCommand{
    private static final DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    public SaveArtistCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();

        long id = Long.parseLong(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String country = request.getParameter("country");
        String wikiURL = request.getParameter("wikiURL");

        Date dateOfDeath = null;
        try {
            dateOfDeath = format.parse(request.getParameter("dateOfDeath"));
        } catch (ParseException pe) {
            dateOfDeath = new Date();
        }
        Date dateOfBirth = null;
        try {
            dateOfBirth = format.parse(request.getParameter("dateOfBirth"));
        } catch (ParseException pe) {
            dateOfBirth = new Date();
        }
        
        ArtistDetail artist = new ArtistDetail(id, firstName, lastName, 
                wikiURL, country, dateOfBirth, dateOfDeath);
        try {
            manager.saveArtist((MemberAuthentication) request.getSession().getAttribute("loggedIn"), artist);
        } catch (NoSuchArtistException ex) {
            throw new CommandException("Saving failed", ex.getMessage(), ex);
        } catch (AuthenticationException ex) {
            Logger.getLogger(SaveArtistCommand.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return super.execute(request);
    }
}