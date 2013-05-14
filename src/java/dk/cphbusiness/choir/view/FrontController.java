/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.view;

import dk.cphbusiness.choir.commands.Command;
import dk.cphbusiness.choir.commands.CommandException;
import dk.cphbusiness.choir.contract.ChoirManager;
import java.io.IOException;
import javax.ejb.EJB;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Kasper
 */
@WebServlet(name = "FrontController", urlPatterns = {"/FrontController"})
public class FrontController extends HttpServlet {

    @Override
    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        String commandKey = request.getParameter("command");
        Command command = ChoirFactory.getInstance().findCommand(commandKey);
        String target = null;
        try {
            target = command.execute(request);
        } catch (CommandException ce) {
            request.setAttribute("cause", ce.getCause());
            request.setAttribute("message", ce.getMessage());
            request.setAttribute("stackTrace", ce.getStackTrace());
            RequestDispatcher dispatcher = request.getRequestDispatcher(ce.getErrorTarget());
            dispatcher.forward(request, response);
        }
        request.getRequestDispatcher(target).forward(request, response);
    }
}
