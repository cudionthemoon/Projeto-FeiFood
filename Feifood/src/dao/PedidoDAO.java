package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Pedido;
import model.PedidoItem;
import model.Alimento;

public class PedidoDAO {

    private final Connection conn;

    public PedidoDAO() throws SQLException {
        conn = new Conexao().getConnection();
    }

    public int inserir(Pedido p) throws SQLException {
        String sql = "INSERT INTO tbpedido(total) VALUES (?) RETURNING id";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, p.getTotal());
            ResultSet rs = ps.executeQuery();
            if (rs.next()) return rs.getInt("id");
        }
        return -1;
    }

    public void atualizar(Pedido p) throws SQLException {
        String sql = "UPDATE tbpedido SET total = ? WHERE id = ?";
        try (PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setDouble(1, p.getTotal());
            ps.setInt(2, p.getId());
            ps.executeUpdate();
        }
    }

    public void excluir(int id) throws SQLException {
        String sqlItens = "DELETE FROM tbpedidoitem WHERE id_pedido = ?";
        String sqlPedido = "DELETE FROM tbpedido WHERE id = ?";

        try (PreparedStatement ps1 = conn.prepareStatement(sqlItens)) {
            ps1.setInt(1, id);
            ps1.executeUpdate();
        }
        try (PreparedStatement ps2 = conn.prepareStatement(sqlPedido)) {
            ps2.setInt(1, id);
            ps2.executeUpdate();
        }
    }

}
