/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

import javax.servlet.http.HttpServletRequest;

/**
 *
 * @author Kasper
 */
public interface Command {
    String execute(HttpServletRequest request)throws CommandException;
}
