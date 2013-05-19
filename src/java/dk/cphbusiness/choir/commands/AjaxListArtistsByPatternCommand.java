/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.ArtistSummary;
import dk.cphbusiness.choir.view.AjaxServlet;
import dk.cphbusiness.choir.view.ChoirFactory;
import java.util.Collection;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;

public class AjaxListArtistsByPatternCommand extends AjaxCommand{
    
    private String singleArtist(ArtistSummary artist) {
        return "{ \"label\": \""+artist.getName()+"\", \"value\": \""+artist.getName()+"\", \"wikiURL\": \""+artist.getWikiUrl()+"\", \"id\": \""+artist.getId()+"\" }";
    }
    
    public String execute(HttpServletRequest request, String data) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
        String artists = null;
        try {
            Collection<ArtistSummary> summaries = manager.listArtistsByPattern(request.getParameter("term"));
            for (ArtistSummary summary : summaries) {
                if (artists == null) artists = "[ "+singleArtist(summary);
                else artists += ", "+singleArtist(summary);
            }
            artists += " ]";
            System.err.println("term: "+request.getParameter("term"));
            System.err.println("artists: "+artists);
        } catch (Exception ex) {
            Logger.getLogger(AjaxServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return super.execute(request, artists);
    }
    
}
