package com.gestion.tufinca.services;

import com.gestion.tufinca.models.MensajeModel;
import com.gestion.tufinca.models.enums.Gestion;

import java.util.List;
import java.util.Optional;

public interface IMensajeService {
    List<MensajeModel> getMensajes();

    Optional<MensajeModel> getMensajeById(Integer id);

    void saveMensaje(MensajeModel mensajes);

    void deleteMensajeById(Integer id);

    List<MensajeModel> getMensajesByGestion(Gestion gestion);

    List<MensajeModel> getMensajesByNombre(String nombreCliente);

}
