package com.gestion.tufinca.models;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.gestion.tufinca.models.enums.Tipo;
import jakarta.persistence.Entity;
import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@Entity
@Table(name = "media")
public class MediaModel {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer id;

    @Column(nullable = false)
    private String url;

    @Enumerated(EnumType.STRING)
    @Column(nullable = false)
    private Tipo tipo;

    @ManyToOne
    @JoinColumn(name = "propiedad_id", foreignKey = @ForeignKey(name = "fk_media_propiedad"))
    @JsonIgnore
    private PropiedadModel propiedad;
}
