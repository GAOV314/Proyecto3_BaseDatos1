import axios from 'axios';

const api = axios.create({
  baseURL: 'http://localhost:8000/test', // Puerto default de FastAPI
});

export const endpoints = {
  empleadosDepartamento: '/api/empleados-departamento',
  salarioPromedio: '/api/salario-promedio',
  distribucionGenero: '/api/distribucion-genero',
  riesgoLaboral: '/api/empleados-riesgo-laboral',
  presupuestoEmpleados: '/api/presupuesto-vs-empleados',
  licenciasTipo: '/api/licencias-por-tipo',
  
  // Endpoints de exportación
  exportEmpleados: '/api/exportar/empleados-departamento',
  exportSalario: '/api/exportar/salario-promedio',
  exportGenero: '/api/exportar/distribucion-genero',
  exportRiesgo: '/api/exportar/empleados-riesgo-laboral',
  exportPresupuesto: '/api/exportar/presupuesto-vs-empleados',
  exportLicencias: '/api/exportar/licencias-por-tipo'
};

export const getReportData = async (endpoint, params = {}) => {
  try {
    const response = await api.get(endpoint, { params });
    return response.data.data; // Acceder a la propiedad data
  } catch (error) {
    console.error('Error fetching data:', error);
    return [];
  }
};

export const triggerExport = async (endpoint, params = {}) => {
  try {
    const response = await api.get(endpoint, { params });
    return response.data.download_url;
  } catch (error) {
    console.error('Error exporting data:', error);
    return null;
  }
};