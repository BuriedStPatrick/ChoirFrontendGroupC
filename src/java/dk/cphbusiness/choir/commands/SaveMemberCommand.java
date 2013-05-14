package dk.cphbusiness.choir.commands;

import dk.cphbusiness.choir.contract.ChoirManager;
import dk.cphbusiness.choir.contract.dto.MemberAuthentication;
import dk.cphbusiness.choir.contract.dto.MemberDetail;
import dk.cphbusiness.choir.contract.eto.AuthenticationException;
import dk.cphbusiness.choir.contract.eto.NoSuchMemberException;
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
 * @author Patrick
 */
public class SaveMemberCommand extends TargetCommand {

    private static final DateFormat format = new SimpleDateFormat("yyyy-MM-dd");

    public SaveMemberCommand(String target) {
        super(target);
    }

    @Override
    public String execute(HttpServletRequest request) throws CommandException {
        ChoirManager manager = ChoirFactory.getInstance().getManager();
    if(request.getParameter("id") != null){
        
        long id = Long.parseLong(request.getParameter("id"));
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String title = request.getParameter("title");
        String street = request.getParameter("street");
        String zipCode = request.getParameter("zipCode");
        String city = request.getParameter("city");
        String phone = request.getParameter("phone");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        int voiceCode = Integer.parseInt(request.getParameter("voiceCode"));
        String[] roleCodes = null;
        if(request.getParameterValues("roleCodes")==null){
            roleCodes = new String[0];
        }else{
            roleCodes = request.getParameterValues("roleCodes"); 
        }
        Date dateOfBirth = null;
        try {
            dateOfBirth = format.parse(request.getParameter("dateOfBirth"));
        } catch (ParseException pe) {
            dateOfBirth = new Date();
        }
        MemberDetail member = new MemberDetail(id, firstName, lastName, title, false, false, dateOfBirth, voiceCode, roleCodes, street, zipCode, city, email, phone);
        try {
            System.out.println(id);
            System.out.println(firstName);
            System.out.println(lastName);
            System.out.println(title);
            System.out.println(dateOfBirth);
            System.out.println(voiceCode);
            System.out.println(roleCodes);
            System.out.println(street);
            System.out.println(zipCode);
            System.out.println(city);
            System.out.println(email);
            System.out.println(phone);
            manager.saveMember((MemberAuthentication) request.getSession().getAttribute("loggedIn"), member);
        } catch (NoSuchMemberException ex) {
            throw new CommandException("Saving failed", ex.getMessage(), ex);
        } catch (AuthenticationException ex) {
            Logger.getLogger(SaveMemberCommand.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
        request.setAttribute("members",manager.listMembers());
        request.setAttribute("roles", manager.listRoles());
        request.setAttribute("voices", manager.listVoices());
        return super.execute(request);
    }
}
