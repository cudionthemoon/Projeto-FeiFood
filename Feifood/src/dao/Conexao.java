package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexao {

    
private static final String URL = "jdbc:postgresql://localhost:5432/Alunos";
 
    private static final String USER = "postgres";          
    private static final String PASSWORD = "Lunaloka2020"; 

    public static Connection getConexao() {
        Connection con = null;

        try {
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
        }

        return con;
    }
    
    
    public Connection getConnection() {
    return getConexao();
}

    public static Connection conectar() {
    return getConexao();
}
}
