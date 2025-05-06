import React from 'react';

const YearFilter = ({ year, onYearChange }) => {
  const currentYear = new Date().getFullYear();

  const handleChange = (e) => {
    const selectedYear = parseInt(e.target.value, 10);
    if (!isNaN(selectedYear)) {
      onYearChange(selectedYear);
    }
  };

  return (
    <div className="year-filter">
      <label htmlFor="year-select">Seleccionar Año:</label>
      <select id="year-select" value={year} onChange={handleChange}>
        {/* Puedes ajustar el rango de años según tu base de datos */}
        {[...Array(5)].map((_, index) => {
          const y = currentYear - index;
          return (
            <option key={y} value={y}>
              {y}
            </option>
          );
        })}
      </select>
    </div>
  );
};

export default YearFilter;
