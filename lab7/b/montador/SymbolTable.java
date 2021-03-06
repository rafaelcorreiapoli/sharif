package util;

import java.util.Hashtable;
import java.util.Map;

//Versão do aluno gerada em 01/2010
/**
 * Representação de uma tabela de símbolos.<br>
 * O símbolo é considerado igual independente da presença de letras minúsculas
 * ou maiúsculas diferentes em outras chamadas (<i>case insensitive</i>).
 *
 * @author RRocha
 * @version 04.10.2005
 * @version 28.01.2010 ( refatoramento - Tiago) : mudança da especificação dos métodos e classe. Introdução das restrições
 * 												  da implementação.
 */
public class SymbolTable {

    /**Map que guarda os símbolos.*/
    protected Map<String, String> symbolTable;

    /*
     * TODO Aula 08:
     *
     * A fazer:
     *
     * 1) Criar o construtor da classe
     * 2) Inicializar a tabela de símbolos ( symbolTable) nele, como sendo uma classe
     * 	HashTable (http://java.sun.com/javase/6/docs/api/java/util/Hashtable.html)
     * 3) Especificar que classe deverá ter na key e no valor ( ver como exemplo a InstructionTable ou PseudoTable)
     * 4) Implementar os métodos necessários.
     *
     *
     * */

    public SymbolTable() {
        symbolTable = new Hashtable<>();
    }
    /**
     * Verifica se um símbolo está na tabela.
     *
     * @param sym O símbolo a ser verificado.
     *
     * @return <b>true</b> se o símbolo estiver na tabela ou <b>false</b> caso contrário.
     *
     * @throws  NullPointerException se o símbolo passado for <b>null</b>.
     *
     */
    public boolean symbolInTable(String sym) {
        if (sym == null)
            throw new NullPointerException();

        return symbolTable.containsKey(sym.toUpperCase());
    }//

    /**
     * Define um valor para um símbolo.<br>
     * <b><font color="red">O símbolo já deve existir na tabela.</font><b>
     *
     * @param sym O símbolo.
     *
     * @param address O valor.
     *
     * @return <b>true</b> caso a definição tenha obtido sucesso, <b>false</b> caso contrário.
     *
     * @throws NullPointerException se acaso a key (sym) ou valor(address) forem nulos (<b>null</b>).
     */
    public boolean setSymbolValue(String sym, String address) {
        if (sym == null || address == null)
            throw new NullPointerException();

        if (symbolInTable(sym)) {
            symbolTable.put(sym.toUpperCase(), address);
            return true;
        }
        return false;
    }//

    /**
     * Verifica se um símbolo já foi definido (já há o endereço).
     *
     * @param sym O símbolo o qual se deseja saber se já está definido.
     *
     * @return <b>true</b> se o símbolo estiver definido, <b>false</b> caso contrário.
     *
     * @throws NullPointerException se a key (sym) for <b>null</b>.
     *
     */
    public boolean definedSymbol(String sym) {
        if (sym == null)
            throw new NullPointerException();
        return (getSymbolValue(sym) != null && !getSymbolValue(sym).isEmpty());
    }//

    /**
     * Insere um símbolo na tabela.
     *
     * @param sym O símbolo a ser inserido.
     *
     * @return Falso caso o símbolo já esteja definido, verdadeiro caso contrário.
     *
     * @throws NullPointerException se acaso a key (sym) for <b>null</b>
     *
     */
    public boolean insertSymbol(String sym) {
        if  (sym == null)
            throw new NullPointerException();

        if (definedSymbol(sym))
            return false;

        symbolTable.put(sym, "");
        return true;
    }

    /**
     * Obtêm o valor definido para um símbolo.
     *
     * @param sym O símbolo o qual se deseja saber o valor.
     *
     * @return O valor do símbolo.
     *
     * @throws NullPointerException se acaso a key (sym) for <b>null</b>
     *
     */
    public String getSymbolValue(String sym) {
        if (sym == null)
            throw new NullPointerException();

        return symbolTable.get(sym.toUpperCase());
    }//m
}//class
