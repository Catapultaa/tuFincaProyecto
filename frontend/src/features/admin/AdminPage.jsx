import { useState } from "react";
import { motion, AnimatePresence } from "framer-motion";
import AdminHeader from "./components/AdminHeader";
import PropiedadForm from "../admin/forms/PropiedadForm";
import Navbar from "./components/AdminNavBar";
import ListaPropiedades from "../admin/propiedades/ListaPropiedades";
import ListaMensajes from "../admin/msjs/ListaMensajes";
import PerfilAdminPage from "./perfil/PerfilAdminPage";
import AdminForm from "./perfil/components/AdminForm";
import { useGlobalContext } from "../../context/GlobalContext";

const AdminPage = () => {
  const [selectedSection, setSelectedSection] = useState("propiedades");
  const { administradores, setAdministradores } = useGlobalContext();

  const handleSectionChange = (section) => {
    setSelectedSection(section);
  };
  
  const onSectionChange = (section) => {
    setSelectedSection(section);
  };

  const handleRegister = async (nuevoAdmin) => {
    try {
      // Verificar si el usuario ya existe
      if (administradores.some(a => a.usuario === nuevoAdmin.usuario)) {
        return { success: false, error: "El usuario ya existe" };
      }

      // Crear nuevo admin
      const nuevoId = Math.max(...administradores.map(a => a.id), 0) + 1;
      const adminRegistrado = {
        id: nuevoId,
        ...nuevoAdmin,
        contraseña: nuevoAdmin.contrasena
      };

      setAdministradores(prev => [...prev, adminRegistrado]);
      return { success: true };
    } catch (error) {
      return { success: false, error: "Error al registrar" };
    }
  };

  return (
    <main className="min-h-screen flex flex-col bg-gray-200 font-oswald text-lg">
      {/* Header */}
      <AdminHeader onSectionChange={onSectionChange} />

      {/* Contenedor flexible para Navbar + Contenido */}
      <div className="flex flex-grow">
        {/* Barra lateral */}
        <Navbar onSectionChange={handleSectionChange} />
        {/* Contenido principal dinámico con animación */}
        <div className="flex flex-col flex-grow p-6 pb-16 sm:pb-6">
          <AnimatePresence mode="wait">
            {/* Maneja la animación de cambios */}
            {selectedSection === "+propiedad" && (
              <motion.section
                key="propiedades"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4 }}
              >
                <TituloSeccion titulo={"Agrega Una Propiedad"} />
                <PropiedadForm />
              </motion.section>
            )}
            {selectedSection === "propiedades" && (
              <motion.section
                key="misPropiedades"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4 }}
              >
                <TituloSeccion titulo={"Listado de Propiedades"} />
                <ListaPropiedades/>
              </motion.section>
            )}
            {selectedSection === "mensajes" && (
              <motion.section
                key="mensajes"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4 }}
              >
                <TituloSeccion titulo={"Mensajes / Comentarios"} />
                <ListaMensajes /> 
              </motion.section>
            )}
            {selectedSection === "Mi Perfil" && (
              <motion.section
                key="miPerfil"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4 }}
              >
                <TituloSeccion titulo={"Mi perfil"} />
                <PerfilAdminPage/>   
              </motion.section>
            )}
            {selectedSection === "+admin" && (
              <motion.section
                key="agregarAdmin"
                initial={{ opacity: 0, y: 20 }}
                animate={{ opacity: 1, y: 0 }}
                exit={{ opacity: 0, y: -20 }}
                transition={{ duration: 0.4 }}
              >
                <TituloSeccion titulo={"Agregar Nuevo Administrador"} />
                  <AdminForm
                    onRegister={handleRegister}
                    administradores={administradores}
                    mostrarRegistro={true}
                  />
              </motion.section>
            )}
          </AnimatePresence>
        </div>
      </div>
    </main>
  );
};

const TituloSeccion = ({ titulo }) => (
  <div className="bg-gray-100 w-full h-auto min-h-fit py-4 px-6 rounded-lg flex flex-col sm:flex-row justify-between items-center">
    <h1 className="text-lg sm:text-xl md:text-2xl text-gray-800">{titulo}</h1>
  </div>
);

export default AdminPage;