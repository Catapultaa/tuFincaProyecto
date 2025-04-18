package com.gestion.tufinca.persistence;

import com.gestion.tufinca.models.MediaModel;

import java.util.List;
import java.util.Optional;

public interface IMediaDAO {

    List<MediaModel> getMedia();

    Optional<MediaModel> getMediaById(Integer id);

    Optional<MediaModel> getMediaByUrl(String url);

    List<MediaModel> getMediasByPropiedadId(Integer propiedadId);

    MediaModel saveMedia(MediaModel media);

    void deleteMediaById(Integer id);
}