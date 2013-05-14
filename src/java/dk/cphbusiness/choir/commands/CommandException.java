/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package dk.cphbusiness.choir.commands;

/**
 *
 * @author Kasper
 */
public class CommandException extends Exception {
     private String errorTarget;

  public CommandException(String errorTarget, String message, Throwable cause)
  {
    super(message, cause);
    this.errorTarget = errorTarget;
  }

  public String getErrorTarget()
  {
    return errorTarget;
  }
}
