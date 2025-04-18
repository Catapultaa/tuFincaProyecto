package com.gestion.tufinca.controllers;

import com.gestion.tufinca.models.enums.TipoEtiqueta;
import com.gestion.tufinca.specifications.PropiedadSpecifications;
import com.gestion.tufinca.controllers.dto.PropiedadDTO;
import com.gestion.tufinca.models.EtiquetaModel;
import com.gestion.tufinca.models.MediaModel;
import com.gestion.tufinca.models.PropiedadModel;
import com.gestion.tufinca.models.enums.EstadoPropiedad;
import com.gestion.tufinca.services.IPropiedadService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.persistence.criteria.Predicate; // o javax.persistence.criteria.Predicate (depende de tu versión de Spring Boot/Jakarta)

import java.util.List;
import java.io.File;
import java.io.IOException;
import java.net.URI;
import java.net.URISyntaxException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Optional;


@RestController
@RequestMapping("/propiedades")
public class PropiedadController {

    private final IPropiedadService propiedadService;

    @Value("${upload.directory}")
    private String uploadDirectory;

    @Autowired
    public PropiedadController(IPropiedadService propiedadService) {
        this.propiedadService = propiedadService;
    }

    @GetMapping("/all")
    public ResponseEntity<List<PropiedadDTO>> getPropiedades() {
        List<PropiedadDTO> propiedadList = propiedadService.getPropiedades()
                .stream()
                .map(this::buildPropiedadDTO)
                .toList();
        return ResponseEntity.ok(propiedadList); // Siempre devuelve 200 OK con la lista
    }

    @GetMapping("/paginate")
    public ResponseEntity<Page<PropiedadDTO>> getPropiedadesFiltradas(
            @RequestParam(defaultValue = "0") int page,
            @RequestParam(defaultValue = "12") int size,
            @RequestParam(required = false) String nombre,
            @RequestParam(required = false) String codigo,
            @RequestParam(required = false) String ubicacion,
            @RequestParam(required = false) EstadoPropiedad estado,
            @RequestParam(required = false) List<String> etiquetas) { // Unificar parámetro

        Pageable pageable = PageRequest.of(page, size);

        Specification<PropiedadModel> spec = PropiedadSpecifications.conFiltros(
                nombre, codigo, ubicacion, estado, etiquetas
        );

        Page<PropiedadDTO> result = propiedadService.getPropiedadesPaginated(spec, pageable)
                .map(this::buildPropiedadDTO);

        return ResponseEntity.ok(result);
    }

    @GetMapping("/{id}")
    public ResponseEntity<Optional<PropiedadDTO>> getPropiedadById(@PathVariable Integer id){
        Optional<PropiedadModel> propiedadOptional = propiedadService.getPropiedadById(id);
        return createPropiedadResponseEntity(propiedadOptional);
    }

    @PostMapping(path = "/save")
    public ResponseEntity<PropiedadDTO> savePropiedad(@RequestBody PropiedadDTO propiedadDTO) throws URISyntaxException {
        if (propiedadDTO.getCodigo() == null) {
            return ResponseEntity.badRequest().build();
        }
        PropiedadModel nuevaPropiedad = propiedadService.savePropiedad(buildPropiedad(propiedadDTO));
        PropiedadDTO propiedadCreadaDTO = buildPropiedadDTO(nuevaPropiedad);
        return ResponseEntity.created(new URI("/propiedades/save")).body(propiedadCreadaDTO);
    }

    @PutMapping(path = "/update/{id}")
    public ResponseEntity<PropiedadDTO> updatePropiedadById(@RequestBody PropiedadDTO request, @PathVariable("id") Integer id) {
        Optional<PropiedadModel> propiedadOptional = propiedadService.getPropiedadById(id);
        if (propiedadOptional.isPresent()) {
            PropiedadModel propiedadToUpdate = propiedadOptional.get();
            PropiedadModel propiedadActualizada = propiedadService.savePropiedad(setPropiedadUpdateValues(request, propiedadToUpdate));
            PropiedadDTO propiedadActualizadaDTO = buildPropiedadDTO(propiedadActualizada);
            return ResponseEntity.ok(propiedadActualizadaDTO); // Devuelve la propiedad actualizada
        }
        return ResponseEntity.notFound().build();
    }

