/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package FuncionesGenerales;
/**
 *FuncionesGeneralesauthor PC
 */
public class PrinterEpson implements PrinterESC {

//------------------------
//-- PrinterOptions.java
//------------------------
    String commandSet = "";
    public PrinterEpson() {

    }

    public String initialize() {
        final byte[] Init = {27, 64};
        commandSet += new String(Init);
        return new String(Init);
    }

    @Override
    public String chooseFont(int Options) {
        String s = "";
        final byte[] ChooseFontA = {27,64,29,33,0};
        //final byte[] ChooseFontA = {27, 107, 49};
        final byte[] ChooseFontB = {27, 77, 1};
        
        final byte[] ChooseFontC = {27, 33, 1};
        final byte[] ChooseFontD = {27, 77, 49};

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

    public String alignLeft() {
        final byte[] AlignLeft = {27, 97, 48};
        String s = new String(AlignLeft);
        commandSet += s;
        return s;
    }

    public String alignCenter() {
        final byte[] AlignCenter = {27, 97, 49};
        String s = new String(AlignCenter);
        commandSet += s;
        return s;
    }

    public String alignRight() {
        final byte[] AlignRight = {27, 97, 50};
        String s = new String(AlignRight);
        commandSet += s;
        return s;
    }

    public String cutter() {
        final byte[] Feed = {27, 100, 0};
        String s = new String(Feed);
        commandSet += s;
        return s;
        
        
    }
    
    public String cortar() {
        
        String s = new String(new byte[]{27, 100, 2, 27, 105});
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
        final byte[] ReverseModeColorOn = {29, 66, 1};
        final byte[] ReverseModeColorOff = {29, 66, 0};
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
        //MODIFICADO
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

    public String doubleHeight(boolean enabled) {
        //MODIFICADO
        String s = "";
        
        final byte[] DoubleHeight = {29,33,1};
        final byte[] UnDoubleHeight = {29,33,0};

        if (enabled) {
            s = new String(DoubleHeight);
        } else {
            s = new String(UnDoubleHeight);
        }

        commandSet += s;
        return s;
    }

    public String emphasized(boolean enabled) {
        //MODIFICADO
        final byte[] EmphasizedOff = {27, 69,0};
        final byte[] EmphasizedOn = {27, 69,1};

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
        return "null";
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

    public String underLine(int Options) {
        final byte[] UnderLine2Dot = {27, 45, 50};
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

        final byte[] ColorRed = {27, 114, 49};
        final byte[] ColorBlack = {27, 114, 48};
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
        final byte[] FeedAndCut = {29, 'V', 66, 0};

        String s = new String(FeedAndCut);

        final byte[] DrawerKick = {27, 70, 0, 60, 120};

        s += new String(DrawerKick);

        commandSet += s;
        return s;
    }

    public String addLineSeperator() {
        String lineSpace = "----------------------------------------";
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

    public String getBarcodeEscPosCode(String codigo) {
        //MODIFICADO
        String s;
        //29,104,60,29,107,69,
        final byte[] barcode = {29,104,60,29,107,69,(byte) codigo.length()};
        s = new String(barcode);
        s += codigo;
        //commandSet += s;
        return s;
    }

}
