package com.gestion.tufinca.controllers.dto;

import com.gestion.tufinca.models.enums.TipoEtiqueta;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class EtiquetaDTO {
    private Integer id;
    private String nombre;
    private TipoEtiqueta tipoEtiqueta;
}
