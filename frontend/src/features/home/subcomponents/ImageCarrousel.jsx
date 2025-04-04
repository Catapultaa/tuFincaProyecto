import { useState } from 'react';

const ImageCarrousel = ({ propiedad, fullSize = false, className = '' }) => {
  const [currentImageIndex, setCurrentImageIndex] = useState(0);
  const images = propiedad.imagenes || ["https://via.placeholder.com/300x200"];
  const hasMultipleImages = images.length > 1;

  const nextImage = (e) => {
    e?.stopPropagation();
    setCurrentImageIndex((prev) => (prev + 1) % images.length);
  };

  const prevImage = (e) => {
    e?.stopPropagation();
    setCurrentImageIndex((prev) => (prev - 1 + images.length) % images.length);
  };

  const goToImage = (e, index) => {
    e?.stopPropagation();
    setCurrentImageIndex(index);
  };

  // Estilos condicionales
  const containerClass = fullSize 
    ? `relative w-full ${className}`
    : 'relative h-48 overflow-hidden group';

  const imageClass = fullSize
    ? 'w-full h-full object-cover'
    : 'w-full h-full object-cover transition-transform duration-500 group-hover:scale-105';

  return (
    <div className={containerClass}>
      {/* Imagen principal */}
      <img
        src={images[currentImageIndex]}
        alt={propiedad.titulo || "Propiedad"}
        className={imageClass}
        onError={(e) => {
          e.target.src = "https://via.placeholder.com/800x500";
        }}
      />

      {/* Contador de fotos */}
      <div className="absolute bottom-4 right-4 bg-black/60 text-white px-2 py-1 rounded-md text-sm font-medium">
        {currentImageIndex + 1}/{images.length}
      </div>

      {/* Flechas de navegación (mejoradas) */}
      {hasMultipleImages && (
        <>
          <button
            onClick={prevImage}
            className={`absolute left-4 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-md ${
              fullSize ? 'opacity-100' : 'opacity-0 group-hover:opacity-100'
            } transition-opacity`}
            aria-label="Imagen anterior"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M15 19l-7-7 7-7" />
            </svg>
          </button>
          
          <button
            onClick={nextImage}
            className={`absolute right-4 top-1/2 -translate-y-1/2 bg-white/80 hover:bg-white p-2 rounded-full shadow-md ${
              fullSize ? 'opacity-100' : 'opacity-0 group-hover:opacity-100'
            } transition-opacity`}
            aria-label="Siguiente imagen"
          >
            <svg className="w-5 h-5" fill="none" stroke="currentColor" viewBox="0 0 24 24">
              <path strokeLinecap="round" strokeLinejoin="round" strokeWidth={2} d="M9 5l7 7-7 7" />
            </svg>
          </button>
        </>
      )}

      {/* Puntos de navegación (mejorados) */}
      {hasMultipleImages && (
        <div className="absolute bottom-4 left-0 right-0 flex justify-center gap-2">
          {images.map((_, index) => (
            <button
              key={index}
              onClick={(e) => goToImage(e, index)}
              className={`w-2 h-2 rounded-full transition-all ${
                index === currentImageIndex 
                  ? 'bg-white w-4' 
                  : 'bg-white/50 hover:bg-white/70'
              }`}
              aria-label={`Ir a la imagen ${index + 1}`}
            />
          ))}
        </div>
      )}
    </div>
  );
};

export default ImageCarrousel;