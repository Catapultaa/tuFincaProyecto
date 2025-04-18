const TagFilterSection = ({ title, etiquetas, selectedTags, onTagClick }) => {
  if (!etiquetas || etiquetas.length === 0) return null;

  return (
    <div className="mt-6">
      <h3 className="text-lg font-medium text-gray-800 mb-3">{title}</h3>
      <div className="flex flex-wrap gap-3">
        {etiquetas.map(etiqueta => {
          const isSelected = selectedTags.includes(etiqueta.nombre);
          return (
            <button
              key={etiqueta.id}
              type="button"
              onClick={() => onTagClick(etiqueta.nombre)}
              className={`inline-flex items-center border text-sm font-medium px-4 py-2 rounded-full shadow-sm transition-colors cursor-pointer ${
                isSelected
                  ? 'bg-blue-100 border-blue-300 text-blue-800'
                  : 'bg-white border-gray-200 text-gray-700 hover:bg-blue-50 hover:border-blue-300'
              }`}
            >
              {etiqueta.nombre}
              <span className={`ml-2 text-xs font-semibold px-2 py-0.5 rounded-full ${
                isSelected
                  ? 'bg-blue-200 text-blue-900'
                  : 'bg-blue-100 text-blue-800'
              }`}>
                {etiqueta.count}
              </span>
              {isSelected && (
                <span className="ml-1 text-blue-600">✓</span>
              )}
            </button>
          );
        })}
      </div>
    </div>
  );
};

export default TagFilterSection;