package controller;

import dao.CategoriaDAO;
import java.sql.SQLException;
import java.util.List;
import model.Categoria;

public class ControllerCategoria {

    private final CategoriaDAO dao;

    public ControllerCategoria() {
        try {
            this.dao = new CategoriaDAO();
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao abrir conexão: " + e.getMessage(), e);
        }
    }

    public String validarNome(String nome) {
        if (nome == null || nome.trim().isEmpty()) return "Informe o nome da categoria.";
        if (nome.trim().length() < 3) return "Nome muito curto (mínimo 3).";
        if (nome.trim().length() > 60) return "Nome muito longo (máx. 60).";
        return "OK";
    }

    public String cadastrar(String nome) {
        String v = validarNome(nome);
        if (!"OK".equals(v)) return v;

        try {
            if (dao.existeNome(nome.trim())) return "Categoria já existe.";
            int id = dao.inserir(new Categoria(nome.trim()));
            return (id > 0) ? "OK" : "Falha ao cadastrar.";
        } catch (SQLException e) {
            String msg = e.getMessage();
            if (msg != null && msg.toLowerCase().contains("unique")) return "Categoria já existe.";
            return "Erro de banco: " + e.getMessage();
        }
    }

    public List<Categoria> listarTodas() {
        try {
            return dao.listarTodos();
        } catch (SQLException e) {
            throw new RuntimeException("Erro ao listar categorias: " + e.getMessage(), e);
        }
    }
}
