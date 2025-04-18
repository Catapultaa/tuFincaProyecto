import {
  FaComments,
  FaPlus,
  FaRegUser,
} from "react-icons/fa";
import { FaUserPlus } from "react-icons/fa6";
import { BsHousesFill, BsHouseDoorFill } from "react-icons/bs";
import { useNavigate } from "react-router-dom";
import logo from '../../../assets/imgs/TuFincaLogo.jpeg';

const Navbar = ({ onSectionChange }) => {
  const navigate = useNavigate(); // Mover useNavigate aquí para usarlo en ambos componentes

  return (
    <>
      {/* Navbar lateral para pantallas grandes */}
      <aside className="hidden sm:flex w-64 min-h-screen bg-white shadow-md flex-col p-4">
        <NavContent onSectionChange={onSectionChange} navigate={navigate} />
      </aside>

      {/* Navbar inferior para pantallas pequeñas */}
      <nav className="sm:hidden fixed bottom-0 left-0 w-full bg-white shadow-md flex justify-around p-2 border-t z-10">
        <button
          className="flex flex-col items-center text-gray-700 hover:text-yellow-500"
          onClick={() => navigate('/')}
        >
          <BsHouseDoorFill className="text-xl" />
          <span className="text-xs">Inicio</span>
        </button>
        <button
          className="flex flex-col items-center text-gray-700 hover:text-yellow-500"
          onClick={() => onSectionChange("propiedades")}
        >
          <BsHousesFill className="text-xl" />
          <span className="text-xs">Propiedades</span>
        </button>
        <button
          className="flex flex-col items-center text-gray-700 hover:text-yellow-500"
          onClick={() => onSectionChange("mensajes")}
        >
          <FaComments className="text-xl" />
          <span className="text-xs">Comentarios</span>
        </button>
        <button
          className="flex flex-col items-center text-gray-700 hover:text-yellow-500"
          onClick={() => onSectionChange("+propiedad")}
        >
          <FaPlus className="text-xl" />
          <span className="text-xs">Agregar</span>
        </button>
        <button
          className="flex flex-col items-center text-gray-700 hover:text-yellow-500"
          onClick={() => onSectionChange("Registro")}
        >
          <FaUserPlus className="text-xl" />
          <span className="text-xs">Registrar Admin</span>
        </button>
      </nav>
    </>
  );
};

// Componente reutilizable para el menú de navegación
const NavContent = ({ onSectionChange, navigate }) => {
  const navItemClass = "flex items-center text-gray-700 cursor-pointer hover:text-emerald-600";
  
  return (
    <div className="flex flex-col h-full">
      {/* Logo y Título */}
      <img
        src={logo}
        alt="TuFincaLogo"
        className="w-24 h-24 sm:w-28 sm:h-28 md:w-32 md:h-32 lg:w-36 lg:h-36 object-contain mx-auto m-5"
      />

      {/* Botón de Inicio */}
      <button
        onClick={() => navigate('/')}
        className={`${navItemClass} mb-4 p-2 rounded-lg hover:bg-gray-100`}
      >
        <BsHouseDoorFill className="mr-3" /> Página Principal
      </button>

      {/* Sección Administración */}
      <h2 className="text-lg font-semibold text-gray-700 mb-2">
        Administración
      </h2>
      <nav className="flex flex-col space-y-4 mb-4">
        <button
          onClick={() => onSectionChange("propiedades")}
          className={navItemClass}
        >
          <BsHousesFill className="mr-3" /> Mis Propiedades
        </button>
        <button
          onClick={() => onSectionChange("mensajes")}
          className={navItemClass}
        >
          <FaComments className="mr-3" /> Comentarios
        </button>
        <button
          onClick={() => onSectionChange("+propiedad")}
          className={navItemClass}
        >
          <FaPlus className="mr-3" /> Agregar Propiedad
        </button>
      </nav>

      {/* Línea separadora */}
      <hr className="border-t border-gray-300 my-4" />
      {/* Sección Administrar Cuentas */}
      <h2 className="text-lg font-semibold text-gray-700 mb-2">
        Administrar La Cuenta
      </h2>
      <nav className="flex flex-col space-y-4 mb-4">
        <button
          onClick={() => onSectionChange("Mi Perfil")}
          className={navItemClass}
        >
          <FaRegUser className="mr-3" /> Mi Perfil
        </button>
      </nav>
      <nav className="flex flex-col space-y-4 mb-4">
        <button
          onClick={() => onSectionChange("Registro")}
          className={navItemClass}
        >
          <FaUserPlus className="mr-3" /> Registro Admin
        </button>
      </nav>
    </div>
  );
};

export default Navbar;