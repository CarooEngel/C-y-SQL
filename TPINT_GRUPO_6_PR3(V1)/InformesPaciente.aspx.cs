using Entidades;
using Negocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.DataVisualization.Charting;
using System.Web.UI.WebControls;

namespace TPINT_GRUPO_6_PR3_V1_
{
    public partial class InformesPaciente : System.Web.UI.Page
    {
        GestionInformes gInformes = new GestionInformes();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btn_VerInforme_Click(object sender, EventArgs e)
        {
            string desde = txtFecha_Desde.Text.ToString();
            string hasta = txtFecha_Hasta.Text.ToString();

            cargarGrillaAsistencias(desde, hasta);
            cargarGrillaSexo(desde, hasta);
            cargarGrillaEdades(desde, hasta);
            cargarGrillaHorarios(desde, hasta);
        }
        public void cargarGrillaAsistencias(string fechaInicio, string fechaFinal)
        {
            DataTable dt = gInformes.ObtenerInformeAsistencia(fechaInicio, fechaFinal);
            if (dt.Rows.Count > 0)
            {
                chartAsistencias.Series.Clear();
                Series series1 = new Series("Asistencias")
                {
                    ChartType = SeriesChartType.Pie
                };
                chartAsistencias.Series.Add(series1);
                DataPoint dp1 = new DataPoint(0, Convert.ToDouble(dt.Rows[0]["ASISTENCIAS"]));
                dp1.Label = $"Asistencias: {dt.Rows[0]["ASISTENCIAS"]}%";
                series1.Points.Add(dp1);

                DataPoint dp2 = new DataPoint(0, Convert.ToDouble(dt.Rows[0]["INASISTENCIAS"]));
                dp2.Label = $"Inasistencias: {dt.Rows[0]["INASISTENCIAS"]}%";
                series1.Points.Add(dp2);
            }

        }
        public void cargarGrillaSexo(string fechaInicio, string fechaFinal)
        {
            DataTable dt = gInformes.ObtenerInformeSexo(fechaInicio, fechaFinal);
            if (dt.Rows.Count > 0)
            {
                chartSexo.Series.Clear();
                Series series1 = new Series("Sexo")
                {
                    ChartType = SeriesChartType.Pie
                };
                chartSexo.Series.Add(series1);
                DataPoint dp1 = new DataPoint(0, Convert.ToDouble(dt.Rows[0]["FEMENINO"]));
                dp1.Label = $"Femenino: {dt.Rows[0]["FEMENINO"]}%";
                series1.Points.Add(dp1);

                DataPoint dp2 = new DataPoint(0, Convert.ToDouble(dt.Rows[0]["MASCULINO"]));
                dp2.Label = $"Masculino: {dt.Rows[0]["MASCULINO"]}%";
                series1.Points.Add(dp2);
            }

        }
        public void cargarGrillaEdades(string fechaInicio, string fechaFinal)
        {
            DataTable dt = gInformes.ObtenerInformeEdades(fechaInicio, fechaFinal);
            if (dt.Rows.Count > 0)
            {
                chartEdades.Series.Clear();
                Series series1 = new Series("Rangos de Edad")
                {
                    ChartType = SeriesChartType.Column
                };
                chartEdades.Series.Add(series1);
                // Asignar datos a las columnas
                series1.Points.AddXY("0-19", Convert.ToInt32(dt.Rows[0]["0-19"]));
                series1.Points.AddXY("20-39", Convert.ToInt32(dt.Rows[0]["20-39"]));
                series1.Points.AddXY("40-59", Convert.ToInt32(dt.Rows[0]["40-59"]));
                series1.Points.AddXY("60-79", Convert.ToInt32(dt.Rows[0]["60-79"]));
                series1.Points.AddXY("80+", Convert.ToInt32(dt.Rows[0]["80+"]));
                // Opcional: Personalizar la apariencia del gráfico
                series1.IsValueShownAsLabel = true;
                // Remover líneas de fondo
                chartEdades.ChartAreas[0].AxisX.MajorGrid.LineWidth = 0;
                chartEdades.ChartAreas[0].AxisY.MajorGrid.LineWidth = 0;
                // Mostrar valores en las columnas
                chartEdades.ChartAreas[0].AxisX.Title = "Rangos de Edad";
                chartEdades.ChartAreas[0].AxisY.Title = "Cantidad de Personas";
                chartEdades.Titles.Clear();
            }

        }
        public void cargarGrillaHorarios(string fechaInicio, string fechaFinal)
        {
            DataTable dt = gInformes.ObtenerInformeHorarios(fechaInicio, fechaFinal);
            if (dt.Rows.Count > 0)
            {
                chartHorarios.Series.Clear();
                Series series1 = new Series("Horarios de Turnos")
                {
                    ChartType = SeriesChartType.Column
                };
                chartHorarios.Series.Add(series1);
                // Asignar datos a las columnas
                series1.Points.AddXY("6a.m", Convert.ToInt32(dt.Rows[0]["Hora_6"]));
                series1.Points.AddXY("7a.m", Convert.ToInt32(dt.Rows[0]["Hora_7"]));
                series1.Points.AddXY("8a.m", Convert.ToInt32(dt.Rows[0]["Hora_8"]));
                series1.Points.AddXY("9a.m", Convert.ToInt32(dt.Rows[0]["Hora_9"]));
                series1.Points.AddXY("10a.m", Convert.ToInt32(dt.Rows[0]["Hora_10"]));
                series1.Points.AddXY("11a.m", Convert.ToInt32(dt.Rows[0]["Hora_11"]));
                series1.Points.AddXY("12p.m", Convert.ToInt32(dt.Rows[0]["Hora_12"]));
                series1.Points.AddXY("1p.m", Convert.ToInt32(dt.Rows[0]["Hora_13"]));
                series1.Points.AddXY("2p.m", Convert.ToInt32(dt.Rows[0]["Hora_14"]));
                series1.Points.AddXY("3p.m", Convert.ToInt32(dt.Rows[0]["Hora_15"]));
                series1.Points.AddXY("4p.m", Convert.ToInt32(dt.Rows[0]["Hora_16"]));
                series1.Points.AddXY("5p.m", Convert.ToInt32(dt.Rows[0]["Hora_17"]));
                series1.Points.AddXY("6p.m", Convert.ToInt32(dt.Rows[0]["Hora_18"]));
                series1.Points.AddXY("7p.m", Convert.ToInt32(dt.Rows[0]["Hora_19"]));
                series1.Points.AddXY("8p.m", Convert.ToInt32(dt.Rows[0]["Hora_20"]));
                series1.Points.AddXY("9p.m", Convert.ToInt32(dt.Rows[0]["Hora_21"]));
                // Personalizar la apariencia del gráfico
                series1.IsValueShownAsLabel = true; // Mostrar valores en las columnas 
                // Remover líneas de fondo
                chartHorarios.ChartAreas[0].AxisX.MajorGrid.LineWidth = 0;
                chartHorarios.ChartAreas[0].AxisY.MajorGrid.LineWidth = 0;
                // Personalizar el eje X para mostrar menos etiquetas
                chartHorarios.ChartAreas[0].AxisX.Interval = 3;
                // Mostrar etiquetas cada dos horas
                chartHorarios.ChartAreas[0].AxisX.Title = "Horarios";
                chartHorarios.Titles.Clear();
            }
        }
    }
}