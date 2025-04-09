import { useState } from "react";

const ConfirmarIdentidad = ({ onVerify, onCancel }) => {
  const [password, setPassword] = useState("");
  const [errorMessage, setErrorMessage] = useState("");

  const handleSubmit = (e) => {
    e.preventDefault();
    const error = onVerify(password);
    if (error) {
      setErrorMessage(error);
    }
  };

  return (
    <div className="text-center">
      <h2 className="text-xl font-semibold text-gray-800 mb-4">Confirmar identidad</h2>
      <p className="text-gray-600 mb-4">Ingresa tu contraseña para continuar.</p>
      <form onSubmit={handleSubmit} className="space-y-4">
        <input
          type="password"
          value={password}
          onChange={(e) => {
            setPassword(e.target.value);
            setErrorMessage("");
          }}
          className="w-full px-4 py-2 border border-gray-300 rounded-lg focus:ring-2 focus:ring-blue-500 focus:border-blue-500 transition"
          placeholder="Contraseña"
          required
        />
        {errorMessage && (
          <p className="text-red-500 text-sm animate-fadeIn">{errorMessage}</p>
        )}
        <div className="flex space-x-4">
          <button
            type="button"
            onClick={onCancel}
            className="flex-1 bg-gray-100 text-gray-800 py-2 rounded-lg hover:bg-gray-200 transition font-medium"
          >
            Cancelar
          </button>
          <button
            type="submit"
            className="flex-1 bg-blue-600 text-white py-2 rounded-lg hover:bg-blue-700 transition font-medium shadow-md"
          >
            Confirmar
          </button>
        </div>
      </form>
    </div>
  );
};

export default ConfirmarIdentidad;