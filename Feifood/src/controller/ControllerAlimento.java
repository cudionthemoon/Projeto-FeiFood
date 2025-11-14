package Controller;

import dao.AlimentoDAO;
import Model.Alimento;
import java.util.List;

public class ControllerAlimento {

    private AlimentoDAO dao;

    public ControllerAlimento() {
        this.dao = new AlimentoDAO();
    }

    public List<Alimento> listarTodos() {
        return dao.listarTodos();
    }

    public List<Alimento> listarPorTipo(String tipo) {
        return dao.listarPorTipo(tipo);
    }
}
