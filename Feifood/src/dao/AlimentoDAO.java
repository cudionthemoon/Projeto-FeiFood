package dao;

import model.Alimento;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class AlimentoDAO {

    public List<Alimento> listarTodos() {
        List<Alimento> lista = new ArrayList<>();

        String sql = "SELECT id, nome, tipo, preco FROM tbalimento ORDER BY tipo, nome";

        try (Connection con = Conexao.getConexao();
             PreparedStatement ps = con.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {
                Alimento a = new Alimento();
                a.setId(rs.getInt("id"));
                a.setNome(rs.getString("nome"));
                a.setTipo(rs.getString("tipo"));
                a.setPreco(rs.getDouble("preco"));
                lista.add(a);
            }

        } catch (SQLException e) {
            e.printStackTrace();  
        }

        return lista;
    }

    public List<Alimento> listarPorTipo(String tipo) {
        List<Alimento> lista = new ArrayList<>();

        String sql = "SELECT id, nome, tipo, preco FROM tbalimento "
                   + "WHERE tipo = ? ORDER BY nome";

        try (Connection con = Conexao.getConexao();
             PreparedStatement ps = con.prepareStatement(sql)) {

            ps.setString(1, tipo);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    Alimento a = new Alimento();
                    a.setId(rs.getInt("id"));
                    a.setNome(rs.getString("nome"));
                    a.setTipo(rs.getString("tipo"));
                    a.setPreco(rs.getDouble("preco"));
                    lista.add(a);
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }
}
