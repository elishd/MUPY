<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="lo.aspx.vb" Inherits="MUPIS.lo" %>

<!DOCTYPE html>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="Contenidos/css/bootstrap.min.css" rel="stylesheet" />
    <link href="Contenidos/css/bootstrap.css" rel="stylesheet" />
    <link href="Contenidos/css/estilo.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <style type="text/css">
        .auto-style1 {
            margin: auto;
            float: left;
            width: 457px;
            height: 600px;
        }
        .auto-style2 {
            margin: auto;
            float: left;
            width: 421px;
            height: 600px;
        }
        .auto-style5 {
            text-align: center;
        }
        .auto-style6 {
            margin: auto;
            float: left;
            width: 450px;
            height: 600px;
            background-color: transparent;
            text-align: center;
        }
        .auto-style7 {
            margin-top: 20px;
            width: 400px;
            height: 600px;
            background: url('Contenidos/Imagenes/led.png') center;
            text-align: center;
            margin-left: auto;
            margin-right: auto;
            margin-bottom: auto;
        }
        .auto-style8 {
            text-align: left;
        }
        .auto-style9 {
            margin: auto;
            display: block;
            font-size: 1rem;
            line-height: 1.5;
            color: #495057;
            -webkit-background-clip: padding-box;
            background-clip: padding-box;
            border-radius: 0.25rem;
            -webkit-transition: border-color ease-in-out .15s, -webkit-box-shadow ease-in-out .15s;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
            -o-transition: border-color ease-in-out .15s, box-shadow ease-in-out .15s;
            border: 1px solid #ced4da;
            background-color: #fff;
            background-image: none;
        }
        </style>
</head>
<body id="cuerpo">
    <form id="form1" runat="server" class="auto-style1">
        <br />
        <br />
        <table>
            <tr>
                <td></td>
                <td><div class="auto-style6">    
                    <asp:Image ID="Image3" runat="server" Height="98px" ImageUrl="~/Contenidos/Imagenes/logo.jpg" Width="393px" />
                    <br />
                    <br />
                    <h2 id="lema" class="auto-style5">Somos la herramienta de publicidad para tus ideas</h2>
                    </div></td>
                <td><div class="auto-style2"></div></td>
                <td><div class="auto-style7">
<br />
<br />
<br />
<br />
	<table id="log">
        <tr><td rowspan="2" class="auto-style8">
            <asp:Image ID="Image1" runat="server" Height="85px" ImageUrl="~/Contenidos/Imagenes/usuario01.png" Width="85px" />
		    </td><td class="auto-style8">
                <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Usuario:"></asp:Label></td></tr>
	<tr>
		<td class="auto-style8">
            <asp:TextBox ID="TextBox1" runat="server" Width="209px" CssClass="auto-style9" Height="33px" Font-Size="Large"></asp:TextBox>

		</td>
	</tr>
        <tr><td rowspan="2" class="auto-style8">
            <asp:Image ID="Image2" runat="server" Height="85px" ImageUrl="~/Contenidos/Imagenes/candado01.png" Width="85px" /> 
            </td><td class="auto-style8">
                <asp:Label ID="Label2" runat="server" Font-Size="Large" Text="Contraseña:"></asp:Label></td></tr>
	<tr>
		<td class="auto-style8">
            <asp:TextBox ID="TextBox2" runat="server" Width="209px" Height="33px" Font-Size="Large" CssClass="auto-style9"></asp:TextBox>
        </td>
	</tr>
</table>
<br />
<br />
    <asp:Button ID="Button2" runat="server" Text="Iniciar sesión" Height="39px" Width="226px" />
                    </div></td>
            </tr>
        </table>
    </form>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/bootstrap.js"></script>
</body>
</html>
