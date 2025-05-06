import React from 'react';

const reports = [
  { id: 1, name: 'Empleados por Departamento', endpoint: 'empleadosDepartamento' },
  { id: 2, name: 'Salario Promedio', endpoint: 'salarioPromedio' },
  { id: 3, name: 'Distribución de Género', endpoint: 'distribucionGenero' },
  { id: 4, name: 'Riesgo Laboral', endpoint: 'riesgoLaboral' },
  { id: 5, name: 'Presupuesto vs Empleados', endpoint: 'presupuestoEmpleados' },
  { id: 6, name: 'Licencias por Tipo', endpoint: 'licenciasTipo' }
];

const ReportSelector = ({ selectedReport, onSelect }) => {
  return (
    <div className="report-selector">
      <h2>Seleccione un Reporte:</h2>
      <select 
        value={selectedReport} 
        onChange={(e) => onSelect(e.target.value)}
        className="report-dropdown"
      >
        {reports.map((report) => (
          <option key={report.id} value={report.endpoint}>
            {report.name}
          </option>
        ))}
      </select>
    </div>
  );
};

export default ReportSelector;