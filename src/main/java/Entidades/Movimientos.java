package Entidades;

import java.time.LocalDateTime; // Importar para FechaHora
import java.math.BigDecimal; // Importar para manejo preciso de dinero

public class Movimientos {
    private int idMovimiento;
    private LocalDateTime fechaHora;
    private String concepto; // Coincide con 'Concepto' en tu DDL actual (antes 'Referencia')
    private BigDecimal importe;
    private TiposMovimiento tipoMovimiento; // Objeto de composición
    private Cuentas cuentaOrigen; // Objeto de composición
    private Cuentas cuentaDestino; // Objeto de composición (puede ser null)

    public Movimientos() {
        // Constructor vacío
    }

    public Movimientos(int idMovimiento, LocalDateTime fechaHora, String concepto,
                      BigDecimal importe, TiposMovimiento tipoMovimiento,
                      Cuentas cuentaOrigen, Cuentas cuentaDestino) {
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

    public TiposMovimiento getTipoMovimiento() {
        return tipoMovimiento;
    }

    public Cuentas getCuentaOrigen() {
        return cuentaOrigen;
    }

    public Cuentas getCuentaDestino() {
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

    public void setTipoMovimiento(TiposMovimiento tipoMovimiento) {
        this.tipoMovimiento = tipoMovimiento;
    }

    public void setCuentaOrigen(Cuentas cuentaOrigen) {
        this.cuentaOrigen = cuentaOrigen;
    }

    public void setCuentaDestino(Cuentas cuentaDestino) {
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