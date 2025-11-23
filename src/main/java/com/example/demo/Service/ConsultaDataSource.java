package com.example.demo.Service;

import org.springframework.stereotype.Service;
import javax.sql.DataSource;
import java.sql.*;

@Service
public class ConsultaDataSource {

    private final DataSource dataSource;

    public ConsultaDataSource(DataSource dataSource) {
        this.dataSource = dataSource;
    }

    public void consultaManual() {
        final String query = "SELECT * FROM estudiante";

        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {
            while (rs.next()) {
                System.out.println(
                        "ID: " + rs.getInt("id") +
                                ", Nombre: " + rs.getString("nombre"));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // nuevoo
    public void mostrarEstudiantesEnConsola() {
        final String query = "SELECT * FROM estudiante";

        try (Connection conn = dataSource.getConnection();
                Statement stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery(query)) {

            System.out.println("=== REGISTROS DE LA TABLA ESTUDIANTE ===");

            while (rs.next()) {
                System.out.println("ID: " + rs.getInt("id"));
                System.out.println("Nombre: " + rs.getString("nombre"));
                System.out.println("Apellido: " + rs.getString("apellido"));
                System.out.println("Código: " + rs.getString("codigo"));
                    // contador++; // Eliminado la referencia a la variable contador
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}