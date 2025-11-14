package controller;

import dao.AlunoDAO;
import java.sql.SQLException;
import javax.swing.JOptionPane;
import model.Aluno;

public class ControllerLogin {

    // AGORA com parâmetros:
    public boolean loginAluno(String usuario, String senha) {
        Aluno a = new Aluno();
        a.setUsuario(usuario);
        a.setSenha(senha);

        try {
            AlunoDAO dao = new AlunoDAO();
            return dao.consultar(a);   // true se encontrou no banco
        } catch (SQLException e) {
            JOptionPane.showMessageDialog(null, "Erro de conexão: " + e.getMessage());
            return false;
        }
    }
}
