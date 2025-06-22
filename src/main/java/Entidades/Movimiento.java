package Entidades;

import java.time.LocalDateTime; // Importar para FechaHora
import java.math.BigDecimal; // Importar para manejo preciso de dinero

public class Movimiento {
    private int idMovimiento;
    private LocalDateTime fechaHora;
    private String concepto; // Coincide con 'Concepto' en tu DDL actual (antes 'Referencia')
    private BigDecimal importe;
    private TipoMovimiento tipoMovimiento; // Objeto de composición
    private Cuenta cuentaOrigen; // Objeto de composición
    private Cuenta cuentaDestino; // Objeto de composición (puede ser null)

    public Movimiento() {
        // Constructor vacío
    }

    public Movimiento(int idMovimiento, LocalDateTime fechaHora, String concepto,
                      BigDecimal importe, TipoMovimiento tipoMovimiento,
                      Cuenta cuentaOrigen, Cuenta cuentaDestino) {
        this.idMovimiento = idMovimiento;
        this.fechaHora = fechaHora;
        this.concepto = concepto;
        this.importe = importe;
        this.tipoMovimiento = tipoMovimiento;
        this.cuentaOrigen = cuentaOrigen;
        this.cuentaDestino = cuentaDestino;
    }

    // Getters
    public int getIdMovimiento() {
        return idMovimiento;
    }

    public LocalDateTime getFechaHora() {
        return fechaHora;
    }

    public String getConcepto() {
        return concepto;
    }

    public BigDecimal getImporte() {
        return importe;
    }

    public TipoMovimiento getTipoMovimiento() {
        return tipoMovimiento;
    }

    public Cuenta getCuentaOrigen() {
        return cuentaOrigen;
    }

    public Cuenta getCuentaDestino() {
        return cuentaDestino;
    }

    
    
    
    
    // Setters
    public void setIdMovimiento(int idMovimiento) {
        this.idMovimiento = idMovimiento;
    }

    public void setFechaHora(LocalDateTime fechaHora) {
        this.fechaHora = fechaHora;
    }

    public void setConcepto(String concepto) {
        this.concepto = concepto;
    }

    public void setImporte(BigDecimal importe) {
        this.importe = importe;
    }

    public void setTipoMovimiento(TipoMovimiento tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

    public void setCuentaOrigen(Cuenta cuentaOrigen) {
        this.cuentaOrigen = cuentaOrigen;
    }

    public void setCuentaDestino(Cuenta cuentaDestino) {
        this.cuentaDestino = cuentaDestino;
    }

    
    
    
    @Override
    public String toString() {
        return "Movimiento{" +
               "idMovimiento=" + idMovimiento +
               ", fechaHora=" + fechaHora +
               ", concepto='" + concepto + '\'' +
               ", importe=" + importe +
               ", tipoMovimiento=" + (tipoMovimiento != null ? tipoMovimiento.getDescripcion() : "N/A") +
               ", cuentaOrigen=" + (cuentaOrigen != null ? cuentaOrigen.getNumeroCuenta() : "N/A") +
               ", cuentaDestino=" + (cuentaDestino != null ? cuentaDestino.getNumeroCuenta() : "N/A") +
               '}';
    }
}