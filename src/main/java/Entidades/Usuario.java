package Entidades;

import java.time.LocalDate; // Importar para FechaAlta

public class Usuario {
    private int idUsuario;
    private String nombreUsuario;
    private String password;
    private TipoUsuario tipoUsuario; // Objeto de composición
    private LocalDate fechaAlta;
    private boolean estado; 

    public Usuario() {
        // Constructor vacío
    }

    public Usuario(int idUsuario, String nombreUsuario, String password, TipoUsuario tipoUsuario, LocalDate fechaAlta, boolean estado) {
        this.idUsuario = idUsuario;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.tipoUsuario = tipoUsuario;
        this.fechaAlta = fechaAlta;
        this.estado = estado;
    }

    // Getters
    public int getIdUsuario() {
        return idUsuario;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public TipoUsuario getTipoUsuario() {
        return tipoUsuario;
    }

    public LocalDate getFechaAlta() {
        return fechaAlta;
    }

    public boolean isEstado() { // Método getter para 'estado'
        return estado;
    }

    // Setters
    public void setIdUsuario(int idUsuario) {
        this.idUsuario = idUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void setTipoUsuario(TipoUsuario tipoUsuario) {
        this.tipoUsuario = tipoUsuario;
    }

    public void setFechaAlta(LocalDate fechaAlta) {
        this.fechaAlta = fechaAlta;
    }

    public void setEstado(boolean estado) { // Método setter para 'estado'
        this.estado = estado;
    }

    @Override
    public String toString() {
        return "Usuario{" +
               "idUsuario=" + idUsuario +
               ", nombreUsuario='" + nombreUsuario + '\'' +
               ", tipoUsuario=" + (tipoUsuario != null ? tipoUsuario.getDescripcion() : "N/A") +
               ", estado=" + estado +
               '}';
    }
}