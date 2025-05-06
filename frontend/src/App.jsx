import React, { useState, useEffect } from 'react';
import ReportSelector from './components/ReportSelector';
import DataVisualization from './components/DataVisualization';
import ExportButton from './components/ExportButton';
import YearFilter from './components/YearFilter';
import { getReportData, endpoints } from './services/api';

function App() {
  const [selectedReport, setSelectedReport] = useState('empleadosDepartamento');
  const [data, setData] = useState([]);
  const [year, setYear] = useState(new Date().getFullYear());
  const [loading, setLoading] = useState(false);

  useEffect(() => {
    const fetchData = async () => {
      setLoading(true);
      const endpoint = endpoints[selectedReport];
      const params = selectedReport === 'licenciasTipo' ? { year } : {};
      
      const result = await getReportData(endpoint, params);
      setData(result);
      setLoading(false);
    };

    fetchData();
  }, [selectedReport, year]);

  return (
    <div className="app-container">
      <h1>Reportes Hospitalarios</h1>
      
      <ReportSelector 
        selectedReport={selectedReport}
        onSelect={setSelectedReport}
      />

      {selectedReport === 'licenciasTipo' && (
        <YearFilter 
          year={year}
          onYearChange={setYear}
        />
      )}

      <ExportButton 
        reportType={selectedReport}
        year={year}
      />

      {loading ? (
        <div className="loading">Cargando datos...</div>
      ) : (
        <DataVisualization 
          data={data}
          reportType={selectedReport}
        />
      )}
    </div>
  );
}

export default App;