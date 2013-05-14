/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author PC
 */
public class AjaxCommand{
    
    public String execute(HttpServletRequest request, String data) throws CommandException {
        if(request.getSession().getAttribute("loggedIn")==null){
            data = "Session timed out. Please log in again";
        }
        
        return data;
    }
    
}
