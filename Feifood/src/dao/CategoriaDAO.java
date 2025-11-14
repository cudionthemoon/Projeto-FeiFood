package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Categoria;

public class CategoriaDAO {

    private final Connection conexao;

    public CategoriaDAO() throws SQLException {
        this.conexao = new Conexao().getConnection(); 
    }

   
    public List<Categoria> listarTodos() throws SQLException {
        String sql = "SELECT id, nome FROM tbcategoria ORDER BY nome";
        List<Categoria> lista = new ArrayList<>();
        try (PreparedStatement ps = conexao.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                lista.add(new Categoria(rs.getInt("id"), rs.getString("nome")));
            }
        }
        return lista;
        
    }

    
    public boolean existeNome(String nome) throws SQLException {
        String sql = "SELECT 1 FROM tbcategoria WHERE nome = ?";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, nome);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        }
    }

    
    public int inserir(Categoria c) throws SQLException {
        String sql = "INSERT INTO tbcategoria (nome) VALUES (?) RETURNING id";
        try (PreparedStatement ps = conexao.prepareStatement(sql)) {
            ps.setString(1, c.getNome());
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) return rs.getInt("id");
                throw new SQLException("Falha ao inserir categoria: sem ID retornado.");
            }
        }
    }
}
