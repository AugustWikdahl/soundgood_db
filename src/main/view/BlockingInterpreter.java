package main.view;

import java.util.Scanner;
import main.controller.Controller;

/**
 * Reads and interprets user commands. This command interpreter is blocking, the user
 * interface does not react to user input while a command is being executed.
 */

public class BlockingInterpreter {
    private static final String PROMPT = "> ";
    private final Scanner console = new Scanner(System.in);
    private Controller ctrl;
    private boolean keepReceivingCmds = false;

    /**
     * Creates a new instance that will use the specified controller for all operations.
     * 
     * @param ctrl The controller used by this instance.
     */
    public BlockingInterpreter(Controller ctrl) {
        this.ctrl = ctrl;
    }

    /**
     * Stops the commend interpreter.
     */
    public void stop() {
        keepReceivingCmds = false;
    }

    /**
     * Interprets and performs user commands. This method will not return until the
     * UI has been stopped. The UI is stopped either when the user gives the
     * "quit" command, or when the method <code>stop()</code> is called.
     */
    public void handleCmds() {
        keepReceivingCmds = true;
        while (keepReceivingCmds) {
            try {
                CommandLine cmdLine = new CommandLine(readNextLine());
                switch (cmdLine.getCmd()) {
                    case HELP:
                        for (Command command : Command.values()) {
                            if (command == Command.ILLEGAL_COMMAND) {
                                continue;
                            }
                            System.out.println(command.toString().toLowerCase());
                        }
                        break;
                    case QUIT:
                        keepReceivingCmds = false;
                        break;
                    case LIST:
                        System.out.println(ctrl.getAvailableInstrumentsOfType(cmdLine.getParameter(0)));
                        break;
                    case TERMINATE:
                        ctrl.terminateRental(cmdLine.getParameter(0));
                        break;
                    case RENT:
                        String studentId = cmdLine.getParameter(0);
                        String instrumentId = cmdLine.getParameter(1);

                        boolean isAvailable = ctrl.isIntrumentAvailable(instrumentId);
                        boolean succesfulRental = ctrl.rentInstrument(studentId, instrumentId);

                        if(!isAvailable) {
                            System.out.println("The specified instrument is not available!");
                            break;
                        }

                        if(succesfulRental) {
                            System.out.println("Rental was succesful!");
                        } else {
                            System.out.println("Student already has 2 ongoing rentals, cant rent more than 2 instruments!");
                        }
                        break;
                    default:
                        System.out.println("illegal command");
                }
            } catch (Exception e) {
                System.out.println("Operation failed");
                System.out.println(e.getMessage());
                e.printStackTrace();
            }
        }
    }

    private String readNextLine() {
        System.out.print(PROMPT);
        return console.nextLine();
    }
}
