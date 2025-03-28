import { useState } from "react";
import TituloForm from "./TituloForm";
import UbicacionForm from "./UbicacionForm";
import EtiquetasEstadoForm from "./EtiquetaEstadoForm";
import MultimediaForm from "./MultiMediaForm";
import ResumenForm from "./ResumenForm";

const steps = [
  "Título y Descripción",
  "Ubicación",
  "Etiquetas",
  "Imagenes y Videos",
  "Resumen",
];

const PropiedadForm = () => {
  const [activeStep, setActiveStep] = useState(0);
  const [propiedadData, setPropiedadData] = useState({
    titulo: "",
    descripcion: "",
    codigo: "",
    ubicacion: "",
    estado: "",
    etiquetas: [],
    archivos: [],
  });

  const nextStep = () => {
    if (activeStep < steps.length - 1) setActiveStep(activeStep + 1);
  };

  const prevStep = () => {
    setActiveStep((prev) => Math.max(prev - 1, 0)); // Evita que baje de 0
  };

  const handleChange = (campo, valor) => {
    setPropiedadData((prev) => ({ ...prev, [campo]: valor }));
  };

  return (
    <div className="max-w-6xl mx-auto p-6">
      {/* Barra de navegación */}
      <div className="grid grid-cols-4 md:grid-cols-8 gap-2 bg-gray-100 p-4 rounded-lg shadow-md text-gray-600 text-sm">
        {steps.map((step, index) => (
          <button
            key={index}
            onClick={() => setActiveStep(index)}
            className={`py-2 px-3 rounded-md transition-all ${
              activeStep === index ? "bg-blue-800 font-semibold text-white" : "hover:bg-gray-200 font-medium cursor-pointer"
            }`}
          >
            {step}
          </button>
        ))}
      </div>

      {/* Contenido dinámico */}
      <div className="bg-white p-6 mt-4 rounded-lg shadow-md">
        {activeStep === 0 && <TituloForm propiedadData={propiedadData} handleChange={handleChange} />}
        {activeStep === 1 && <UbicacionForm propiedadData={propiedadData} handleChange={handleChange} />}
        {activeStep === 2 && <EtiquetasEstadoForm propiedadData={propiedadData} handleChange={handleChange} />}
        {activeStep === 3 && <MultimediaForm propiedadData={propiedadData} handleChange={handleChange} />}
        {activeStep === 4 && (<ResumenForm propiedadData={propiedadData}/>)}

      <div className="flex justify-between mt-4">
        {/* Botón Anterior */}
        {activeStep > 0 && (
          <button
            onClick={prevStep}
            className="bg-gray-400 text-white px-6 py-3 rounded-md hover:bg-gray-500 cursor-pointer transition-all"
          >
            Anterior
          </button>
        )}

        {/* Botón Siguiente o Guardar */}
        {activeStep < 4 ? (
          <button
            onClick={nextStep}
            className="bg-blue-800 text-white px-6 py-3 rounded-md hover:bg-blue-400 cursor-pointer transition-all"
          >
            Siguiente
          </button>
        ) : (
          <button
            //onClick={} // Aquí llamas a la función para guardar los datos
            className="bg-green-600 text-white px-6 py-3 rounded-md hover:bg-green-500 cursor-pointer transition-all"
          >
            Guardar Propiedad
          </button>
          )}
        </div>
      </div>
    </div>
  );
};

export default PropiedadForm;
