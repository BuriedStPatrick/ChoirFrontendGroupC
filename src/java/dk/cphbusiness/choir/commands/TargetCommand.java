package dk.cphbusiness.choir.commands;

import javax.servlet.http.HttpServletRequest;

public class TargetCommand implements Command {
  private String target;

  public TargetCommand(String target) {
    this.target = target;
  }

  @Override
  public String execute(HttpServletRequest request) throws CommandException {
        if(request.getSession().getAttribute("loggedIn")== null)
        {
            target = "loginMobile.jsp";
        }
    return target;
  }
}