    @DeleteMapping(path="/delete/{id}")
    public ResponseEntity<?> deletePropiedadById(@PathVariable Integer id){
        if(id!=null){

            Optional<PropiedadModel> propiedadOpt = propiedadService.getPropiedadById(id);

            if (!propiedadOpt.isPresent()) {
                return ResponseEntity.badRequest().build();
            }

            PropiedadModel propiedad = propiedadOpt.get();

            // Borrar archivos físicos de las medias
            propiedad.getMedias().forEach(media -> {

                String fileName = media.getUrl().replace("/uploads/", "");
                Path filePath = Paths.get(uploadDirectory + File.separator + fileName);
                try {
                    boolean deleted = Files.deleteIfExists(filePath);
                } catch (IOException e) {
                    System.err.println("Error al eliminar archivo: " + e.getMessage());
                }
            });

            propiedadService.deletePropiedadById(id);
            return ResponseEntity.ok("Propiedad con id " + id + " eliminada exitosamente");
        }
        return ResponseEntity.badRequest().build();
    }

    @GetMapping("/codigo/{codigo}")
    public ResponseEntity<Optional<PropiedadDTO>> getPropiedadByCodigo(@PathVariable String codigo){
        Optional<PropiedadModel> propiedadOptional = propiedadService.getPropiedadByCodigo(codigo);
        return createPropiedadResponseEntity(propiedadOptional);
    }

    @GetMapping("/estado/{estado}")
    public ResponseEntity<List<PropiedadDTO>> getPropiedadesByEstado(@PathVariable EstadoPropiedad estado) {
        List<PropiedadDTO> propiedadList = propiedadService.getPropiedadesByEstado(estado)
                .stream()
                .map(this::buildPropiedadDTO)
                .toList();
        return ResponseEntity.ok(propiedadList); // Siempre devuelve 200 OK con la lista
    }

    @GetMapping("/ubicacion/{ubicacion}")
    public ResponseEntity<List<PropiedadDTO>> getPropiedadesByUbicacion(@PathVariable String ubicacion) {
        List<PropiedadDTO> propiedadList = propiedadService.getPropiedadesByUbicacion(ubicacion)
                .stream()
                .map(this::buildPropiedadDTO)
                .toList();
        return ResponseEntity.ok(propiedadList); // Siempre devuelve 200 OK con la lista
    }

    @GetMapping("/etiqueta/{id}")
    public ResponseEntity<List<PropiedadDTO>> getPropiedadesByEtiquetaId(@PathVariable Integer id) {
        List<PropiedadDTO> propiedadList = propiedadService.getPropiedadesByEtiquetaId(id)
                .stream()
                .map(this::buildPropiedadDTO)
                .toList();
        return ResponseEntity.ok(propiedadList); // Siempre devuelve 200 OK con la lista
    }

    @DeleteMapping(path="/delete/codigo/{codigo}")
    public ResponseEntity<?> deletePropiedadByCodigo(@PathVariable String codigo){
        if(codigo!=null){

            Optional<PropiedadModel> propiedadOpt = propiedadService.getPropiedadByCodigo(codigo);

            if (!propiedadOpt.isPresent()) {
                System.err.println("Propiedad no encontrada con codigo: " + codigo);
                return ResponseEntity.badRequest().build();
            }

            PropiedadModel propiedad = propiedadOpt.get();

            // Borrar archivos físicos de las medias
            propiedad.getMedias().forEach(media -> {

                String fileName = media.getUrl().replace("/uploads/", "");
                Path filePath = Paths.get(uploadDirectory + File.separator + fileName);
                try {
                    boolean deleted = Files.deleteIfExists(filePath);
                    if (deleted) {
                        System.out.println("Archivo eliminado: " + filePath);
                    } else {
                        System.out.println("Archivo no encontrado (ya eliminado?): " + filePath);
                    }
                } catch (IOException e) {
                    System.err.println("Error al eliminar archivo: " + filePath + " - " + e.getMessage());
                    // puedes loguear esto en vez de imprimir
                }
            });

            propiedadService.deletePropiedadByCodigo(codigo);
            return ResponseEntity.ok("Propiedad con codigo " + codigo + " eliminada exitosamente");
        }
        return ResponseEntity.badRequest().build();
    }

