package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Aluno;

public class AlunoDAO {

    private final Connection conexao;

    public AlunoDAO() throws SQLException {
        this.conexao = new Conexao().getConnection(); 
    }

   
    public boolean consultar(Aluno aluno) throws SQLException {
        String sql = "SELECT 1 FROM tbaluno WHERE usuario = ? AND senha = ?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, aluno.getUsuario());
            ps.setString(2, aluno.getSenha());
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next(); 
            }
        }
    }

    

    
    public boolean existeUsuario(String usuario) throws SQLException {
        String sql = "SELECT 1 FROM tbaluno WHERE usuario = ?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, usuario);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    
    public int inserir(String nome, String usuario, String senha) throws SQLException {
        String sql = "INSERT INTO tbaluno (nome, usuario, senha) VALUES (?,?,?) RETURNING id";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, nome);
            ps.setString(2, usuario);
            ps.setString(3, senha);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("id");
                throw new SQLException("Sem ID retornado.");
            }
        }
    }
}
