
package com.emergentes.modelo;

import java.util.ArrayList;
import  java.util.Iterator;

public class ControlVacunas {
    private ArrayList<Vacunas> lista;
    
        public ControlVacunas()
    {
        lista = new ArrayList<Vacunas>();
    }

    public ArrayList<Vacunas> getLista() {
        return lista;
    }

    public void setLista(ArrayList<Vacunas> lista) {
        this.lista = lista;
    }
 public void insertarVacunado(Vacunas item)
    {
        lista.add(item);
    }
    public void modificarVacunado(int pos, Vacunas item)
    {
        lista.set(pos, item);
    }
    public void eliminarVacunado(int pos)
    {
        lista.remove(pos);
    }
    public int obtieneId()
    {
        int idaux = 0;
        
        for (Vacunas item : lista) {
            idaux = item.getId();            
        }
        return idaux + 1;
    }
    public int ubicarVacunado(int id)
    {
        int pos = -1;
        Iterator<Vacunas> it = lista.iterator();
        
        while (it.hasNext()){
            ++pos;
            Vacunas aux = it.next();
            
            if (aux.getId() == id){
                break;
            }
        }
        return pos;
    }            
}