    public PropiedadModel setPropiedadUpdateValues(PropiedadDTO propiedadDTO, PropiedadModel propiedadToUpdate){
        propiedadToUpdate.setTitulo(propiedadDTO.getTitulo());
        propiedadToUpdate.setCodigo(propiedadDTO.getCodigo());
        propiedadToUpdate.setDescripcion(propiedadDTO.getDescripcion());
        propiedadToUpdate.setEstado(propiedadDTO.getEstado());
        propiedadToUpdate.setUbicacion(propiedadDTO.getUbicacion());
        propiedadToUpdate.setAreaTotal(propiedadDTO.getAreaTotal());
        propiedadToUpdate.setAdministrador(propiedadDTO.getAdministrador());
        propiedadToUpdate.setAreaConst(propiedadDTO.getAreaConst());

        // Actualizar medias
        propiedadToUpdate.getMedias().clear();
        for (MediaModel media : propiedadDTO.getMedias()) {
            media.setPropiedad(propiedadToUpdate); // Establecer la relación bidireccional
            propiedadToUpdate.getMedias().add(media);
        }

        // Manejar mensajes
        if (propiedadDTO.getMensajes() != null) {
            propiedadToUpdate.getMensajes().clear();
            propiedadToUpdate.getMensajes().addAll(propiedadDTO.getMensajes());
        }

        // Manejar etiquetas
        if (propiedadDTO.getEtiquetas() != null) {
            propiedadToUpdate.getEtiquetas().clear();
            propiedadToUpdate.getEtiquetas().addAll(propiedadDTO.getEtiquetas());
        }

        return propiedadToUpdate;
    }

    public PropiedadModel buildPropiedad(PropiedadDTO propiedadDTO){
        return PropiedadModel.builder()
                .id(propiedadDTO.getId())
                .titulo(propiedadDTO.getTitulo())
                .codigo(propiedadDTO.getCodigo())
                .descripcion(propiedadDTO.getDescripcion())
                .areaTotal(propiedadDTO.getAreaTotal())
                .areaConst(propiedadDTO.getAreaConst())
                .ubicacion(propiedadDTO.getUbicacion())
                .estado(propiedadDTO.getEstado())
                .administrador(propiedadDTO.getAdministrador())
                .etiquetas(propiedadDTO.getEtiquetas())
                .medias(propiedadDTO.getMedias())
                .mensajes(propiedadDTO.getMensajes())
                .build();
    }

    public ResponseEntity<Optional<PropiedadDTO>> createPropiedadResponseEntity(Optional<PropiedadModel> propiedadOptional){
        if(propiedadOptional.isPresent()){
            PropiedadModel propiedad = propiedadOptional.get();
            return ResponseEntity.ok(Optional.of(buildPropiedadDTO(propiedad)));
        }
        return ResponseEntity.notFound().build();
    }

    public PropiedadDTO buildPropiedadDTO(PropiedadModel propiedad) {
        return PropiedadDTO.builder()
                .id(propiedad.getId())
                .titulo(propiedad.getTitulo())
                .codigo(propiedad.getCodigo())
                .descripcion(propiedad.getDescripcion())
                .areaTotal(propiedad.getAreaTotal())
                .areaConst(propiedad.getAreaConst())
                .ubicacion(propiedad.getUbicacion())
                .estado(propiedad.getEstado())
                .administrador(propiedad.getAdministrador())
                .etiquetas(propiedad.getEtiquetas())
                .medias(propiedad.getMedias())
                .mensajes(propiedad.getMensajes())
                .build();
    }


}
