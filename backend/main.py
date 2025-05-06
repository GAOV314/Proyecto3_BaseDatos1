import shutil
from fastapi import FastAPI, HTTPException
from sqlalchemy import create_engine
import pandas as pd
import matplotlib.pyplot as plt
from fpdf import FPDF
import os

app = FastAPI()

# Configuración
DB_PARAMS = {
    'dbname': os.getenv('DB_NAME', 'HospitalPersonalDB'),
    'user': os.getenv('DB_USER', 'postgres'),
    'password': os.getenv('DB_PASSWORD', '12345'),
    'host': os.getenv('DB_HOST', 'localhost'),
    'port': os.getenv('DB_PORT', '5432')
}
def obtener_engine():
    return create_engine(f"postgresql+psycopg2://{DB_PARAMS['user']}:{DB_PARAMS['password']}@{DB_PARAMS['host']}:{DB_PARAMS['port']}/{DB_PARAMS['dbname']}")

EXPORT_FOLDER = 'reportes'
os.makedirs(EXPORT_FOLDER, exist_ok=True)



def exportar_reportes(df, nombre_base):
    ruta_base = os.path.join(EXPORT_FOLDER, nombre_base)
    csv_path = ruta_base + '.csv'
    excel_path = ruta_base + '.xlsx'
    pdf_path = ruta_base + '.pdf'

    df.to_csv(csv_path, index=False)
    df.to_excel(excel_path, index=False)

    pdf = FPDF(orientation='L', unit='mm', format='A4')
    pdf.add_page()
    pdf.set_font("Arial", size=10)
    col_width = pdf.w / (len(df.columns) + 1)

    for col in df.columns:
        pdf.cell(col_width, 10, str(col), border=1)
    pdf.ln()

    for _, row in df.iterrows():
        for item in row:
            pdf.cell(col_width, 10, str(item), border=1)
        pdf.ln()

    pdf.output(pdf_path)

    # Crear ZIP
    zip_path = os.path.join(EXPORT_FOLDER, f"{nombre_base}.zip")
    shutil.make_archive(os.path.splitext(zip_path)[0], 'zip', EXPORT_FOLDER, nombre_base)

    return zip_path

# ===============================
# ENDPOINTS PARA MOSTRAR REPORTES (JSON)
# ===============================

@app.get("/api/empleados-departamento")
def obtener_empleados_por_departamento():
    try:
        engine = obtener_engine()
        query = '''
        SELECT d.nombre_departamento AS nombre_departamento, 
               COUNT(e.id_empleado) AS total_empleados
        FROM departamento d
        LEFT JOIN empleado e ON d.id_departamento = e.id_departamento
        GROUP BY d.nombre_departamento
        ORDER BY total_empleados DESC;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/salario-promedio")
def obtener_salario_promedio():
    try:
        engine = obtener_engine()
        query = '''
        SELECT p.nombre_puesto AS nombre_puesto, 
               ROUND((p.salario_min + p.salario_max) / 2, 2) AS salario_promedio
        FROM puesto p
        ORDER BY salario_promedio DESC;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/distribucion-genero")
def obtener_distribucion_genero():
    try:
        engine = obtener_engine()
        query = '''
        SELECT e.genero, COUNT(*) AS cantidad
        FROM empleado e
        GROUP BY e.genero;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/empleados-riesgo-laboral")
def obtener_empleados_por_riesgo():
    try:
        engine = obtener_engine()
        query = '''
        SELECT p.riesgo_laboral AS riesgo_laboral, COUNT(e.id_empleado) AS cantidad
        FROM empleado e
        JOIN puesto p ON e.id_puesto = p.id_puesto
        GROUP BY p.riesgo_laboral
        ORDER BY cantidad DESC;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/presupuesto-vs-empleados")
def obtener_presupuesto_vs_empleados():
    try:
        engine = obtener_engine()
        query = '''
        SELECT d.nombre_departamento AS nombre_departamento, 
               d.presupuesto_anual, 
               COUNT(e.id_empleado) AS total_empleados
        FROM departamento d
        LEFT JOIN empleado e ON d.id_departamento = e.id_departamento
        GROUP BY d.nombre_departamento, d.presupuesto_anual;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))

@app.get("/api/licencias-por-tipo")
def obtener_licencias_por_tipo(year: int = 2023):
    try:
        engine = obtener_engine()
        query = f'''
        SELECT 
            l.tipo_licencia,
            COUNT(*) AS cantidad
        FROM licencia l
        WHERE l.fecha_inicio BETWEEN '{year}-01-01' AND '{year}-12-31'
        GROUP BY l.tipo_licencia
        ORDER BY cantidad DESC;
        '''
        df = pd.read_sql(query, engine)
        return {"data": df.to_dict(orient="records")}
    except Exception as e:
        raise HTTPException(status_code=500, detail=str(e))


# ===============================
# ENDPOINT DE VERIFICACIÓN
# ===============================
@app.get("/test")
def test():
    return {"mensaje": "¡El servidor está funcionando!"}