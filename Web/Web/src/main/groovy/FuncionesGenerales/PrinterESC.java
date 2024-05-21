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
public interface PrinterESC {

    public String initialize();

    public String chooseFont(int Options);

    public String cutter();

    public String feedBack(byte lines);
    
    public String cortar();

    public String feed(byte lines);

    public String alignLeft();

    public String alignCenter();

    public String alignRight();

    public String newLine();

    public String upperLine(boolean tipo);

    public String reverseColorMode(boolean enabled);

    public String doubleStrik(boolean enabled);

    public String doubleHeight(boolean enabled);

    public String doubleWide(boolean enabled);

    public String emphasized(boolean enabled);

    public String underLine(int Options);

    public String color(int Options);

    public String finit();

    public String addLineSeperator();

    public void addLines(int n);

    public void resetAll();

    public void setText(String s);

    public String finalCommandSet();

    public String getBarcodeEscPosCode(String codigo);
}
