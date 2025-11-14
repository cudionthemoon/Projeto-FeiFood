package controller;

import dao.AlunoDAO;
import java.sql.SQLException;
import java.util.Arrays;

public class ControllerCadastro {

    private final AlunoDAO dao;

    public ControllerCadastro() {
        try {
            this.dao = new AlunoDAO(); // abre conexão via Conexao().getConnection()
        } catch (SQLException e) {
            throw new RuntimeException("Falha ao abrir conexão: " + e.getMessage(), e);
        }
    }

    public String validarCampos(String nome, String usuario, String senha) {
        if (nome == null || nome.trim().isEmpty())      return "Informe o nome.";
        if (usuario == null || usuario.trim().isEmpty())return "Informe o usuário.";
        if (usuario.trim().length() < 3)                return "Usuário mínimo de 3 caracteres.";
        if (senha == null || senha.isEmpty())           return "Informe a senha.";
        if (senha.length() < 4)                         return "Senha mínima de 4 caracteres.";
        return "OK";
    }

    public String cadastrarNoBanco(String nome, String usuario, char[] senhaChars) {
        String senha = new String(senhaChars);
        try {
            String v = validarCampos(nome, usuario, senha);
            if (!"OK".equals(v)) return v;

            if (dao.existeUsuario(usuario)) {
                return "Usuário já cadastrado";
            }

            int id = dao.inserir(nome.trim(), usuario.trim(), senha);
            return (id > 0) ? "OK" : "Falha ao cadastrar";
        } catch (SQLException e) {
            String msg = e.getMessage();
            if (msg != null && msg.toLowerCase().contains("unique")) {
                return "Usuário já cadastrado";
            }
            return "Erro de banco: " + e.getMessage();
        } finally {
            Arrays.fill(senhaChars, '\0'); 
        }
    }
}
