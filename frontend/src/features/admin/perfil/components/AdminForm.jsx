import { useState } from "react";
import { motion } from "framer-motion";
import { X } from "lucide-react";
import ConfirmarIdentidad from "./ConfirmarIdentidad";

const AdminForm = ({ onRegister, administradores }) => {
  const [nuevoAdmin, setNuevoAdmin] = useState({
    nombre: "",
    usuario: "",
    correo: "",
    contrasena: ""
  });
  const [error, setError] = useState("");
  const [errorCorreo, setErrorCorreo] = useState("");
  const [mostrarConfirmacion, setMostrarConfirmacion] = useState(false);
  const [registroPendiente, setRegistroPendiente] = useState(false);
  const [registroExitoso, setRegistroExitoso] = useState(false);

  const isValidEmail = (email) => {
    return /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email);
  };

  const handleChangeCorreo = (e) => {
    const valor = e.target.value;
    setNuevoAdmin({...nuevoAdmin, correo: valor});
    
    if (valor && !isValidEmail(valor)) {
      setErrorCorreo("Ingresa un correo válido (ejemplo@dominio.com)");
    } else {
      setErrorCorreo("");
    }
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    setError("");
    
    if (!nuevoAdmin.nombre || !nuevoAdmin.usuario || !nuevoAdmin.correo || !nuevoAdmin.contrasena) {
      setError("Por favor completa todos los campos");
      return;
    }

    if (!isValidEmail(nuevoAdmin.correo)) {
      setErrorCorreo("Ingresa un correo válido");
      return;
    }

    if (administradores.some(a => a.usuario === nuevoAdmin.usuario)) {
      setError("Este nombre de usuario ya está en uso");
      return;
    }

    if (administradores.some(a => a.correo === nuevoAdmin.correo)) {
      setError("Este correo electrónico ya está registrado");
      return;
    }

    if (administradores.length > 0) {
      setRegistroPendiente(true);
      setMostrarConfirmacion(true);
      return;
    }

    await registrarAdmin();
  };

  const registrarAdmin = async () => {
    try {
      const result = await onRegister(nuevoAdmin);
      if (result && result.success) {
        setRegistroExitoso(true);
        setNuevoAdmin({
          nombre: "",
          usuario: "",
          correo: "",
          contrasena: ""
        });
        setError("");
        return true;
      } else {
        setError(result?.error || "Error al registrar");
        return false;
      }
    } catch (error) {
      setError("Error al procesar el registro");
      return false;
    }
  };

  const confirmarRegistro = async (password) => {
    try {
      const adminVerificador = administradores.find(a => a.contraseña === password);
      if (!adminVerificador) {
        return "Contraseña de verificación incorrecta";
      }

      if (registroPendiente) {
        const exito = await registrarAdmin();
        if (exito) {
          setMostrarConfirmacion(false);
          setRegistroPendiente(false);
          return null;
        }
        return "Error al registrar el administrador";
      }
      
      return "No hay registro pendiente";
    } catch (error) {
      return "Error al procesar el registro";
    }
  };

  if (registroExitoso) {
    return (
      <div className="max-w-md mx-auto p-6 m-10 bg-green-50 text-green-700 rounded-xl shadow-lg text-center">
        <p className="text-lg font-medium">¡Administrador registrado exitosamente!</p>
        <button
          onClick={() => setRegistroExitoso(false)}
          className="mt-4 bg-green-600 text-white px-4 py-2 rounded-lg hover:bg-green-700 transition"
        >
          Registrar otro administrador
        </button>
      </div>
    );
  }

  return (
    <div className="max-w-md mx-auto p-6 m-10 bg-white rounded-xl shadow-lg relative">
      {mostrarConfirmacion && (
        <div className="fixed inset-0 flex items-center justify-center bg-black/60 backdrop-blur-md z-50 p-4">
          <motion.div
            initial={{ opacity: 0, scale: 0.9 }}
            animate={{ opacity: 1, scale: 1 }}
            exit={{ opacity: 0, scale: 0.9 }}
            transition={{ duration: 0.3, ease: "easeOut" }}
            className="relative bg-white p-6 rounded-2xl shadow-2xl max-w-sm w-full"
          >
            <button
              onClick={() => {
                setMostrarConfirmacion(false);
                setRegistroPendiente(false);
                setError("");
              }}
              className="absolute top-3 right-3 text-gray-600 hover:text-gray-900 transition"
            >
              <X size={24} />
            </button>
            <ConfirmarIdentidad 
              onVerify={confirmarRegistro}
              onCancel={() => {
                setMostrarConfirmacion(false);
                setRegistroPendiente(false);
                setError("");
              }}
            />
          </motion.div>
        </div>
      )}

      {error && (
        <div className="mb-4 px-4 py-3 bg-red-50 text-red-600 rounded-lg animate-fadeIn">
          <p className="text-center">{error}</p>
        </div>
      )}

      <form onSubmit={handleSubmit} className="space-y-4">
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nombre completo</label>
          <input
            type="text"
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
            value={nuevoAdmin.nombre}
            onChange={(e) => setNuevoAdmin({...nuevoAdmin, nombre: e.target.value})}
            placeholder="Ej: Juan Pérez"
            required
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Nombre de usuario</label>
          <input
            type="text"
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
            value={nuevoAdmin.usuario}
            onChange={(e) => setNuevoAdmin({...nuevoAdmin, usuario: e.target.value})}
            placeholder="Ej: juanperez"
            required
          />
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Correo electrónico</label>
          <input
            type="email"
            className={`w-full px-4 py-2 border ${
              errorCorreo ? "border-red-300" : "border-gray-300"
            } rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition`}
            value={nuevoAdmin.correo}
            onChange={handleChangeCorreo}
            placeholder="Ej: juan@email.com"
            required
          />
          {errorCorreo && (
            <p className="text-red-500 text-sm mt-1 animate-fadeIn">{errorCorreo}</p>
          )}
        </div>
        <div>
          <label className="block text-sm font-medium text-gray-700 mb-1">Contraseña</label>
          <input
            type="password"
            className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
            value={nuevoAdmin.contrasena}
            onChange={(e) => setNuevoAdmin({...nuevoAdmin, contrasena: e.target.value})}
            placeholder="••••••••"
            required
            minLength="6"
          />
        </div>
        <button
          type="submit"
          disabled={!!errorCorreo || !nuevoAdmin.correo}
          className={`w-full py-2 rounded-lg font-medium shadow-md transition ${
            errorCorreo || !nuevoAdmin.correo
              ? "bg-gray-300 text-gray-500 cursor-not-allowed"
              : "bg-blue-600 text-white hover:bg-blue-700"
          }`}
        >
          Registrar Administrador
        </button>
      </form>
    </div>
  );
};

export default AdminForm;