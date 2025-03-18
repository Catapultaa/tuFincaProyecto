package com.gestion.tufinca.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Entity
@Builder
//Indica que la clave primaria es compuesta y está definida en la clase PropiedadEtiquetaId.
@IdClass(PropiedadEtiquetaId.class)
@Table(name = "propiedadetiqueta")
public class PropiedadEtiquetaModel {
    @Id
    @ManyToOne
    @JoinColumn(name = "propiedad_id")
    @JsonIgnore
    private PropiedadModel propiedad;

    @Id
    @ManyToOne
    @JoinColumn(name = "etiqueta_id")
    @JsonIgnore
    private EtiquetaModel etiqueta;
}
