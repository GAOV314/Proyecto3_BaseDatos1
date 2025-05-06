import tkinter as tk
from tkinter import ttk
from tkinter import messagebox
from tkinter import filedialog
from fpdf import FPDF
import requests
import matplotlib.pyplot as plt
from matplotlib.backends.backend_tkagg import FigureCanvasTkAgg
import pandas as pd

class ReportApp:
    def __init__(self, root):
        self.root = root
        self.root.title("Sistema de Reportes Hospitalarios")
        self.root.geometry("1200x800")
        self.current_df = None

        # Frame para selección de reporte
        self.frame_options = ttk.Frame(self.root)
        self.frame_options.pack(padx=10, pady=10, anchor="nw")

        self.selected_report = tk.StringVar()
        self.reports = [
            "Empleados por Departamento",
            "Salario Promedio por Puesto",
            "Distribución por Género",
            "Empleados por Riesgo Laboral",
            "Presupuesto vs Empleados"
        ]
        self.selected_report.set(self.reports[0])

        # Menú desplegable
        ttk.Label(self.frame_options, text="Seleccionar Reporte:").grid(row=0, column=0)
        self.report_menu = ttk.Combobox(
            self.frame_options,
            textvariable=self.selected_report,
            values=self.reports
        )
        self.report_menu.grid(row=0, column=1, padx=5)

        # Botón de generar
        ttk.Button(
            self.frame_options,
            text="Generar Reporte",
            command=self.generate_report
        ).grid(row=0, column=2, padx=5)

        # Frame para mostrar el gráfico
        self.frame_plot = ttk.Frame(self.root)
        self.frame_plot.pack(fill=tk.BOTH, expand=True, padx=10, pady=10)

        # Botones de exportación
        self.export_frame = ttk.Frame(self.root)
        self.export_frame.pack(pady=10)

        ttk.Button(
            self.export_frame,
            text="Exportar a CSV",
            command=self.export_to_csv
        ).pack(side=tk.LEFT, padx=5)

        ttk.Button(
            self.export_frame,
            text="Exportar a PDF",
            command=self.export_to_pdf
        ).pack(side=tk.LEFT, padx=5)

        ttk.Button(
            self.export_frame,
            text="Exportar Gráfico a PDF",
            command=self.export_plot_to_pdf
        ).pack(side=tk.LEFT, padx=5)

    def generate_report(self):
        selected = self.selected_report.get()
        try:
            # Determinar endpoint y parámetros
            if selected == "Empleados por Departamento":
                response = requests.get("http://localhost:8000/api/empleados-departamento")
            elif selected == "Salario Promedio por Puesto":
                response = requests.get("http://localhost:8000/api/salario-promedio")
            elif selected == "Distribución por Género":
                response = requests.get("http://localhost:8000/api/distribucion-genero")
            elif selected == "Empleados por Riesgo Laboral":
                response = requests.get("http://localhost:8000/api/empleados-riesgo-laboral")
            elif selected == "Presupuesto vs Empleados":
                response = requests.get("http://localhost:8000/api/presupuesto-vs-empleados")
            else:
                messagebox.showerror("Error", "Reporte no soportado")
                return

            if response.status_code != 200:
                messagebox.showerror("Error", f"Error en solicitud: {response.text}")
                return

            
            data = response.json()["data"]
            df = pd.DataFrame(data)
            self.current_df = df

            # Limpiar el frame anterior
            for widget in self.frame_plot.winfo_children():
                widget.destroy()

            # Generar gráfico según el reporte
            if selected == "Empleados por Departamento":
                self.plot_bar(df, "nombre_departamento", "total_empleados", "Departamento", "Total Empleados", "Empleados por Departamento")
            elif selected == "Salario Promedio por Puesto":
                self.plot_bar(df, "nombre_puesto", "salario_promedio", "Puesto", "Salario Promedio", "Salario Promedio por Puesto", rot=90)
            elif selected == "Distribución por Género":
                self.plot_pie(df, "genero", "cantidad", "Distribución por Género")
            elif selected == "Empleados por Riesgo Laboral":
                self.plot_bar(df, "riesgo_laboral", "cantidad", "Riesgo Laboral", "Cantidad", "Empleados por Riesgo Laboral")
            elif selected == "Presupuesto vs Empleados":
                self.plot_dual_axis(df, "nombre_departamento", "presupuesto_anual", "total_empleados", "Departamento", "Presupuesto Anual", "Total Empleados", "Presupuesto vs Empleados")

        except Exception as e:
            messagebox.showerror("Error", f"Ocurrió un error: {str(e)}")

    def plot_bar(self, df, x_col, y_col, x_label, y_label, title, rot=0):
        fig, ax = plt.subplots(figsize=(12, 6))
        df.plot(kind="bar", x=x_col, y=y_col, ax=ax)
        ax.set_xlabel(x_label)
        ax.set_ylabel(y_label)
        ax.set_title(title)
        ax.tick_params(axis="x", rotation=rot)
        canvas = FigureCanvasTkAgg(fig, master=self.frame_plot)
        canvas.draw()
        canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)

    def plot_pie(self, df, labels_col, values_col, title):
        fig, ax = plt.subplots(figsize=(8, 8))
        df.plot(kind="pie", 
                labels=df[labels_col],
                y=values_col,
                autopct='%1.1f%%',
                startangle=90,
                ax=ax)
        ax.set_title(title)
        ax.axis('equal')
        canvas = FigureCanvasTkAgg(fig, master=self.frame_plot)
        canvas.draw()
        canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)

    def plot_dual_axis(self, df, x_col, y1_col, y2_col, x_label, y1_label, y2_label, title):
        fig, ax1 = plt.subplots(figsize=(12, 6))
        ax2 = ax1.twinx()
        df.plot(kind="bar", x=x_col, y=y1_col, ax=ax1, color="blue", alpha=0.5, label=y1_label)
        df.plot(kind="line", x=x_col, y=y2_col, ax=ax2, color="red", marker="o", label=y2_label)
        
        ax1.set_xlabel(x_label)
        ax1.set_ylabel(y1_label, color="blue")
        ax2.set_ylabel(y2_label, color="red")
        ax1.set_title(title)
        fig.legend(loc="upper right")
        canvas = FigureCanvasTkAgg(fig, master=self.frame_plot)
        canvas.draw()
        canvas.get_tk_widget().pack(side=tk.TOP, fill=tk.BOTH, expand=True)


    def export_to_csv(self):
        """Exportar el reporte actual a CSV."""
        if self.current_df is None:
            messagebox.showwarning("Advertencia", "Genera un reporte primero.")
            return

        file_path = filedialog.asksaveasfilename(
            defaultextension='.csv',
            filetypes=[('Archivos CSV', '*.csv')]
        )
        if file_path:
            self.current_df.to_csv(file_path, index=False)
            messagebox.showinfo("Éxito", f"Archivo guardado en {file_path}")

    def export_to_pdf(self):
        """Exportar el reporte actual a PDF."""
        if self.current_df is None:
            messagebox.showwarning("Advertencia", "Genera un reporte primero.")
            return

        file_path = filedialog.asksaveasfilename(
            defaultextension='.pdf',
            filetypes=[('Archivos PDF', '*.pdf')]
        )
        if file_path:
            # Crear PDF con FPDF
            pdf = FPDF()
            pdf.add_page()
            pdf.set_font("Arial", size=12)

            # Encabezados
            cell_width = pdf.w / len(self.current_df.columns) - 5
            for col in self.current_df.columns:
                pdf.cell(cell_width, 10, str(col), 1, 0, "C")
            pdf.ln()

            # Datos
            for _, row in self.current_df.iterrows():
                for data in row:
                    pdf.cell(cell_width, 10, str(data), 1, 0, "C")
                pdf.ln()

            pdf.output(file_path)
            messagebox.showinfo("Éxito", f"Archivo guardado en {file_path}")

    def export_plot_to_pdf(self):
        if hasattr(self, 'current_fig'):
            file_path = filedialog.asksaveasfilename(
                defaultextension='.pdf',
                filetypes=[('Archivos PDF', '*.pdf')]
            )
            if file_path:
                self.current_fig.savefig(file_path, format='pdf')
                messagebox.showinfo("Éxito", f"Archivo guardado en {file_path}")

if __name__ == "__main__":
    root = tk.Tk()
    app = ReportApp(root)
    root.mainloop()