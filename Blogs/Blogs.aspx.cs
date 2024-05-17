using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Blogs
{
    public partial class Blogs : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        private void LimpiarComponentes()
        {
            txtTexto.Text = "";
            dropdownAutor.SelectedIndex = 0;
            btnLimpiar.Visible = false;
            btnAgregar.Text = "Agregar";
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            txtTexto.Text = HttpUtility.HtmlDecode(GridView1.SelectedRow.Cells[1].Text);
            dropdownAutor.SelectedValue = GridView1.SelectedRow.Cells[2].Text;
            btnLimpiar.Visible = true;
            btnAgregar.Text = "Actualizar";
        }

        protected void btnFiltrar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = "idAutor = " + dropdownFiltro.SelectedValue;
        }

        protected void BtnDesfiltrar_Click(object sender, EventArgs e)
        {
            SqlDataSource1.FilterExpression = string.Empty;
            SqlDataSource1.FilterParameters.Clear();
        }

        protected void btnLimpiar_Click(object sender, EventArgs e)
        {
            LimpiarComponentes();
        }

        protected void btnAgregar_Click(object sender, EventArgs e)
        {
            if(btnAgregar.Text == "Agregar")
            {
                // insertamos
                SqlDataSource1.Insert();
                GridView1.DataBind();
                LimpiarComponentes();
            }
            else
            {
                // actualizamos
                SqlDataSource1.Update();
                GridView1.DataBind();
                LimpiarComponentes();
            }
            
        }
    }
}