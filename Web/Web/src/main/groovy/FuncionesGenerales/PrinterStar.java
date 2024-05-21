/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FuncionesGenerales;

/**
 *
 * @author PC
 */
public class PrinterStar implements PrinterESC {

//------------------------
//-- PrinterOptions.java
//------------------------
    String commandSet = "";

    public PrinterStar() {
        
    }

    public String initialize() {
        final byte[] Init = {27, 64};
        commandSet += new String(Init);
        return new String(Init);
    }

    public String chooseFont(int Options) {
        String s = "";
        final byte[] ChooseFontA = {27, 77, 0};
        final byte[] ChooseFontB = {27, 77, 1};
        final byte[] ChooseFontC = {27, 77, 48};
        final byte[] ChooseFontD = {27, 77, 49};
        final byte[] ChooseFontE = {27, 30,70,2};
        
        switch (Options) {
            case 1:
                s = new String(ChooseFontA);
                break;

            case 2:
                s = new String(ChooseFontB);
                break;
                
            case 3:
                s = new String(ChooseFontC);
                break;
                
            case 4:
                s = new String(ChooseFontD);
                break;
            case 5:
                s = new String(ChooseFontE);
                break;
                
            default:
                s = new String(ChooseFontB);
        }
        commandSet += s;
        return new String(s);
    }

    public String feedBack(byte lines) {
        final byte[] Feed = {27, 101, lines};
        String s = new String(Feed);
        commandSet += s;
        return s;
    }

    public String feed(byte lines) {
        final byte[] Feed = {27, 100, lines};
        String s = new String(Feed);
        commandSet += s;
        return s;
    }

    public String cutter() {
        final byte[] Feed = {27, 100, 0};
        String s = new String(Feed);
        commandSet += s;
        return s;
    }

    public String alignLeft() {
        final byte[] AlignLeft = {27, 29, 97, 0};
        String s = new String(AlignLeft);
        commandSet += s;
        return s;
    }

    public String alignCenter() {
        final byte[] AlignCenter = {27, 29, 97, 1};

        String s = new String(AlignCenter);
        commandSet += s;
        return s;
    }
    
     public String cortar() {
        
        String s = new String(new byte[]{27, 100, 2, 27, 105});
        commandSet += s;
        return s;
    }

    public String alignRight() {
        final byte[] AlignRight = {27, 29, 97, 2};
        String s = new String(AlignRight);
        commandSet += s;
        return s;
    }

    public void addLines(int n) {
        for (int i = 1; i <= n; i++) {
            this.newLine();
        }
    }

    public String newLine() {
        final byte[] LF = {10};
        String s = new String(LF);
        commandSet += s;
        return s;
    }

    public String reverseColorMode(boolean enabled) {
        final byte[] ReverseModeColorOn = {27, 52};
        final byte[] ReverseModeColorOff = {27, 53};

        String s = "";
        if (enabled) {
            s = new String(ReverseModeColorOn);
        } else {
            s = new String(ReverseModeColorOff);
        }

        commandSet += s;

        return s;
    }

    public String doubleStrik(boolean enabled) {
        final byte[] DoubleStrikeModeOn = {27, 71, 1};
        final byte[] DoubleStrikeModeOff = {27, 71, 0};

        String s = "";
        if (enabled) {
            s = new String(DoubleStrikeModeOn);
        } else {
            s = new String(DoubleStrikeModeOff);
        }

        commandSet += s;
        return s;
    }

    public String doubleWide(boolean enabled) {
        String s = "";

        final byte[] DoubleHeight = {27, 87, 1};
        final byte[] UnDoubleHeight = {27, 87, 0};

        if (enabled) {
            s = new String(DoubleHeight);
        } else {
            s = new String(UnDoubleHeight);
        }
        commandSet += s;
        return s;
    }

    public String doubleHeight(boolean enabled) {
        String s = "";

        final byte[] DoubleHeight = {27, 104, 1};
        final byte[] UnDoubleHeight = {27, 104, 0};

        if (enabled) {
            s = new String(DoubleHeight);
        } else {
            s = new String(UnDoubleHeight);
        }
        commandSet += s;
        return s;
    }

    public String emphasized(boolean enabled) {
        final byte[] EmphasizedOff = {27, 70};
        final byte[] EmphasizedOn = {27, 69};

        String s = "";
        if (enabled) {
            s = new String(EmphasizedOn);
        } else {
            s = new String(EmphasizedOff);
        }

        commandSet += s;
        return s;
    }

    public String upperLine(boolean tipo) {
        final byte[] upperline = {27, 95, 49};
        final byte[] noupperline = {27, 45, 48};

        String s = "";
        if (tipo) {
            s = new String(upperline);
        } else {
            s = new String(noupperline);
        }
        commandSet += s;
        return new String(s);
    }

    public String underLine(int Options) {
        final byte[] UnderLine2Dot = {27, 45, 49};
        final byte[] UnderLine1Dot = {27, 45, 49};
        final byte[] NoUnderLine = {27, 45, 48};

        String s = "";
        switch (Options) {
            case 0:
                s = new String(NoUnderLine);
                break;

            case 1:
                s = new String(UnderLine1Dot);
                break;

            default:
                s = new String(UnderLine2Dot);
        }
        commandSet += s;
        return new String(s);
    }

    public String color(int Options) {
        final byte[] ColorRed = {27, 30, 99, 1};
        final byte[] ColorBlack = {27, 30, 99, 0};
        String s = "";
        switch (Options) {
            case 0:
                s = new String(ColorBlack);
                break;

            case 1:
                s = new String(ColorRed);
                break;

            default:
                s = new String(ColorBlack);
        }

        commandSet += s;
        return s;
    }

    public String finit() {
        final byte[] FeedAndCut = {27, 100, 0};
        String s = new String(FeedAndCut);

        //Abrir la caja
        final byte[] DrawerKick = {27, 70, 0, 60, 120};
        s += new String(DrawerKick);

        commandSet += s;
        return s;
    }

    public String addLineSeperator() {
        String lineSpace = "------------------------------------------------";
        commandSet += lineSpace;
        return lineSpace;
    }

    public void resetAll() {
        commandSet = "";
    }

    public void setText(String s) {
        commandSet += s;
    }

    public String finalCommandSet() {
        return commandSet;
    }

    @Override
    public String getBarcodeEscPosCode(String codigo) {
        String s = "";
        s += new String(new byte[]{27, 98, 54, 50, 50, 70});
        s += codigo;
        s += new String(new byte[]{30});
        return s;
    }
}
