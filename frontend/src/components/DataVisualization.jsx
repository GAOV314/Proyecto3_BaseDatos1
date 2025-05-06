import React from 'react';
import { BarChart, Bar, XAxis, YAxis, CartesianGrid, Tooltip, Legend } from 'recharts';

const DataVisualization = ({ data, reportType }) => {
  const renderContent = () => {
    if (!Array.isArray(data) || data.length === 0) return <p>No hay datos disponibles</p>;


    switch(reportType) {
      case 'distribucionGenero':
        return (
          <BarChart width={800} height={400} data={data}>
            <CartesianGrid strokeDasharray="3 3" />
            <XAxis dataKey="genero" />
            <YAxis />
            <Tooltip />
            <Legend />
            <Bar dataKey="cantidad" fill="#8884d8" />
          </BarChart>
        );

      case 'salarioPromedio':
        return (
          <table className="data-table">
            <thead>
              <tr>
                <th>Puesto</th>
                <th>Salario Promedio</th>
              </tr>
            </thead>
            <tbody>
              {data.map((item, index) => (
                <tr key={index}>
                  <td>{item.nombre_puesto}</td>
                  <td>${item.salario_promedio}</td>
                </tr>
              ))}
            </tbody>
          </table>
        );

      default:
        return (
          <pre>{JSON.stringify(data, null, 2)}</pre>
        );
    }
  };

  return (
    <div className="data-visualization">
      {renderContent()}
    </div>
  );
};

export default DataVisualization;