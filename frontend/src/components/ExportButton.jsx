import React from 'react';
import { triggerExport } from '../services/api';
import { endpoints } from '../services/api';

const exportEndpoints = {
  empleadosDepartamento: endpoints.exportEmpleados,
  salarioPromedio: endpoints.exportSalario,
  distribucionGenero: endpoints.exportGenero,
  riesgoLaboral: endpoints.exportRiesgo,
  presupuestoEmpleados: endpoints.exportPresupuesto,
  licenciasTipo: endpoints.exportLicencias
};

const ExportButton = ({ reportType, year }) => {
  const handleExport = async () => {
    const endpoint = exportEndpoints[reportType];
    const params = reportType === 'licenciasTipo' ? { year } : {};

    try {
      const downloadUrl = await triggerExport(endpoint, params);

      if (downloadUrl) {
        // Usa window.open para evitar problemas con descarga bloqueada por políticas de navegador
        window.open(downloadUrl, '_blank');
      } else {
        alert('No se pudo obtener la URL de descarga.');
      }
    } catch (error) {
      console.error('Error al exportar:', error);
      alert('Ocurrió un error al intentar exportar el reporte.');
    }
  };

  return (
    <button 
      onClick={handleExport}
      className="export-button"
    >
      Exportar Reporte (ZIP)
    </button>
  );
};

export default ExportButton;
