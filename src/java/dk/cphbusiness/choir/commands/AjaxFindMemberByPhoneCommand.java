package dk.cphbusiness.choir.commands;
import dk.cphbusiness.services.KrackClient2;
import dk.cphbusiness.services.KrakClient;
import javax.servlet.http.HttpServletRequest;
import org.codehaus.jettison.json.JSONObject;

public class AjaxFindMemberByPhoneCommand extends AjaxCommand{
    
    private KrackClient2 kClient;

    @Override
    public String execute(HttpServletRequest request, String data) throws CommandException {
        kClient = new KrackClient2();
        kClient.setUsernamePassword("NorthseaChoir", "test");
        String number = request.getParameter("nr");
        JSONObject pdata = kClient.find(JSONObject.class, number);
        data = pdata.toString();

        return super.execute(request, data);
    }
    
}
