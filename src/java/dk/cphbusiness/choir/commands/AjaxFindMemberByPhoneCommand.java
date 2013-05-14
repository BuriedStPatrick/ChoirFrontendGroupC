package dk.cphbusiness.choir.commands;
import dk.cphbusiness.services.KrakClient;
import javax.servlet.http.HttpServletRequest;
import org.codehaus.jettison.json.JSONObject;

public class AjaxFindMemberByPhoneCommand extends AjaxCommand{
    
    private KrakClient kClient;

    @Override
    public String execute(HttpServletRequest request, String data) throws CommandException {
        kClient = new KrakClient();
        String number = request.getParameter("nr");
        JSONObject pdata = kClient.find(JSONObject.class, number);
        data = pdata.toString();
        
        return super.execute(request, data);
    }
    
}
